# RK356X Linux SDK Note

---

**Versions**

[TOC]

---
## rk356x_linux_release_v1.2.1_20211105.xml Note

**app**:

```
- update qsetting
	* - qsetting: wifibt: fix build
	* - qtbt:Solve the bug of incomplete Bluetooth display

- update rkaiq_tool_server
	* - media pipeline: only link for selected sensor
```

**external**:

```
- update mpp
	* - [hal_task]: Remove unused variable
	* - [mpp_dec]: Optimize decoder flow
	* - [mpp_lock]: Add gcc atomic macro define
	* - [h265d_parser]: Fix h265d parser crash issue
	* - [mpp_meta]: Use macro to generate code
	* - [mpp_meta]: Add performance test case
	* - [mpp_meta]: Improve performance
	* - [mpp_dec]: Fix double free issue
	...

- update gstreamer-rockchip
	* - mppenc: Improve format and alignment supports
	* - mppdec: Provide RGA formats only when available
	* - mppdec: Add RGB/BGR formats
	* - mppjpegenc: Update size limits
	* - mppenc: Simplify caps
	* - mppvideodec: Delay discarding frames for some broken videos
	* - mppvideodec: Drop extra MPP frame in I4O2 deinterlaced mode
	* - mppvideodec: Rule out YUV444 for H264
	* - rkximage: Fix colorkey setting issue
	* - mppdec: Use alignment 2 for strides when doing RGA conversion
	* - rkximage: Support disabling vsync
	* - rkximage: Update colorkey prop defination
	* - mppjpegdec: Drop PP format NV16
	* - mppdec: Support setting prefered output format
	* - rockchipmpp: Fix RGA RGB16 wrong endian
	* - mppdec: Drop RGB15 and BGR15
	* - Revert "rockchipmpp: Use height as vstride in RGA conversion"
	* - mppjpegdec: Add a sanity check for input video info
	* - rockchipmpp: Fix a few compile warnings
	* - Switch to meson
	* - Remove unused tests/examples

- update libmali
	* - Move scripts and sources to sub directories
	* - Speed up normalizing
	* - debian: Sort targets
	* - debian: Force enabling wrappers
	* - libmali: px30, 3326: add libs of libmali-bifrost-g31-g2p0-only-cl.so of g2p0-01eac0-8
	* - libmali: px30, 3326: add libs of libmali of g2p0-01eac0-7
	* - libmali optimized for size: 356x: add libmali-bifrost-g52-g2p0-without-cl-dummy-gbm.so of g2p0-01eac0-6
	* - libmali optimized for size: 356x: add libmali-bifrost-g52-g2p0-dummy-gbm.so of g2p0-01eac0-6
	* - meson: Support optimize-level option
	* - debian: Simplify conflicts logic
	* - meson: Don't try to fixup non-existing headers
	* - libmali: 356x: add libmali-bifrost-g52-g2p0-without-cl-dummy-gbm.so of g2p0-01eac0-5

- update linux-rga
	* - build: add .gitignore if build in rga source dir
	* - build: Modify CMakeLists.
	* - drmPrimeHandleToFD add DRM_CLOEXEC | DRM_RDWR flag
	* - build: cmake support compiling with 'buildroot' TARGET.
	* - im2d_api: Fix the error of rgaImDemo fill mode.
	* - Modify the judgment about perpixelAlpha.
	* - Support BGR565/BGRA5551/BGRA4444.
	* - im2d_api: Fix the check error of crop mode.
	* - im2d_api: Fix errors in the blend module.
	* - docs: Modify the wrong format description of RGB and RGBA.
	* - Fix the error of BGR565/5551/4444 format conversion.
	* - Get the version compatible with RGA1.
	* - im2d_api: Remove IM_CROP.

- update camera_engine_rkaiq
	* - update aiq to version v2.0x60.1
	* - add lock for j2s & fix crash on multi camera.
	* - rkaiq_3A_server: start engine in threads
	* - rkaiq_3A_server: get sensor entity name from librkaiq
	* - isp or ispp can be NULL for rkcif media device
	* - CamHwIsp20: fix dvp entity name not matched with driver

- update deviceio_release
	* - devceio_release: update to 20210930
	* - fixed build err in the case of cpp refer c
	* - devceio_release: update to 20210907

- update storage_manager/rknpu/rknn-toolkit2/rockx/rknpu2/isp2-ipc/ipcweb-backend/mediaserver/aiserver/uac_app/common_algorithm/libglCompositor/rkwifibt
```

