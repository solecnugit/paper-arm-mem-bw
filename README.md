# Memory Bandwidth Measurements for Arm-based Processors

This repository contains the data and scripts for the paper 

> Tong-yu Liu, Huanlun Cheng, Erqi E, Ning Li, Haoyu Liao, Bo Huang, and Jianmei Guo. 2025. Fragmentation Harmonization for the Arm Ecosystem: A Unified Method to Measure Memory Bandwidth via Network-on-Chip. (Under review)

> [!NOTE]
> This code repository is still under construction. 

The structure of this repository is as follows: 

- `scripts`
  - `data_collect` configs and scripts to run SPEC CPU 2017 while collecting performance data, including different memory bandwidth measurement methods: 
    - `mem_bw_watchpoint.cfg` based on network-on-chip traffic monitoring via Watchpoint from Arm CMN PMUs
    - `mem_bw_mc.cfg` based on memory controller (Arm DMC-620) PMUs
    - `mem_bw_mr.cfg` based on memory requests from Arm CMN PMUs
    - `mem_bw_llc.cfg` based on LLC misses from Arm CMN PMUs 
- `src`
  - `my_stream` modified and instrumented STREAM source code for comparing software and hardware memory bandwidth
  - `detect_mesh` scripts and benchmarks to conduct PMU-data-driven detection for the physical location of memory controllers 
  - `dmc620.py` to generate Linux perf command for measuring memory bandwidth via Arm DMC-620 PMUs
  - `watchpoint.py` to generate Linux perf command for measuring memory bandwidth based on Watchpoint 
- `data`
  - `spec_cpu` the raw event counts from Linux perf, in CSV
    - `watchpoint`
    - `mc`
    - `mr`
    - `llc`
  - `perf.data.stream` the raw event counts for monitoring data traffic when running STREAM on Ampere Altra
- `figures` figures and the scripts for generating them in the paper 
  - `sw_hw_bw_stream.ipynb` Fig. 2. Comparison of Software and Hardware Memory Bandwidth of STREAM
  - `clustering_data_traffic.ipynb` Fig. 7. $k$-Means Clustering for Device Port Data Traffic of STREAM on Ampere Altra

...