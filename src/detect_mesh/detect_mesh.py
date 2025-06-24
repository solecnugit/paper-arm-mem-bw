import subprocess
from enum import Enum, auto
from typing import Generator
import logging
import re
import os
import pandas as pd
from sklearn.cluster import KMeans

logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class Device(Enum):
    RNF = auto()
    SNF = auto()
    UNKNOWN = auto()

class MXP:
    def __init__(self, x_pos: int, y_pos: int) -> None:
        self.x_pos: int = x_pos
        self.y_pos: int = y_pos
        
        self.is_exist: bool = False
        
        self.p0 = Device.UNKNOWN
        self.p1 = Device.UNKNOWN
        
    def get_tuple(self) -> str:
        return f'({self.x_pos},{self.y_pos})'
    
    def get_hex_nodeid(self) -> str:
        return hex((self.x_pos << 6) | (self.y_pos << 3))
    
class Mesh:
    def __init__(self, x_size: int = 8, y_size: int = 8) -> None:
        self.x_size: int = x_size
        self.y_size: int = y_size
        
        self.grid = []
        for x_pos in range(0, x_size):
            line = []
            for y_pos in range(0, y_size):
                mxp = MXP(x_pos, y_pos)
                line.append(mxp)
            self.grid.append(line)
            
        self.mxp_detected: bool = False
    
    def iter_mxps(self) -> Generator[MXP, None, None]:
        for x_pos in range(0, self.x_size):
            for y_pos in range(0, self.y_size):
                yield self.grid[x_pos][y_pos]
    
    def detect_mxp(self) -> None:
        max_x_pos = 0
        max_y_pos = 0
        
        for mxp in self.iter_mxps():
            perf_command = f'perf stat -e arm_cmn_0/mxp_n_dat_txflit_valid,bynodeid=1,nodeid={mxp.get_hex_nodeid()}/ -a -x";" -- true'
            perf_result = subprocess.run(perf_command, stderr=subprocess.PIPE, text=True, shell=True).stderr
            if 'supported' in perf_result.split(';')[0]:
                logging.debug(f'XP ({mxp.x_pos},{mxp.y_pos}) does not exist.')
                mxp.is_exist = False
            else:
                logging.debug(f'Detect XP ({mxp.x_pos},{mxp.y_pos}).')
                
                mxp.is_exist = True
                if mxp.x_pos > max_x_pos:
                    max_x_pos = mxp.x_pos
                if mxp.y_pos > max_y_pos:
                    max_y_pos = mxp.y_pos
        
        self.x_size = max_x_pos + 1
        self.y_size = max_y_pos + 1
        self.mxp_detected = True
        logging.info(f'Detected mesh size: {self.x_size} * {self.y_size}.')
        
    def get_monitor_mesh_port_perf_events(self) -> str:
        perf_events = []
        
        for mxp in self.iter_mxps():
            perf_events.append(f'arm_cmn_0/mxp_p0_dat_txflit_valid,bynodeid=1,nodeid={mxp.get_hex_nodeid()}/')
            perf_events.append(f'arm_cmn_0/mxp_p1_dat_txflit_valid,bynodeid=1,nodeid={mxp.get_hex_nodeid()}/')
            
        return ",".join(perf_events)
    
    def get_socket_0_cpus(self) -> list[int]:
        numactl_result = subprocess.run(['numactl', '-H'], stdout=subprocess.PIPE, text=True).stdout
        match = re.search(r'node 0 cpus: (.+)', numactl_result)
        if match:
            cpu_list = match.group(1).split()
            return [int(cpu) for cpu in cpu_list]
        else:
            return []
        
    def detect_rnf(self) -> None:
        if not self.mxp_detected:
            logging.error(f'use detect_mxp() to detect all XPs first.')
            return
        
        cpu_list = self.get_socket_0_cpus()
        if not cpu_list:
            logging.error('Unable to find CPU ids on socket 0.')
            return
        
        os.makedirs('./data', exist_ok=True)
        
        src = cpu_list[0]
        for dst in cpu_list[2::2]:
            logging.info(f'CPU {src} <-> CPU {dst}')
            
            perf_command = f'3>./data/perf.data.{dst} perf stat -e {self.get_monitor_mesh_port_perf_events()} -a -x";" --log-fd 3 -- ./benchmark/c2c --num-iterations 5000 --num-samples 5000 -c {src},{dst}'
            subprocess.run(perf_command, stdout=subprocess.PIPE, text=True, shell=True)
            
            file_path = f'data/perf.data.{dst}'
            perf_data= pd.read_csv(file_path, sep=';', header=None, names=['count', 'event_name'], usecols=[0, 2])
            
            event_counts = perf_data.iloc[:, 0].values.reshape(-1, 1)
            kmeans = KMeans(n_clusters=2, random_state=0).fit(event_counts)
            labels = kmeans.labels_

            perf_data['label'] = labels
            
            label_counts = perf_data['label'].value_counts()
            least_common_label = label_counts.idxmin()

            selected_perf_data = perf_data[perf_data['label'] == least_common_label]
            
            if selected_perf_data.shape[0] == 2:
                for index, row in selected_perf_data.iterrows():
                    event_name: str = row['event_name']
                    port = int(event_name[15])
                    nodeid = event_name.split('/')[1].split(',')[2][7:]
                    
                    mxp = self.get_mxp_by_hex_nodeid(nodeid)
                    if port == 0:
                        mxp.p0 = Device.RNF
                    else:
                        mxp.p1 = Device.RNF
                    
                    logging.info(f'Detect RNF on node {nodeid} ({mxp.x_pos},{mxp.y_pos}), port {port}')
            else:
                logging.error(f'Failed to analyze CPU pair ({src}, {dst})')
                
    def detect_snf(self) -> None:
        if not self.mxp_detected:
            logging.error(f'use detect_mxp() to detect all XPs first.')
            return
        
        os.makedirs('./data', exist_ok=True)
        
        perf_command = f'3>./data/perf.data.stream perf stat -e {self.get_monitor_mesh_port_perf_events()} -a -x";" --log-fd 3 -- numactl --cpubind=0 --membind=0 .benchmark/stream'
        subprocess.run(perf_command, stdout=subprocess.PIPE, text=True, shell=True)

        file_path = f'data/perf.data.stream'
        perf_data= pd.read_csv(file_path, sep=';', header=None, names=['count', 'event_name'], usecols=[0, 2])

        event_counts = perf_data.iloc[:, 0].values.reshape(-1, 1)
        kmeans = KMeans(n_clusters=4, random_state=0).fit(event_counts)
        labels = kmeans.labels_

        perf_data['label'] = labels

        label_counts = perf_data['label'].value_counts()
        least_common_label = label_counts.idxmin()

        selected_perf_data = perf_data[perf_data['label'] == least_common_label]

        for index, row in selected_perf_data.iterrows():
            event_name: str = row['event_name']
            port = int(event_name[15])
            nodeid = event_name.split('/')[1].split(',')[2][7:]
            
            mxp = self.get_mxp_by_hex_nodeid(nodeid)
            if port == 0:
                mxp.p0 = Device.SNF
            else:
                mxp.p1 = Device.SNF
                
            logging.info(f'Detect SNF on node {nodeid} ({mxp.x_pos},{mxp.y_pos}), port {port}')
                
    def get_mxp_by_hex_nodeid(self, hex_nodeid: str) -> MXP:
        dec_value = int(hex_nodeid, 16)
        x_pos = (dec_value & 0b111000000) >> 6
        y_pos = (dec_value & 0b111000) >> 3
        return self.grid[x_pos][y_pos]
            
    def show_mesh(self) -> None:
        horizontal_line: str = '-' * (9 * self.x_size + 1 * (self.x_size + 1))
        
        for y_pos in range(self.y_size - 1, -1, -1):
            print(horizontal_line)
            
            print('|', end='')
            for x_pos in range(0, self.x_size):
                print(f'{self.grid[x_pos][y_pos].get_tuple():^9}', end='')
                print('|', end='')
            print('')
            
            print('|', end='')
            for x_pos in range(0, self.x_size):
                print(f'{self.grid[x_pos][y_pos].get_hex_nodeid():^9}', end='')
                print('|', end='')
            print('')
            
            print('|', end='')
            for x_pos in range(0, self.x_size):
                print(f'{ "XP" if self.grid[x_pos][y_pos].is_exist else "":^9}', end='')
                print('|', end='')
            print('')
            
            print('|', end='')
            for x_pos in range(0, self.x_size):
                print(f'{ self.grid[x_pos][y_pos].p0.name:^9}', end='')
                print('|', end='')
            print('')
            
            print('|', end='')
            for x_pos in range(0, self.x_size):
                print(f'{ self.grid[x_pos][y_pos].p1.name:^9}', end='')
                print('|', end='')
            print('')
            
        print(horizontal_line)


if __name__ == '__main__':
    mesh = Mesh(8, 8)
    mesh.detect_mxp()
    mesh.detect_rnf()
    mesh.detect_snf()
    mesh.show_mesh()