**Debian**:

```
- update Debian10
	* - mk-rootfs-buster.sh: Error out when source not found
	* - mk-rootfs-buster.sh: Build for arm64 by default
	* - mk-rootfs-buster.sh: Drop unused xserver -dev packages
	* - mk-rootfs-buster.sh: Use apt-get to install local packages
	* - mk-rootfs-buster.sh: Only hold custom local packages
	* - packaegs: update xserver
	* - packages: update libdrm-cursor
	* - overlay-debug: update glmark2
	* - packages: update xserver
	* - overllay: upgrade bifrost-g31 to g2p0
	* - packages: update libmali
	* - packages: update libdrm-cursor
	* - overlay: xorg.conf.d: Add some comments
	* - overlay: fixes the typo for scripts
	* - packages: update xserver
	* - packages/mpp: update mpp
	* - packages: update gst-rkmpp/mpp/rga packages
	* - scripts: the libssl-dev had existed on base package
	* - packages: fixes dri2 pagefilp issue for xserver
	* - mk-rootfs-buster.sh: Only preload libdrm-cursor for X
	* - overlay: enable ASYNC for atomic commit by default
	* - packages: update xserver package
	* - Merge "rkscripts: Don't remove the build dir"
	* - Merge "packages: update rga/mpp/gstreamer-rockchip"
	* - rkscripts: Don't remove the build dir
	* - chromium-x11: Update to 91.0.4472.164
	* - packages: update rga/mpp/gstreamer-rockchip
```

**Yocto**:

```
- update Yocto3.2
	* - linux-rockchip: 4.4: Update color-key patch
	* - linux-rockchip: 4.4: Fix compile error with new GCC
	* - u-boot: Rebase patches
	* - machine: px30: Switch mali to g2p0
	* - Bump BSP package revisions at 2021_10_13
	* - Add drm-cursor
	* - Fix fetching errors for local git sources with detached HEAD
	* - gstreamer-rockchip: Switch to meson build system
```


**Buildroot**:

```
- update buildroot 2018.02-rc3
	* - rknpu: Remove redundant 356x options
	* - rockchip_rk3568_defconfig: fix rknpu2.
	* - qt5wayland: Support window lower() and raise()
	* - configs: add rk3588 nvr defconfig
	* - weston: Use vblank based dynamic repaint window
	* - weston: Improve input device and output  associating
	...
```

**U-boot**:

```
- update U-boot (next-dev)
	* - mtd: spi-nor-ids: Add support for gd25lb512m
	* - dm: sysreset: do optimise
	* - arm: crt0_64.S: disable arm64 SError for usbplug
	* - lib: optee_clientApi: data alignment for get_rkss_version
	* - rockchip: rkimg: support setting NVME as main storage
	* - rockchip: rk3308bs: correct the nand iomux
	...
```

**rkbin**:

```
- update rkbin
	* - rk3566: ddr: update ddr bin to v1.11
	* - rk3568: ddr: update ddr bin to v1.11
	...
```

**kernel**:

```
- update Kernel4.19
	* - video: rockchip: mpp: use dma-buf-cache func
	* - drm: rockchip: do release callback if not define CONFIG_DMABUF_CACHE
	* - clk: rockchip: rk3568: add CLK_SET_RATE_NO_REPARENT flag for clk_gmacx_rx_tx
	* - ASoC: es8311: fixed the dapm route error
	* - phy: rockchip-naneng-usb2: do apb reset during probe
	* - arm64: dts: rockchip: rk3568-linux: enable hdmi_sound with hdmi jack function
	* - arm64: dts: rockchip: rk3568-evb: use "rockchip,hdmi" instead of "simple-audio-card"
	* - mmc: dw_mmc-rockchip: Improve v2 tuning
	* - mmc: dw_mmc-rockchip: Skip all phases bigger than 270 degrees
	* - media: rockchip: ispp: replace iommu detach/attach
	...
```

**docs**

```
- update docs
	* - docs: add ROS2 document and update PCBA and Recovery document
	* - Common/CAMERA: upgrade ISP2x to 20210925
	* - docs: add wifibt avl for linux and update wifibt docs to 20210915
	* - Linux: Multimedia: update Rockchip_Developer_Guide_Linux_RKADK_CN.pdf to v1.2.0
	* - COMMON: update it with inside on 20210922
	* - Linux: Recovery: update DFU upgrade guide document to v1.1.0
	* - docs: update Rockchip_Driver_Guide_VI & Rockchip_Tuning_Guide_ISP20 document;
```

