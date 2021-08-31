# RV1126_RV1109 Linux AI Camera SDK Note

---

**Versions**

[TOC]

---
## rv1126_rv1109_linux_ai_camera_v2.2.0_20210831.xml Note

```
一、Kernel
1. Camera Sensor驱动增加HI556/HI846/IMX178/IMX462/OS08A20/SC035HGS/SC2335/SC5239/SC8220
2. 增加RK628/ES7210/ES7243E/MS41908/FP5501驱动
3. RGA支持RGB2YUV和YUV2YUV
4. 解决IO-DOMAIN在1.8V模式下，外部上电1.8V，可能会瞬间引起较大电流，导致回路电压塌陷问题
5. USB驱动更新，UVC优化开流过程cpu 休眠策略，优化延时；
6. USB驱动更新，修复热拔插稳定性问题

二、U-Boot
1. 增加SPI NOR、SPI NAND颗粒支持
2. 支持128MB DDR容量启动

三、Camera Engine rkaiq (AIQ)
1. 更新AIQ至V1.0x67.3版本,解决isp in接入crash等问题
2. 更新ISP驱动至V1.6.2版本，支持cif/isp/ispp延时优化配置等
3. 更新ISP IQ Tuning工具至V1.7.2版本

四、RGA
1. 增加支持BGR565/BGRA5551/BGRA4444格式
2. 更新RGA的API版本到V1.3.0

五、App
1. rockit：解决第三方算法插件调用cache处理异常导致帧率低问题
2. rockit：添加mpi版本库供选择
3. aiserver：新增RKVO插件供本地显示功能（edp屏、hdmi等）扩展
4. eptz：优化帧率
5. recovery: 更新升级程序版本到V1.1.3
6. uvc app： 支持更多PU指令

六、NPU
1. rknn-toolkit更新到v1.6.1
2. rknpu更新到1.7.0

七、文档和工具
1. 更新ISP驱动文档
2. 更新AIserver文档
3. QuickStart和发布说明文档更新V2.0 SDK版本下载地址（注：V1.0 无法直接升级到V2.0 SDK）
4. 添加UVC延时优化文档
5. TV_Camera_demo_protocol更新到V1.2.0
```



## rv1126_rv1109_linux_ai_camera_v2.1.0_20210723.xml Note

```
1.添加rv1126-ai-cam-audio-ddr3-v1-spi-nand.dts支持ai camera音频demo板；
2.isp相关驱动更新到v1.0x6.1；
3.aiq更新到最新v1.0x67.1 版本：
  * v1.0x67.0
  * - AE
  *   - fix bug in antiflicker limit
  *   - Fix bug in longFrameMode,which luma is different between LongFrameMode
  *     and linear
  * - AWB:
  *   - fix bug in awb when number of LS > 7
  *   - fix bug in extralight mode
  *   - lsc and ccm support at most 14 light sources
  * - AF
  *   - lots of optimizations
  * - add custom AE algo demo
  * - Tuning tool: v1.7.0
  * v1.0x67.1
  * - add AFD(Anti Flikering Detection) algo
  * - add AWDR algo
  * - fix some crash bugs of motion detection
4.Tuning Tool:更新到 v1.7.0，tool server源码方式集成；
5.nand驱动更新：spi nand修复烧录器烧写分区认不到等问题；
6.uvc app更新：
  1. 支持64位；
  2. 修复nv12格式ffplayer播放失败问题；
  3. 修复 一些win10版本pu处理超时导致兼容性问题；
  4. 编码添加sei数据支持；
  5. 支持usb3.0配置；
  6. 支持编码旋转功能，支持roll指令功能；
  7.更新uvc文档版本到1.7.0.；
7.EPTZ算法添加版本控制,未开通只能使用半小时；
8.dual-uvc配置添加，添加多路uvc设备出流demo；
9.usb:修复快速热拔插低概率控制器无法识别异常问题;
10.uac1:驱动修复多channel支持问题；
11.kernel/rkbin/uboot等其它模块更新到最新版本；
12.文档/工具更新到最新版本；
```

## rv1126_rv1109_linux_ai_camera_v2.0.0_20210531.xml Note

```
1. isp驱动更新到v1.0x6.0；
2. aiq更新到最新v1.0x66.0 版本：
   - 解决一些API bug
   - 支持dvp接口，工具支持多sensor
   - 支持ISPP参数同步
   - 解决许多NR，AWB，AE，TMO等模块效果问题
   - 支持动静判决，及修复引入的稳定性问题等；
   - 支持Socket IPC，该功能主要给tolserver工具使用，实现不断流在线调试功能；
   - uAPI 支持线程安全等；
3. Tuning Tool:更新到 v1.6.0；
4. usb auto suspend和DFU功能合并；
5. spi nand驱动更新，优化稳定性；
6. uvc app更新：
    - 优化mjpeg 4kp30；
    - 修复pu指令调用内存泄露问题；
    - 修复 mac os低版本无法支持3k微帧问题；
    - 修复打开osd功能未使用导致的异常问题；
    - conf增加帧率控制配置功能；
    - 修复默认电力线频率配置无效问题；
    - uvc添加nv12/i420格式支持，默认关闭.；
    - 修复Ubuntu 18.04下CT指令功能用v4l2-ctl指令无法显示问题；
7. dbserver：修复内存泄露；
8. usb:合并添加uvc debug节点和打印trace功能;
9. 更新一键debug脚本，支持usb debug信息打印；
10. aiserver：修复eptz disable编译失败问题；
11. usb:解决uac和rndis复合设备window无法兼容问题;
12. usb:解决win10上uac2驱动安装失败问题
13. usb：修复客诉4k h265开关UVC老化控制器异常问题；
14. kernel/rkbin/uboot等其它模块更新到最新版本；
15. 文档工具更新到最新版本；
16. 去掉无用工程等.
```

## 

