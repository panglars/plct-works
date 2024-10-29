# LicheeRV Dock

## Connect Ethernet

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

## ncnn

tutorial: https://gist.github.com/nihui/ff7bfb3e48bb850a9d7bd495c0a6d373

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

![output](./../assets/nanodet-D1.png)