**tools**

```
- update tools
	* - update RKDevTool from V2.84 to V2.86
	* - linux: Linux_Pack_Firmware: add rv1126-package-file-sllock
	* - tools: windows: update ParameterTool to v1.2
	* - linux: Linux_Pack_Firmware: add new package file
	...
```

## rk356x_linux_release_v1.1.3_20210805.xml Note

**app**:

```
- update aiserver
	* - eptz parameter adjustment.
	* - [aiserver/vendor/eptz] File name correction.
	* - [aiserver/vendor/eptz] fix compile error in lastest commit.

- update rkaiq_tool_server
	* - d702dc1 raw capture: fix multi-frame add overflow issue
	* - 86a01ba Linux: simply remove link librkaiq
	* - 4f432e0 Linux: do not kill rkaiq_3A_server or app
	* - efffa5c tcp server: do not handle signal on its own thread
```

**external**:

```

- update gstreamer-rockchip
	* - rockchipmpp: Use gint and gchar
	* - mppenc: Handle keyframe requests
	* - rkximage: Use "zpos" property as well
	* - mppallocator: Drop custom mmap
	* - mppenc: Report error when input buffer is too small
	* - rockchipmpp: Fix RGA error when src buf is not dma buf
	* - rockchipmpp: Workaround pixel stride error
	* - mpph264enc: Fix memory leak in set_src_caps
	* - mppjpegdec: Support setting output format
	* - rockchipmpp: Fix MPP format endian error
	* - rockchipmpp: Use height as vstride in RGA conversion

- update mpp
	* - [drm]: Add mmap flag detection
	* - [misc]: chmod some files to 644
	* - [h264d_parse]: skip sp/si slice
	* - [drm]: stop using drm_mmap and drm_munmap
	* - [mpp_enc]: Fix qp delta_ip & delta_vi check issue
	* - [h264d]: matching macro MAX_NUM_DPB_LAYERS with code
	* - [h265d]: Reduce  malloc/free frequency of sps/pps

- libmali
	* - 08e7448 (HEAD, rk/master, m/master) meson: Force MESA_EGL_NO_X11_HEADER for non-x11 winsys
	* - cd3d4f7 meson: Add required packages in pkgconfig

- linux-rga
	* - Update version.
	* - im2d_api: revert some config of crop mode in improcess
	* - Fix an error.
	* - Correct some information in the document.
	* - Fix "unknown type name ‘int16_t’" in rga.h
	* - Support BGR565/BGRA5551/BGRA4444.
	* - Optimize libgra.

- update common_algorithm/libglCompositor/recovery/rkfacial/rkwifibt
```

**U-boot**:

```
- drm/rockchip: vop2: add adjust cursor plane
- cmd: rockusb: convert return vlaue from block layer
- clk: rockchip: rk3568: add i2s3 clk
- rockchip: dts: rk3568: Resync from kernel-4.19
```

**Buildroot (2018.02-rc3)**:

```
- configs/rockchip: Use new custom local kernel option
- glibc: Support auto detecting kernel headers version
- {linux,package/linux-headers}: Support custom local kernel
- {linux,package/linux-headers}: Support virtual linux
- {linux,package/linux-headers}: Bump to buildroot upstream
- gcc: Bump default version to 9.x
- rockchip/wifibt: Stop caring about kernel versions
- configs/rockchip: Enable BR2_PACKAGE_GLIBC_GEN_LD_CACHE by default
- glibc: Allow error when generating ld cache
- glibc: Drop 2.22
- bind: Support min-cache-ttl
- bind: Run named as root
- dnsmasq: Bump to buildroot upstream's 2.85
- bind: Bump to buildroot upstream's 9.11.31
- package: rockchip: camera_engine_rkaiq: remove dependence on host-camera_engine_rkaiq
- qt5wayland: Update patches for 5.9 and 5.12
- unscd: Add BR2_PACKAGE_UNSCD_HOSTS_CACHE
- unscd: Bump to buildroot upstream 0.54
- qt5wayland: Update patches
- qt5wayland: Disable wayland-server when not wanted
- gst1-plugins-good: v4l2: Do not renegotiate if only framerate changed
- config: rockchip: add alexa config
- package: rockchip: add alexa-smart-screen-sdk
- package: rockchip: add apl-core-library
- package: rockchip: add avs-device-sdk
- package: doxygen: add config for host build
- websocketpp: new package
- package: add libasio
- wampcc: needs atomic
- wampcc: needs C++
- wampcc: new package
- toolchain: add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS hidden option
- package: rockchip: camera_engine_rkaiq: symbol link to target IQFILE for FakeCamera.xml/bin
- package: alsa-lib: pcm: Fix two bugs in snd_pcm_area_silence()
- libdrm-cursor: Add package
```

