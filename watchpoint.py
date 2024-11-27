def get_watchpoint_perf_events(snf_nodeid: list) -> str:
    return ','.join(
        list(map(lambda x: f'arm_cmn_0/watchpoint_up,bynodeid=1,nodeid={x},wp_dev_sel=0x0,wp_chn_sel=0x3,wp_grp=0,wp_val=0,wp_mask=0xffffffffffffffff/', snf_nodeid)) + # socket 0, upstream
        list(map(lambda x: f'arm_cmn_0/watchpoint_down,bynodeid=1,nodeid={x},wp_dev_sel=0x0,wp_chn_sel=0x3,wp_grp=0,wp_val=0,wp_mask=0xffffffffffffffff/', snf_nodeid)) + # socket 0, downstream
        list(map(lambda x: f'arm_cmn_1/watchpoint_up,bynodeid=1,nodeid={x},wp_dev_sel=0x0,wp_chn_sel=0x3,wp_grp=0,wp_val=0,wp_mask=0xffffffffffffffff/', snf_nodeid)) + # socket 1, upstream
        list(map(lambda x: f'arm_cmn_1/watchpoint_down,bynodeid=1,nodeid={x},wp_dev_sel=0x0,wp_chn_sel=0x3,wp_grp=0,wp_val=0,wp_mask=0xffffffffffffffff/', snf_nodeid)) # socket 1, downstream
        )
    
if __name__ == "__main__":
    snf_nodeid = ['0x8', '0x10', '0x18', '0x20', '0x1c8', '0x1d0', '0x1d8', '0x1e0']
    
    print(f'3>./watchpoint.csv perf stat -e {get_watchpoint_perf_events(snf_nodeid)} -x"|" -I 1000 --log-fd 3 -- sleep 5')