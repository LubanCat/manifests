# 主机构建环境搭建

## Ubuntu LTS
```
# 安装SDK构建所需要的软件包
sudo apt install git ssh make gcc libssl-dev liblz4-tool u-boot-tools curl\
expect g++ patchelf chrpath gawk texinfo chrpath diffstat binfmt-support \
qemu-user-static live-build bison flex fakeroot cmake gcc-multilib g++-multilib \
unzip device-tree-compiler python-pip libncurses5-dev python3-pyelftools \
dpkg-dev

```

## 安装repo

```
mkdir ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
# 如果上面的地址无法访问，可以用下面的：
# curl -sSL  'https://gerrit-googlesource.proxy.ustclug.org/git-repo/+/master/repo?format=TEXT' |base64 -d > ~/bin/repo
chmod a+x ~/bin/repo    
echo PATH=~/bin:$PATH >> ~/.bashrc
source ~/.bashrc
```
执行完上面的命令后我们来验证repo是否安装成功能正常运行。
```
repo --version

#返回以下信息
#返回的信息根据Ubuntu版本的不同略有差异
<repo not installed>
repo launcher version 2.32
    (from /home/he/bin/repo)
git 2.25.1
Python 3.8.10 (default, Nov 14 2022, 12:59:47) 
[GCC 9.4.0]
OS Linux 5.15.0-60-generic (#66~20.04.1-Ubuntu SMP Wed Jan 25 09:41:30 UTC 2023)
CPU x86_64 (x86_64)
Bug reports: https://bugs.chromium.org/p/gerrit/issues/entry?template=Repo+tool+issue
```

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
#github地址(用户使用)
repo --trace init --depth=1 -u https://github.com/LubanCat/manifests.git -b linux -m rk356x_linux_release.xml


#内部地址(内部开发使用)
repo init -u git@gitlab.ebf.local:rockchip/linux/manifests.git -b linux -m rk356x_linux_release.xml

# 同步源码
.repo/repo/repo --trace sync -c -j4
```

--depth=1 可以在拉取时进行浅克隆，只拉取最新的一次提交，可以有效减少从网络拉取的内容。如果想拉取完整的带所有提交的内容，可以删除此选项。

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
