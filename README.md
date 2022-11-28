# 主机构建环境搭建

## Ubuntu LTS
```
# 安装SDK构建所需要的软件包
sudo apt install repo git ssh make gcc libssl-dev liblz4-tool \
expect g++ patchelf chrpath gawk texinfo chrpath diffstat binfmt-support \
qemu-user-static live-build bison flex fakeroot cmake gcc-multilib g++-multilib \
unzip device-tree-compiler python-pip libncurses5-dev python3-pyelftools \
u-boot-tools
```

## 切换Python 2 版本 （Ubuntu18.04）

由于在Ubuntu18.04中，用apt命令安装的repo版本较旧，仅支持Python2版本，所以我们先要将系统python版本切换为python2

查看当前Python版本
```
python -V
```
若返回的版本号为Python2版本，则无需再切换Python版本。若为Python3版本或未发现python，则可以用以下方式切换：

```
#查看当前系统安装的Python版本有哪些
ls /usr/bin/python*

#将python链接到python2
sudo ln -sf /usr/bin/python2 /usr/bin/python

#重新查看默认Python版本
python -V
```
此时系统默认Python版本切换为python2

我们需要先将repo升级到最新的完整版本

```
repo init --repo-url https://mirrors.tuna.tsinghua.edu.cn/git/git-repo
```

由于最新的完整版repo使用Python3，而我们的Python环境为Python2，所以脚本无法正常运行，需要再切换回Python3。

注意：切换Python2版本仅Ubuntu18.04版本需要。

## 切换Python 3 版本

查看当前Python版本
```
python -V
```
若返回的版本号为Python3版本，则无需再切换Python版本。若为Python2版本或未发现python，则可以用以下方式切换：

```
#查看当前系统安装的Python版本有哪些
ls /usr/bin/python*

#将python链接到python3
sudo ln -sf /usr/bin/python3 /usr/bin/python

#重新查看默认Python版本
python -V
```
此时系统默认Python版本切换为python3

## 拉取源码
```
#内部地址(用户使用)
repo init --repo-url https://mirrors.tuna.tsinghua.edu.cn/git/git-repo \
-u https://github.com/LubanCat/manifests.git -b linux -m rk356x_linux_release.xml


#内部地址(内部开发使用)
repo init --repo-url https://mirrors.tuna.tsinghua.edu.cn/git/git-repo \
-u git@gitlab.ebf.local:rockchip/linux/manifests.git -b linux -m rk356x_linux_release.xml

.repo/repo/repo sync -c --no-tags
```

# 构建板卡通用镜像

##安装构建根文件系统依赖
```
sudo dpkg -i debian/ubuntu-build-service/packages/*
sudo apt-get install -f
```

## 一键构建

```
#选择要构建的板卡的配置文件
./build.sh lunch

#输入对应板卡不同系统配置文件前的序号
Which would you like? [0]:2

#一键编译
./build.sh
```

## 单独编译

```
# U-Boot 编译
./build.sh uboot

# Kernel 编译
/build.sh kerneldeb
/build.sh extboot

# Debian 编译
./build.sh debian

# 打包update.img镜像
./build.sh updateimg
```

<!-- ## 构建示例

### LubanCat2 板卡 Debian 10 操作系统构建

Debian/Ubuntu镜像构建之前，请查看相应目录下readme.md文件，安装构建工具，此构建工具不同版本不通用。

```
# 选择板卡配置文件，可直接指定配置文件名称，也可以用 ./build.sh lunch 来选择
./build.sh BoardConfig-LubanCat2-debian.mk

# U-Boot 编译
./build.sh uboot

# Kernel 编译
/build.sh kernel

# Recovery 编译
source envsetup.sh rockchip_rk3568
./build.sh recovery

# Ubuntu 编译
./build.sh debian

# 打包update.img镜像
./build.sh updateimg
```

### LubanCat2 板卡 Buildroot操作系统构建

```
# 选择板卡配置文件，可直接指定配置文件名称，也可以用 ./build.sh lunch 来选择
./build.sh BoardConfig-LubanCat2-buildroot.mk

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
``` -->

#### 注意

- 指定的配置文件需要与操作系统对应
- 各操作系统只有rootfs的构建不同，U-Boot、Kernel都是相同的
- 生成的镜像保存在 rockdev目录下
- Ubuntu镜像需单独操作
- 镜像详细构建流程请查看在线文档《[野火]嵌入式Linux镜像构建与部署—基于LubanCat-RK系列板卡》 https://doc.embedfire.com/linux/rk356x/build_and_deploy/zh/latest/index.html