**Debian10 (buster)**:

```
- packages: add mpv/ffmpeg for hardware accelerator
- rkscripts: Don't remove the build dir
- packages: update rga/mpp/gstreamer-rockchip
- packages: fixes moving cursor or hotplug issues
- overlay: udev: Run drm-hotplug.sh as daemon
```

**Kernel (4.19)**:

```
- video/rockchip: rga2: Fix rga2_dma_flush_page warnning
- arm64: dts: rockchip: rk3568-nvr: enabled rknpu_mmu
- drm/rockchip: analogix_dp: clear the eDP flag in output_if
- drm/rockchip: dw_hdmi: Add property to show whether sink is DVI
- drm/rockchip: dw_hdmi: Add property to switch HDMI/DVI mode
- drm/rockchip: dw_hdmi: Support set quant range take effect immediately
- drm/bridge: dw-hdmi: Make sure to output full range RGB in DVI mode
- serial: 8250_port: fix UART DL check when setting divisor.
- video/rockchip: rga2: Remove the useless code about the src1 channel
- media: i2c: ov7251 support 640x480@120fps mode
- media: i2c: support os08a20 sensor driver
- media: i2c: support sc5239 sensor driver
- media: i2c: gc032a: set default stream off state
- media: rockchip: ispp: reset at frame end
- media: rockchip: ispp: frame buffer done early
- media: rockchip: ispp: frame buffer done early
- media: rockchip: isp: frame buffer done early
- drm/rockchip: vop2: output error info when cluster use non afbc format
- media: i2c: gc2375h: fix vblank set issue
- misc: add driver for rk803.
- media: i2c: add strobe control & fix expsoure for ov9281.
- media: i2c: modify ov9281 driver for thunderboot.
- drivers: rk_flash: set dma mask to 32bits
- PCI: rockchip: fix subsys_irq_handler logic
- arm64: dts: rockchip: rk3568: disable receiver detection in P3 for usb
- drm/rockchip: vop: Deal with display area out of display mode
- phy: rockchip: inno-usb2: support usb wakeup for rk3568
- drm/rockchip/rk628: combtxphy: reducing DUAL LVDS power consumption
- media: rockchip: ispp: fix bug that ispp register isn't included in SEI
- mmc: sdhci-of-dwcmshc: Adjust DLL_TXCLK_TAPNUM_DEFAULT to 0x10
- video/rockchip: rga2: Fix MMU base not shift forward.
- video/rockchip: rga2: adapt to kernel 5.10
- drivers: rkflash: Ajudst the dll strategy
- drm/rockchip: vop2: enable dither up when input rgb565
- drm/bridge: synopsys: dw-hdmi: Remove dw_hdmi_setup when atomic_check
- media: rockchip: isp1: fix buf done state
- ASoC: rockchip: rk817-codec: Solve pop problems
- Revert "drm/rockchip: gem: fix dma_free_attrs() parameter error"
- media: rockchip: isp/ispp: declare slab.h for kmalloc/kfree
- media: rockchip: isp: dmarx support yuv format
- media: videobuf2-v4l2: copy user image sequence for output video
- media: rockchip: isp1: clean list when stream failed
- arm64: dts: rockchip: rk356x-evb: fix pcie supply to regulator-fixed
- ASoC: rockchip: i2s-tdm: Add support for 16ch tdm mode

```

## rk356x_linux_release_v1.1.2_20210720.xml Note

**app**:

```
- update aiserver/mediaserver
- add rkaiq_tool_server
```

**external**:

