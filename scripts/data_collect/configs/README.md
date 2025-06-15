# Using `monitor_wrapper` to collect hardware performance events while running SPEC CPU 2017

These configs are modified based on the default config `Example-gcc-linux-aarch64.cfg` provided by SPEC CPU 2017. 

To ensure that only the actual execution of the workload was measured, while excluding noise from preprocessing and post-processing phases, we employed the monitor wrapper hooker provided by SPEC CPU 2017 to trigger data collection at precise moments, as shown at the end of each config. 

> See https://www.spec.org/cpu2017/Docs/monitors.html#monitor_wrapper

- `mem_bw_watchpoint.cfg` based on network-on-chip traffic monitoring via Watchpoint from Arm CMN PMUs
- `mem_bw_mc.cfg` based on memory controller (Arm DMC-620) PMUs
- `mem_bw_mr.cfg` based on memory requests from Arm CMN PMUs
- `mem_bw_llc.cfg` based on LLC misses from Arm CMN PMUs 