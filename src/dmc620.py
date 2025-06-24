import os
import fnmatch

def get_dmc620_devices() -> list:
    """Search /sys/devices/ and return all dmc620 devices

    Returns:
        list: the names of all dmc620 devices
    """
    device_directory = '/sys/devices'
    matching_devices = []
    
    for root, dirs, files in os.walk(device_directory):
        for dir_name in dirs:
            if fnmatch.fnmatch(dir_name, '*_dmc620_*'):
                matching_devices.append(dir_name)
                
    matching_devices.sort(key=lambda x: int(x[9:], base=16))
    
    return matching_devices

def get_dmc620_perf_events(dmc620_devices: list) -> str:
    """Get the perf event string (-e option) of all dmc620 devices

    Args:
        dmc620_devices (list): the names of all dmc620 devices

    Returns:
        str: the perf event string
    """
    return ','.join(
        list(map(lambda x: x + '/clkdiv2_rdwr,mask=1,match=0/', dmc620_devices)) +   # read
        list(map(lambda x: x + '/clkdiv2_rdwr,mask=1,match=1/', dmc620_devices))     # write
        )

if __name__ == "__main__":
    dmc620_devices = get_dmc620_devices()
    for device in dmc620_devices:
        print(device)
    
    print(f'number of dmc620 devices: {len(dmc620_devices)}')
    
    print(f'3>./dmc620.csv perf stat -C 0 -e {get_dmc620_perf_events(dmc620_devices)} -x"|" -I 1000 --log-fd 3 -- sleep 5')