```
- update camera_engine_rkaiq
	* - camera RKAIQ to V3.0
	* - isp driver v1.0x6.1
	* - new tuning tool v2.0.0
	* - use json iq instead of xml
	* - reconstruct HWI & aiq_core
	* - HWI can produce SOF, STATS, RAW/YUV image
	* - aiq core support algo running in group threads

- update gstreamer-rockchip
	* - rockchipmpp: Improve error logs
	* - mppdec: Fix RGA convert error
	* - mppenc: Support opaque RGB32 formats
	* - mppenc: Support copying encoded packets
	* - mppallocator: Fixup allocated memory size

- update mpp
	* - [hal_jpegd]: Fix hal jpeg RGB output byte stride
	* - [drm]: Add DRM_CLOEXEC|DRM_RDWR flag on fd import
	* - [jpegd]: Fix parse err that do not start with soi
	* - [mpi/mpp]: Add mpp internal start / stop function
	* - [mpp_dec]: Add more check on decoding mjpeg
	* - [hal_h265d]: Fix rps update issue
	* - [mpi_dec_test]: Allow loop jpeg decoding test
	* - [mpp_buffer]: Fix crash on cleanup leaked buffer
	* - [hal_jpege_vpu]: Fix qtable memory leak
	* - [h264d_sps/pps]: Fix h264d err cause by spspps not update issue
	* - [mpp_buffer]: Fix miss lock on searching group
	* - [h264d_parse]: Fix prepare crash issue
	* - [rc_v2]: Add bitrate statistic time cfg interface
	* - [rc_v2]: Rename stat_times to stats_time
	* - [mpp_buffer]: Fix error on releasing leaked buffer
	* - [misc]: Add O_CLOEXEC flag on file open
	* - [drm]: Fix drm handle issue

- libmali
	* - meson: Disable wrapper packages for utgard by default
- linux-rga
	* - Update version.
	* - docs: rename docs/README.md -> docs/RGA_API_Instruction.md
	* - docs: Add image in RGA_FAQ.md
	* - Three-channel mode(A+B->C) supports configuration of CSC.
	* - docs: Update RGA_FAQ.md
	* - docs: Add RGA_FAQ.md
	* - im2d_api: Update the supported RGA version number.
	* - docs: Update description of imblend/imcomposite.
	* - Use spaces for indentation.(code style)
	* - Supplement detailed error information in imStrError().
	* - Added translate_format_str().
	* - im2d_api: Modify imErrorMsg() to imSetErrorMsg().
	* - im2d_api: Add feature verify in imcheck().
	* - im2d_api: rga_get_info() add some feature options.
	* - Modify the version number of RGA2 to verify.
	* - im2d_api: Reduce redundant ioctl for query RGA version.

- update eq_drc_process/alsa-config/isp2-ipc/libglCompositor/rknpu/rkscript/uvc_app/uac_app/recovery/rockit

```

**Buildroot (2018.02-rc3)**:

```
- Fixes mpg123 noise bug
- Support camera rkaiq v3.0
- fixes rk356x 32bit issues
- Add SW cursor in weston to fix the display issue
- Support NV16 dma buf
```

**Debian10 (buster)**:

```
- packages: update xserver
- libdrm-cursor: Update to 1.1.2
- drm-hotplug.sh: Stop using sysfs mode
- scripts: update some tools for debugging
- rkscripts: add ntp for time sync server
- overlay: remove the rc.local
- scripts: update packages for xserver
- overlay: rework for adb debugging
- overlay-firmware: update rkwifibt firmware and tool
- packages: update xserver to 1.20.4-debian10u3
- overlay: xfce4: Disable blank-on-ac and screen lock by default
- drm-hotplug.sh: Don't block uevent
- overlay-debug: update glmark2 2021.02 to instead of the old style

```

**Kernel (4.19)**:

