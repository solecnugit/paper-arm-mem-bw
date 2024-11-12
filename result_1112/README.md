# 内存带宽测量实验数据采集

这个实验测的是实验室arm服务器在SPEC_CPU 2017的benchmark负载下通过dmc_620内存控制器采集到得内存带宽。

## 过程

### 负载

负载是SPEC_CPU 2017中的所有23个rate的benchmark。对应每个单独的负载都采集了一次。参数：size=ref ,action=onlyrun，只跑了base模式。config文件是mem_bw.cfg。

### 相关文件

都放到`./file/`里了。

采集数据的perf命令在`full_test.sh`里。

处理数据的脚本是`analyze.ipynb`。

实验过程中的输出是 `nohup.out` ,可以看到负载的情况。

### 其他

这些脚本跑的时候不是按这个组织结构放的，所以真的要用的话得注意把路径调好。

## 结果

采集到的原始csv数据放在`data/full_test`里。绘制的图片放在`data/images` 里。

	PS：因为是第一次跑所以每次benchmark之前都有一个编译过程（除了perl_bench,因为之前跑着试了几次），导致在实验开始的非常小的一段时间里其实不是benchmark的内存行为。但是时间非常短而且带宽非常小。