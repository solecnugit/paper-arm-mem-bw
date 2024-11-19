# 内存带宽测量实验数据采集

这个实验测的是实验室arm服务器在SPEC_CPU 2017的benchmark负载下通过dmc_620内存控制器采集到得内存带宽。

## 过程

### 负载

负载是SPEC_CPU 2017中的所有23个rate的benchmark。对应每个单独的负载都采集了一次。参数：size=ref ,action=onlyrun，只跑了base模式。config文件是mem_bw.cfg。

这次采集和第一次采集主要的区别是使用 SPEC_CPU 的 monitor_wrapper 功能采集了更严谨的数据。这样可以绕开负载开始之前的预处理操作和负载结束后的后处理导致的内存数据。

monitor_wrapper 方法监控的粒度是每一条负载运行指令。由于每个benchmark都可能包含若干条指令，所以为了区分每一条指令产生的数据，将数据命名为 `fileName = ${benchmark}_iter${iter}_\$(date +%s).csv` 。最后用每一条指令执行的自1970年以来的秒数作为哈希码区分每个benchmark中的不同指令。

在这次采集中perf命令放在 `mem_bw.cfg` 里定义的monitor wrapper中。

### 相关文件

都放到`./file/`里了。

采集数据的命令在`full_test.sh`里。

处理数据的脚本是`analyze.ipynb`。

实验过程中的输出是 `nohup.out` ,可以看到负载的情况。

### 其他

这些脚本跑的时候不是按这个组织结构放的，所以真的要用的话得注意把路径调好。

## 结果

采集到的原始csv数据放在`data/csv`里。绘制的图片放在`data/images` 里。

	PS：前几个跑的挺快的，采集频率需要再高一点吗？