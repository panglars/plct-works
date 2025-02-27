测试在 TH1520 LicheePi 4A 平台上使用 llama.cpp 对 deepseek R1 8B 量化模型进行性能测试，对比是否启用 RVV 0.7.1 指令集的差异。

## llama 8B 模型

### 4 线程测试(gcv0p7)

```
| model                          |       size |     params | backend    | threads |          test |                  t/s |
| ------------------------------ | ---------: | ---------: | ---------- | ------: | ------------: | -------------------: |
| llama 8B Q4_K - Medium         |   4.58 GiB |     8.03 B | BLAS       |       4 |         pp512 |          0.79 ± 0.01 |
| llama 8B Q4_K - Medium         |   4.58 GiB |     8.03 B | BLAS       |       4 |         tg128 |          0.12 ± 0.00 |
``` 


### 4 线程测试(gc)

```
| model                          |       size |     params | backend    | threads |          test |                  t/s |
| ------------------------------ | ---------: | ---------: | ---------- | ------: | ------------: | -------------------: |
| llama 8B Q4_K - Medium         |   4.58 GiB |     8.03 B | BLAS       |       4 |         pp512 |          0.52 ± 0.00 |
| llama 8B Q4_K - Medium         |   4.58 GiB |     8.03 B | BLAS       |       4 |         tg128 |          0.12 ± 0.00 |
``` 
