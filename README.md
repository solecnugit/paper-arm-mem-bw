# Memory Bandwidth Measurements for Arm-based Processors

This repository contains the data and scripts for the paper 

> Tong-yu Liu, Huanlun Cheng, Erqi E, Ning Li, Haoyu Liao, Bo Huang, and Jianmei Guo. 2025. Fragmentation Harmonization for the Arm Ecosystem: A Unified Method to Measure Memory Bandwidth via Network-on-Chip. (Under review)

> [!NOTE]
> This code repository is still under construction. 

The structure of this repository is as follows: 

- `data`
  - `perf.data.stream` The raw event counts for monitoring data traffic when running STREAM on Ampere Altra
- `figures` figures and the scripts for generating them in the paper 
  - `sw_hw_bw_stream.ipynb` Fig. 2. Comparison of Software and Hardware Memory Bandwidth of STREAM
  - `clustering_data_traffic` Fig. 7. $k$-Means Clustering for Device Port Data Traffic of STREAM on Ampere Altra

...