```
- ASoC: rockchip: i2s-tdm: Silence warning by adding parentheses
- phy: rockchip-naneng-usb2: keep utmi clk on during charge detection
- media: rockchip: isp: disable params when it stream off
- media: rockchip: isp: add lock for isp stream
- iommu: remove unused rk-iommu/iovmm driver
- drivers: rkflash: Notice it when the storage device is not support
- drm/rockchip: fix error return for rockchip_gem_prime_sgl_sync_range
- drm/rockchip: drv: enable power before direct close crtc
- video/rockchip: rga2: Add format support
- drm/rockchip: vop2: Disable all other multi area when disable area0
- drm/rockchip: vop2: fix hdr delay number setting when port_mux is not at last
- drm/bridge: analogix_dp: Add HBR2 support for RK3399
- drm/bridge: analogix_dp: Add support for SSC (Spread-Spectrum Clock)
- clk: rockchip: rk3568: remove sclk_ddrc
- arm64: dts: rockchip: rk3568: modify dmc clk
- PM / devfreq: rockchip_dmc: rk3568: add rockchip_ddr_set_rate
- arm64: dts: rockchip: rk356x: dmc: Replace system-status-freq by system-status-level
- PM / devfreq: rockchip_dmc: rk3568: get available frequencies from ATF
- dt-bindings: soc: rockchip: add dram frequency level support
- drm/rocckhip: vop2: fix compile warning
- drm/rockchip: vop2: rk356x three vp share one gamma
- ASoC: rockchip: spdifrx: Replace dmaengine with rockchip pcm
- ASoC: rockchip: spdif: Replace dmaengine with rockchip pcm
- ASoC: rockchip: audio_pwm: Replace dmaengine with rockchip pcm
- ASoC: rockchip: pdm: Replace dmaengine with rockchip pcm
- ASoC: rockchip: i2s-tdm: Replace dmaengine with rockchip pcm
- ASoC: rockchip: Make rockchip_pcm depends on SND_SOC_ROCKCHIP
- soc: rockchip: rockchip_sip: add get dram frequency info support
- media: i2c: gc02m2 fixes the base value of digital gain to avoid purple in the light
- drm/rockchip: ebc_dev: release version v2.06
- media: spi: ms41908: support focus/zoom reinit run simultaneously
- ASoC: rockchip: i2s-tdm: Silence warning by adding parentheses
- phy: rockchip-naneng-usb2: keep utmi clk on during charge detection
- media: rockchip: isp: disable params when it stream off
- media: rockchip: isp: add lock for isp stream
- iommu: remove unused rk-iommu/iovmm driver
- drivers: rkflash: Notice it when the storage device is not support
- staging: android: ion: fix error return for ion_sgl_sync_range
- drm/rockchip: fix error return for rockchip_gem_prime_sgl_sync_range
- drm/rockchip: drv: enable power before direct close crtc
- arm64: dts: rockchip: rk3566-eink: change dmc freq level
- drm/rockchip: ebc_dev: release version v2.07
- video/rockchip: rga2: Add format support
- drm/rockchip: vop2: Disable all other multi area when disable area0
- drm/rockchip: vop2: fix hdr delay number setting when port_mux is not at last
- drm/bridge: analogix_dp: Add HBR2 support for RK3399
- drm/bridge: analogix_dp: Add support for SSC (Spread-Spectrum Clock)
- clk: rockchip: rk3568: remove sclk_ddrc
- arm64: dts: rockchip: rk3568: modify dmc clk
- PM / devfreq: rockchip_dmc: rk3568: add rockchip_ddr_set_rate
- arm64: dts: rockchip: rk356x: dmc: Replace system-status-freq by system-status-level
- PM / devfreq: rockchip_dmc: rk3568: get available frequencies from ATF
- dt-bindings: soc: rockchip: add dram frequency level support
- drm/rocckhip: vop2: fix compile warning
- drm/rockchip: vop2: rk356x three vp share one gamma
- ASoC: rockchip: spdifrx: Replace dmaengine with rockchip pcm
- ASoC: rockchip: spdif: Replace dmaengine with rockchip pcm
- ASoC: rockchip: audio_pwm: Replace dmaengine with rockchip pcm
- ASoC: rockchip: pdm: Replace dmaengine with rockchip pcm
- ASoC: rockchip: i2s-tdm: Replace dmaengine with rockchip pcm
- ASoC: rockchip: Make rockchip_pcm depends on SND_SOC_ROCKCHIP
- soc: rockchip: rockchip_sip: add get dram frequency info support
- media: i2c: gc02m2 fixes the base value of digital gain to avoid purple in the light
- media: spi: ms41908: support focus/zoom reinit run simultaneously
- media: i2c: fp5501: set phase index to 0 after reinit zoom/focus
- media: i2c: imx335: fixed short exposure calc err in DOL2 mode
- drm/rockchip/rk628: max input resolution is 4k yuv420
- arm64: dts: rockchip: rk3568: adjust opp-table
- drm/rockchip: ebc_dev: release version v2.05
- clk: rockchip: rk3568: add CLK_GATE_NO_SET_RATE flag for some clks
- clk: rockchip: add flag CLK_GATE_NO_SET_RATE
- video/rockchip: rga2: Modify blend formula
- arm64/configs: update rockchip_linux_defconfig
- media: rockchip: cif: remove dummy buffer
- media: i2c: imx415: support get sony BRL
- include: uapi/linux/rk-camera-module.h add RKMODULE_GET_SONY_BRL command
- media: i2c: add driver for ov9281@30fps
- rm/bridge: synopsys: dw-hdmi: add 1024x768p60 to default mode
- drm/rockchip: add 1024x768p60 to default output mode
- drm/bridge: analogix_dp: add default mode when get edid failed
- media: i2c: ov8858 increase vts by add sensor PLL clk
- drivers: rk_nand: zftl: fix unexpected gfp: 0x4 (GFP_DMA32) printf
- media: add motor driver fp5501 for camera focus/zoom
- serial: 8250_port: reset LSR DLAB before set MCR
- soc: rockchip: opp_select: Export rockchip_nvmem_cell_read_u8/u16()
- soc: rockchip: opp_select: Remove non-essential conditions for getting pvtm
- usb: gadget: f_uac1: adds support for SS and SSP
- usb: gadget: f_uac2: make compatible for windows os
- UPSTREAM: usb: f_uac2: adds support for SS and SSP
- media: spi: ms41908: zoom/focus use different reback value
- arm64: configs: rockchip_defconfig: Enable rknpu module
- driver: rknpu: Add rknpu driver for rk356x, version: 0.4.2
- arm64: dts: rockchip: rk3568: rknpu: Add rknpu cru reset
- arm64: dts: rockchip: rk3568: rknpu: Add new rknpu compatible with rk3568 target
- arm64: dts: rockchip: rk3568: Set spi node to fall back point
- PM / devfreq: rockchip-dfi: add support lpddr4x
- arm64: dts: rockchip: rk3568: rename mipi_dphy to video_phy
- phy/rockchip: inno-video-combo-phy: update for rk356x mipi_dphy
- drm/rockchip: driver: fix sub_dev pointer error
- drm/rockchip: analogix_dp: Add support for external bridge
- input: touchscreen: cyttsp5: fix memory out of bounds write issue
- drm/rockchip: cdn_dp: Fix link retrain condition
- phy: rockchip-typec: Fix DP lane config
- drm/bridge: dw-hdmi: fix rgb2yuv csc coeff
- drm/rockchip: dw_hdmi: correct output bus format if unsupported_yuv_input
- regulator: xz3216: update drivers to support vsel set
- cpufreq: interactive: fix policy locking
- mmc: dw_mmc-rockchip: Always fix ID mode clk request into 375KHz for RK356X
- arm64: dts: rockchip: rk3568: modify rkvdec compatible
- dt-bindings: video: mpp: add rk3568 codec properties
- video: rockchip: mpp: Fix 3568 cabac/cavlc switch issue
- mmc: sdhci-of-dwcmshc: rk3568: do not enable DLL while the clock rate less than 52mhz
- regulator: xz3216: Fix gcc this statement may fall through warning
- media: rockchip: isp: clear rdbk fifo at dmarx stop
- media: rockchip: isp: clear rdbk fifo at dmarx stop
- media: i2c: rk628csi: workround avi packet probabitity error
- include: linux: rockchip: add share mem page type define
- media: rockchip: fix isp and ispp share dmabuf release fail
- f2fs: Avoid using empty extent_tree when look up extent cache
- UPSTREAM: usb: dwc3: gadget: Remove FS bInterval_m1 limitation
- drivers: rk_nand: set dma mask to 32bits
- video: rockchip: mpp: Fix mpp_free_task crash
- arm64: dts: rockchip: enable the suspend default config for rk3568-linux
- drm/rockchip: vop2: No register mirror win when only one vp used
- drm/rockchip: vop2: close cluster sub win when main win is closed
- drm/rockchip: vop: Set output mode to P888 before send mcu cmd
```

