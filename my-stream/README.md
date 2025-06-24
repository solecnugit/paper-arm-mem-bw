# Comparison of Software and Hardware Memory Bandwidth of STREAM

This directory contains the source code used to compare STREAM software and hardware memory bandwidth. 
They can be used to reproduce the experimental results of Fig. 2 in the paper. 

This directory contains two files: 
- `stream.c` modified and instrumented STREAM source code
- `Makefile` to compile the source code and generate four binaries: `stream_copy`, `stream_scale`, `stream_add`, and `stream_triad`

## Modification compared to the original STREAM

In order to compare the software and hardware memory bandwidth, we made the following modifications based on the original STREAM: 

1. The original STREAM sequentially performs four kinds of element-wise kernel (COPY, SCALE, SUM, and TRAID) on two or three arrays whose length is far beyond the LLC's capacity (defined in marco `STREAM_ARRAY_SIZE`). The test will be conducted multiple times (defined in marco `NTIMES`). 
To make the comparison clear, we modified the original STREAM to make it execute only one specified kernel per test instead of four kernels in sequence. For each kernel, we repeated the test 100 times. 
2. We instrumented the source code of STREAM using `perf_event_open()` to measure the average hardware memory bandwidth except for the first test. The hardware memory bandwidth was from the PMU of the memory controller (Arm DMC-620) and the corresponding software memory bandwidth was from the output of STREAM.

The modifications are marked with comments. 
Note that our modifications do not affect the logic of STREAM for calculating memory bandwidth. 

## Setups

The experimental results in the paper were conducted on a dual-socket server equipped with Ampere Altra processors. 
To achieve maximum bandwidth, the number of OpenMP threads was 64 by setting the `OMP_NUM_THREADS` environment variable to 64. 

> [!NOTE]
> If you are not running this experiment on an Ampere Altra processor, you may need to modify the implementation of the instrumentation function because different processors may use different memory controllers. Also, the `OMP_NUM_THREADS` environment variable may need to be adjusted. 

Please run this experiment without interference from other processes.

## Usage

If you want to reproduce this experiment, please compile the binary file using the provided Makefile.

```
$ make all
```

After that, four binary files will be generated in the same directory. 

Execute the binary file. After execution, the software memory bandwidth and hardware memory bandwidth measured for the corresponding STREAM kernel will be output to the terminal. 
For example, 

```
$ ./stream_add

...
-------------------------------------------------------------
Function        Avg Bandwidth
Add:       110841.10
-------------------------------------------------------------
Device: arm_dmc620_10008c000, Type: 92, Read Count: 1983213529, Write Count: 972493295
Device: arm_dmc620_50008c400, Type: 101, Read Count: 54532210, Write Count: 21894824
Device: arm_dmc620_50008cc00, Type: 103, Read Count: 54416718, Write Count: 21335876
Device: arm_dmc620_10008d800, Type: 98, Read Count: 1983116654, Write Count: 972459667
Device: arm_dmc620_50008c000, Type: 100, Read Count: 54717066, Write Count: 22065906
Device: arm_dmc620_10008d400, Type: 97, Read Count: 1983029623, Write Count: 972426275
Device: arm_dmc620_50008d800, Type: 106, Read Count: 54781253, Write Count: 22035133
Device: arm_dmc620_10008dc00, Type: 99, Read Count: 1983050077, Write Count: 972546731
Device: arm_dmc620_10008c800, Type: 94, Read Count: 1983121545, Write Count: 972406465
Device: arm_dmc620_10008d000, Type: 96, Read Count: 1983169414, Write Count: 972566717
Device: arm_dmc620_50008d400, Type: 105, Read Count: 54603011, Write Count: 21530425
Device: arm_dmc620_10008c400, Type: 93, Read Count: 1982991961, Write Count: 972361776
Device: arm_dmc620_50008dc00, Type: 107, Read Count: 54883049, Write Count: 22015324
Device: arm_dmc620_50008c800, Type: 102, Read Count: 54750173, Write Count: 21886761
Device: arm_dmc620_10008cc00, Type: 95, Read Count: 1983404529, Write Count: 972802702
Device: arm_dmc620_50008d000, Type: 104, Read Count: 54648888, Write Count: 21736735
Hardware bandwidth:    113159.59 MB/s 
Solution Validates:     avg error less than 1.000000e-13 on all arrays
```

For the kernel ADD, 

- Software memory bandwidth measured by STREAM = 110841.10 MB/s 
- Hardware memory bandwidth measured by memory controller PMUs = 113159.59 MB/s. 

To clean the binary, 

```
$ make clean
```

We manually recorded the hardware and software bandwidth measurements of the four kernels using the script `figures/sw_hw_bw_stream.ipynb` to obtain Fig. 2 in the paper.