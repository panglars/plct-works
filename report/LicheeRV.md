# LicheeRV Dock

## Connect Ethernet in Tina Linux

Lichee RV Dock does not support wired networks, and I can't use the official document's method to connect wirelessly.

```log
# wpa_cli

> scan
OK
<3>CTRL-EVENT-SCAN-RESULTS

> scan_results
bssid / frequency / signal level / flags / ssid
00:00:00:00:00:00 2462 -49 [WPA2-PSK-CCMP][ESS] MYSSID
11:11:11:11:11:11 2437 -64 [WPA2-PSK-CCMP][ESS] ANOTHERSSID

> add_network
0
> set_network 0 ssid "MYSSID"
> set_network 0 psk "passphrase"
> enable_network 0
<2>CTRL-EVENT-CONNECTED - Connection to 00:00:00:00:00:00 completed (reauth) [id=0 id_str=]

> quit 
```

## coremark

[coremark](https://www.eembc.org/coremark/)

```
root@sipeed:~/coremark# cat run1.log 
2K performance run parameters for coremark.
CoreMark Size    : 666
Total ticks      : 13303
Total time (secs): 13.303000
Iterations/Sec   : 2255.130422
Iterations       : 30000
Compiler version : GCC10.2.1 20210110
Compiler flags   : -O2 -DPERFORMANCE_RUN=1  -lrt
Memory location  : Please put data memory location here
			(e.g. code in flash, data on heap etc)
seedcrc          : 0xe9f5
[0]crclist       : 0xe714
[0]crcmatrix     : 0x1fd7
[0]crcstate      : 0x8e3a
[0]crcfinal      : 0x5275
Correct operation validated. See README.md for run and reporting rules.
CoreMark 1.0 : 2255.130422 / GCC10.2.1 20210110 -O2 -DPERFORMANCE_RUN=1  -lrt / Heap
``` 

## ncnn

> example tutorial: https://gist.github.com/nihui/ff7bfb3e48bb850a9d7bd495c0a6d373

### benchmark

Tina Linux can't run this benchmark; an 'Illegal instruction' error occurs. You must use Debian.

> I changed the test script to remove vgg16 and vgg16_int8 model, which can cause an OOM (Out of Memory) error

```log
root@sipeed:~/ncnn/benchmark# ./benchncnn 1 1 0 -1 0
loop_count = 1
num_threads = 1
powersave = 0
gpu_device = -1
cooling_down = 0
          squeezenet  min =  327.18  max =  327.18  avg =  327.18
     squeezenet_int8  min = 9185.17  max = 9185.17  avg = 9185.17
           mobilenet  min =  744.17  max =  744.17  avg =  744.17
      mobilenet_int8  min = 27411.35  max = 27411.35  avg = 27411.35
        mobilenet_v2  min =  444.83  max =  444.83  avg =  444.83
        mobilenet_v3  min =  348.53  max =  348.53  avg =  348.53
          shufflenet  min =  468.43  max =  468.43  avg =  468.43
       shufflenet_v2  min =  293.00  max =  293.00  avg =  293.00
             mnasnet  min =  419.77  max =  419.77  avg =  419.77
     proxylessnasnet  min =  478.52  max =  478.52  avg =  478.52
     efficientnet_b0  min =  581.97  max =  581.97  avg =  581.97
   efficientnetv2_b0  min =  837.85  max =  837.85  avg =  837.85
        regnety_400m  min =  673.77  max =  673.77  avg =  673.77
           blazeface  min =  146.41  max =  146.41  avg =  146.41
           googlenet  min = 1352.27  max = 1352.27  avg = 1352.27
      googlenet_int8  min = 41660.57  max = 41660.57  avg = 41660.57
            resnet18  min = 1010.66  max = 1010.66  avg = 1010.66
       resnet18_int8  min = 45014.87  max = 45014.87  avg = 45014.87
             alexnet  min =  961.35  max =  961.35  avg =  961.35
            resnet50  min = 3880.05  max = 3880.05  avg = 3880.05
       resnet50_int8  min = 142794.31  max = 142794.31  avg = 142794.31
      squeezenet_ssd  min = 1708.88  max = 1708.88  avg = 1708.88
 squeezenet_ssd_int8  min = 33240.07  max = 33240.07  avg = 33240.07
       mobilenet_ssd  min = 1559.08  max = 1559.08  avg = 1559.08
  mobilenet_ssd_int8  min = 85591.73  max = 85591.73  avg = 85591.73
      mobilenet_yolo  min = 3674.87  max = 3674.87  avg = 3674.87
  mobilenetv2_yolov3  min = 1757.52  max = 1757.52  avg = 1757.52
         yolov4-tiny  min = 1968.33  max = 1968.33  avg = 1968.33
           nanodet_m  min =  705.14  max =  705.14  avg =  705.14
    yolo-fastest-1.1  min =  392.48  max =  392.48  avg =  392.48
      yolo-fastestv2  min =  259.28  max =  259.28  avg =  259.28
  vision_transformer  min = 45503.48  max = 45503.48  avg = 45503.48
          FastestDet  min =  280.43  max =  280.43  avg =  280.43
```


### example

```log
root@MaixLinux:~# ./nanodet peoples.png 
0 = 0.64062 at 604.57 101.96 408.73 x 489.76
0 = 0.63135 at 223.39 162.50 388.83 x 427.91
0 = 0.62500 at 943.66 75.25 372.99 x 516.88
0 = 0.61377 at 1223.33 83.27 215.67 x 500.81
0 = 0.59961 at 1.00 33.95 338.45 x 565.05
0 = 0.48706 at 397.74 0.00 215.91 x 228.16
0 = 0.41553 at 693.63 0.00 225.08 x 157.95
0 = 0.40259 at 586.28 64.35 162.73 x 163.61
imshow save image to image.png
waitKey stub
root@MaixLinux:~# 
```

![image.png](./../assets/nanodet-D1.png)

## Vector

> example document: https://github.com/rvboards/d1_demo/blob/main/vector_example/README.md

D1 contains a T-head C906 cores, which supports RISC-V Vector Spec 0.7.1.
Currently, the native toolchain doesn't support RISC-V Vector extension yet.
This demo shows how to cross compiling vector codes.

### Install T-head cross compiling toolchain

From [T-head website](https://occ.t-head.cn/community/download?id=3902100504121253888), download riscv64-linux-x86_64-20210329.tar.gz or other version.

Install the toolchian and set the `PATH`.

### Compile the example

Please read `Makefile` for `-march`, `-mabi`.

`make`

### Run on the boards

Cp the binary to the boards. Run it.

### test code

```
#include <stdio.h>

int main(){
  float a[]={1.0,2.0,3.0,4.0};
  float b[]={1.0,2.0,3.0,4.0};
  float c[]={0.0,0.0,0.0,0.0};
  int len=4;
  int i=0;

  //inline assembly for RVV 0.7.1
  //for(i=0; i<len; i++){c[i]=a[i]+b[i];}

  asm volatile(
	       "mv         t4,   %[LEN]       \n\t"
	       "mv         t1,   %[PA]        \n\t"
	       "mv         t2,   %[PB]        \n\t"
	       "mv         t3,   %[PC]        \n\t"
	       "LOOP1:                        \n\t"
	       "vsetvli    t0,   t4,   e32,m1 \n\t" 
	       "sub        t4,   t4,   t0     \n\t" 
	       "slli       t0,   t0,   2      \n\t" //Multiply number done by 4 bytes
	       "vle.v      v0,   (t1)         \n\t" 
	       "add        t1,   t1,   t0     \n\t"
	       "vle.v      v1,   (t2)         \n\t" 
	       "add        t2,   t2,   t0     \n\t"
	       "vfadd.vv   v2,   v0,   v1     \n\t" 
	       "vse.v      v2,   (t3)         \n\t" 
	       "add        t3,   t3,   t0     \n\t"
	       "bnez       t4,   LOOP1        \n\t"
	       :
	       :[LEN]"r"(len), [PA]"r"(a),[PB]"r"(b),[PC]"r"(c)
	       :"cc","memory", "t0", "t1", "t2", "t3", "t4",
		"v0", "v1", "v2"
	       );
  
  for(i=0; i<len; i++){
    printf("%f\n",c[i]);
  }
  
  return 0;
}
```

### Result

```log
root@sipeed:~/vector_example# ./vector_example 
2.000000
4.000000
6.000000
8.000000
```