**rkbin**:

```
- tool: ddrbin_tool: modify freq describe
- rk3568: bl31 ultra: update version to v2.07
- rk3568: bl31: update version to v1.28
- rk3566: ddr: update ultra ddr bin to v1.08
- rk3568: bl31: update version to v1.27
- rk3568: bl31 ultra: update version to v2.06
- rk3566: ddr: update ddr bin to v1.09
- rk3568: ddr: update ddr bin to v1.09
- rk356x: loader: update version to v1.10
- rk3568: bl31: update version to v1.26
- tool: ddrbin_tool: update to v1.07 20210603
- rk3568/rk3566: spl: nand: update version to v1.07
- tools: bmp2gray16: support eink power off logo
- RKBOOT: rk3566: add RK3566MINIALL_NAND.ini for nand
```

## rk356x_linux_release_v1.1.1_20210618.xml Note

**app**:

```
- remove the unused camera project
```

**external**:

```
- Remove the unused libdrm project
- Switch isp2-ipc to rk356x_dev branch
- gstreamer-rockchip: Update encoder size limits and buffer is allocated
- update mpp
```

**Buildroot (2018.02-rc3)**:

```
- gst1-plugins-bad: waylandsink: Use create_immed to create dmabuf
- Fix the UVC issues
```

**Debian10 (buster)**:

