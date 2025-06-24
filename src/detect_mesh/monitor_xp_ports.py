from detect_mesh import MXP, Mesh, Device
import subprocess
import os
import pandas as pd
from sklearn.cluster import KMeans

mesh = Mesh(8, 6)
mesh.detect_mxp()

perf_events = []

for mxp in mesh:
    perf_events.append(f'arm_cmn_0/mxp_p0_dat_txflit_valid,bynodeid=1,nodeid={mxp.get_hex_nodeid()}/')
    perf_events.append(f'arm_cmn_0/mxp_p1_dat_txflit_valid,bynodeid=1,nodeid={mxp.get_hex_nodeid()}/')

os.makedirs('./data', exist_ok=True)

cpu_num = 80

for dst in range(2, cpu_num, 2):
    perf_command = f'3>./data/perf.data.{dst} perf stat -e {",".join(perf_events)} -a -x";" --log-fd 3 -- ./benchmark --num-iterations 5000 --num-samples 5000 -c 0,{dst}'
    subprocess.run(perf_command, shell=True)
    
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
            
            mxp = mesh.get_mxp_by_hex_nodeid(nodeid)
            if port == 0:
                mxp.p0 = Device.RNF
            else:
                mxp.p1 = Device.RNF
    else:
        print(f'Failed to analyze CPU pair (0, {dst})')

perf_command = f'3>./data/perf.data.stream perf stat -e {",".join(perf_events)} -a -x";" --log-fd 3 -- numactl --cpubind=0 --membind=0 ./stream_c.exe'
subprocess.run(perf_command, shell=True)

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
    
    mxp = mesh.get_mxp_by_hex_nodeid(nodeid)
    if port == 0:
        mxp.p0 = Device.SNF
    else:
        mxp.p1 = Device.SNF

mesh.show_mesh()
