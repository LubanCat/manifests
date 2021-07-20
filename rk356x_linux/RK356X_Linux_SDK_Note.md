# RK356X Linux SDK Note

---

**Versions**

[TOC]

---
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
