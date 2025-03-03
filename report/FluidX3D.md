## Install


## SG2042

### benchmark
```
debian@revyos-pioneer:~/FluidX3D$ ./make.sh 
Info: Detected Operating System: Linux
Info: Compiling with 64 CPU cores.
g++ -c src/lbm.cpp -o temp/lbm.o -std=c++17 -pthread -O -Wno-comment -I./src/OpenCL/include
g++ -c src/setup.cpp -o temp/setup.o -std=c++17 -pthread -O -Wno-comment -I./src/OpenCL/include
g++ temp/*.o -o bin/FluidX3D -std=c++17 -pthread -O -Wno-comment -I./src/OpenCL/include -L./src/OpenCL/lib -lOpenCL  
/usr/bin/ld: skipping incompatible ./src/OpenCL/lib/libOpenCL.so when searching for -lOpenCL
.-----------------------------------------------------------------------------.
|                       ______________   ______________                       |
|                       \   ________  | |  ________   /                       |
|                        \  \       | | | |       /  /                        |
|                         \  \      | | | |      /  /                         |
|                          \  \     | | | |     /  /                          |
|                           \  \_.-"  | |  "-._/  /                           |
|                            \    _.-" _ "-._    /                            |
|                             \.-" _.-" "-._ "-./                             |
|                               .-"  .-"-.  "-.                               |
|                               \  v"     "v  /                               |
|                                \  \     /  /                                |
|                                 \  \   /  /                                 |
|                                  \  \ /  /                                  |
|                                   \  '  /                                   |
|                                    \   /                                    |
|                                     \ /                FluidX3D Version 3.1 |
|                                      '     Copyright (c) Dr. Moritz Lehmann |
|-----------------------------------------------------------------------------|
|----------------.------------------------------------------------------------|
| Device ID    0 | cpu                                                        |
|----------------'------------------------------------------------------------|
|----------------.------------------------------------------------------------|
| Device ID      | 0                                                          |
| Device Name    | cpu                                                        |
| Device Vendor  | PoCL Project                                               |
| Device Driver  | 6.1-pre main-0-ga4799460f (Linux)                          |
| OpenCL Version | OpenCL C 3.0                                               |
| Compute Units  | 64 at 0 MHz (32 cores, 0.000 TFLOPs/s)                     |
| Memory, Cache  | 119787 MB RAM, 0 KB global / 512 KB local                  |
| Buffer Limits  | 119787 MB global, 512 KB constant                          |
|----------------'------------------------------------------------------------|
| Info: OpenCL C code successfully compiled.                                  |
| Info: Allocating memory. This may take a few seconds.                       |
|-----------------.-----------------------------------------------------------|
| Grid Resolution |                                256 x 256 x 256 = 16777216 |
| Grid Domains    |                                             1 x 1 x 1 = 1 |
| LBM Type        |                                    D3Q19 SRT (FP32/FP16S) |
| Memory Usage    |                                   CPU 880 MB, GPU 1x 0 MB |
| Max Alloc Size  |                                                    608 MB |
| Time Steps      |                                                     10000 |
| Kin. Viscosity  |                                                1.00000000 |
| Relaxation Time |                                                3.50000000 |
| Reynolds Number |                                                  Re < 256 |
|---------.-------'-----.-----------.-------------------.---------------------|
| MLUPs   | Bandwidth   | Steps/s   | Current Step      | Time Remaining      |
|   10553 |    813 GB/s |       629 |         9971 100% |                  0s |
|---------'-------------'-----------'-------------------'---------------------|
| Info: Peak MLUPs/s = 11684                                                  |
```