```
- overlay: add partition with by-name
- overlay-debug: QT player with xvimagesink by default
- packages: update some packages fixing issues
- overlay-debug: Update modetest
- Revert "overlay: drm-hotplug.sh: Fix DP hotplug error"
- packages: update debs for the better compatible
- overlay: update adbd and xterm environment
```

**Kernel (4.19)**:

```
- Fixes vop some bugs
- Update rk356x-evb dts
- Update isp
```

**rkbin**:

```
- rk356x: loader: update version to v1.09
- rk3568: bl31 ultra: update version to v2.05
- rk3568: bl31: update version to v1.25
- rk3568: bl31: update version to v1.24
```

## rk356x_linux_release_v1.1.0_20210520.xml Note

**Buildroot (2018.02-rc3)**:

```
- Adjust the new buildroot project
- Support buildroot 32 bits for rk356x
- Support RKNN SDK 1.0.0 Version
```

**Debian10 (buster)**:

```
- Use the new debian project
```

**Kernel (4.19)**:

```
- Enable optee by default
- Update USB/DRM/Wireless/Media/Video/Clock driver
```

**docs/tools**:

```
- Use the new docs project
```

**rkbin**:

```
- rk3568/rk3566: bl31: update version to v1.22
- rk3568/rk3566: bl32: update version to v1.05
- rk3568/rk3566: ddr: update ddr bin to v1.07
- rk3568/rk3566: spl: update version to v1.11
- rk356x: loader: update version to v1.08
```

## rk356x_linux_release_v1.0.0_20210410.xml Note

**Buildroot (2018.02-rc3)**:

```
- Upgrade libmali to g2p0
- Upgrade Chromium to 88.0.4324.150
- Support RKNN SDK 0.7 Version
- Update weston to support multi-screen
- Update mpp and gstreamer for mpeg4
- Update rockit
- Fixes qTbase/qt5multimedia/waylandsink/qt5declarative/qt5virtualkeyboard some bugs
- Support lxc and pcl
- Fixes qt5webengine on qt5.15
```

**Yocto**:

```
- Upgrade libmali to g2p0
- Upgrade Chromium to 88.0.4324.1502
```

**Debian10 (buster)**:

```
- Upgrade libmali to g2p0
- Upgrade Chromium to 88.0.4324.1502
- Support multi-screen
- Update rga/libmali/mpp packages
```

**Kernel (4.19)**:

```
- Upgrade Kernel to 4.19.172 from rockchip inside
```

**docs/tools**:

```
- Integrate AVL/DDR/DISPLAY/NVM/PCIe/UART/USB/U-BOOT documents to Common directory
- Update camera and audio documents and directory structure
- Add some rk356x documents
- Update rk_sign_tool to v1.41
- Update RKDevTool to V2.81
- Update SDDiskTool to v1.64
- Update SecureBootTool to v1.99
```

## rk356x_linux_beta_v0.2.0_20210226.xml Note

**Buildroot (2018.02-rc3)**:

```
- Use QT5.14 by default, and support QT5.15
- Upgrade Chromium to 87.0.4280.141
- Fixes qt5webengine HW video decode error on 5.15
- Update weston to fix some bugs
- Update power-key.sh for suspend and resume
- Add rockchip_rk356x_libs_defconfig for small system
```

**Yocto**:

```
- Fixes some issues on Yocto3.2
```

**Debian10 (buster)**:

```
- Fixes some issues on Debian10
```

**Kernel (4.19)**:

```
- Update Kernel from rockchip inside
```

## rk356x_linux_beta_v0.1.0_20210118.xml Note

```
- The first beta version
```

## rk356x_linux_alpha_v0.0.1_20201211.xml Note

```
- The first alpha version
```
