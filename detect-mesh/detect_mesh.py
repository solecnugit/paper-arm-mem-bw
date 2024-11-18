import subprocess
from enum import Enum, auto

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
    
    def __iter__(self):
        self._x_pos = 0
        self._y_pos = 0
        return self
    
    def __next__(self):
        if self._x_pos >= self.x_size:
            self._x_pos = 0
            self._y_pos += 1
        if self._y_pos >= self.y_size:
            raise StopIteration
        result = self.grid[self._x_pos][self._y_pos]
        self._x_pos += 1
        return result
            
    def detect_mxp(self) -> None:
        for mxp in self:
            perf_command = f'perf stat -e arm_cmn_0/mxp_n_dat_txflit_valid,bynodeid=1,nodeid={mxp.get_hex_nodeid()}/ -a -x";" -- true'
            perf_result = subprocess.run(perf_command, stderr=subprocess.PIPE, text=True, shell=True).stderr
            if 'supported' in perf_result.split(';')[0]:
                mxp.is_exist = False
            else:
                mxp.is_exist = True
                
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
    mesh.show_mesh()