# 构建环境搭建

## Debian/Ubuntu.
```
# 安装 repo git
sudo apt install repo git
```

## 切换Python 2 版本

查看当前Python版本
```
python -V
```
若返回的版本号为Python2版本，则无需再切换Python版本。若为Python3版本，则可以用以下方式切换：

```
#查看当前系统安装的Python版本有哪些
ls /usr/bin/python*

#将python链接到python2
sudo ln -sf /usr/bin/python2 /usr/bin/python

#重新查看默认Python版本
python -V
```
此时系统默认Python版本切换为python2

## 拉取源码
```
repo init -u git@gitlab.ebf.local:rockchip/linux/manifests.git -b linux -m rk356x_linux_release.xml

.repo/repo/repo sync -c --no-tags
```

# 构建镜像
## 一键构建

```
#选择要构建的板卡的配置文件
./build.sh lunch

#输入对应板卡不同系统配置文件前的序号
Which would you like? [0]:8

#一键编译
./build.sh
```



## 修改Ubuntu系统的版本

打开 device/rockchip/rk356x/BoardConfig-rkxx-lubancat-xx-ububtu.mk

```
#修改Ubuntu版本,当前只支持bionic
# bionic：ubuntu18.04  focal:ubuntu20.04
RK_UBUNTU_VERSION=bionic

#修改是否添加桌面套件
#desktop:桌面版 console：控制台版
RK_ROOTFS_TARGET=desktop
```

## 单独编译

```
# U-Boot 编译
./build.sh uboot

# Kernel 编译
/build.sh kernel

# Recovery 编译
# 需要特别注意 recovery.img 是包含 kernel.img，所以每次 Kernel 更改，Recovery 是需要重新打包生成。
source envsetup.sh rockchip_rk3568
./build.sh recovery

# Buildroot 编译
./build.sh buildroot

# Debian 编译
./build.sh debian

# Ubuntu 编译
./build.sh ubuntu

# 打包update.img镜像
./build.sh updateimg
```

## 构建示例

### LubanCat-rk3568-LBC板卡 Ubuntu18.04操作系统构建

```
# 选择板卡配置文件，可直接指定配置文件名称，也可以用 ./build.sh lunch 来选择
./build.sh BoardConfig-rk3568-lubancat-lbc-ubuntu.mk

# U-Boot 编译
./build.sh uboot

# Kernel 编译
/build.sh kernel

# Recovery 编译
source envsetup.sh rockchip_rk3568
./build.sh recovery

# Ubuntu 编译
./build.sh ubuntu

# 打包update.img镜像
./build.sh updateimg
```



### LubanCat-rk3568-LBC板卡 Buildroot操作系统构建

```
# 选择板卡配置文件，可直接指定配置文件名称，也可以用 ./build.sh lunch 来选择
./build.sh BoardConfig-rk3568-lubancat-lbc-buildroot.mk

# U-Boot 编译
./build.sh uboot

# Kernel 编译
/build.sh kernel

# Recovery 编译
source envsetup.sh rockchip_rk3568
./build.sh recovery

# Buildroot 编译
./build.sh buildroot

# 打包update.img镜像
./build.sh updateimg
```

#### 注意

- 指定的配置文件需要与操作系统对应
- 各操作系统只有rootfs的构建不同，U-Boot、Kernel、Recovery都是相同的
- 生成的镜像保存在 rockdev目录下，在 IMAGE 目录下备份
