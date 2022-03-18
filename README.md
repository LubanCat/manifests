
# Debian/Ubuntu.
```
# 安装 repo git
sudo apt install repo git
```

# 切换Python 2 版本

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

# 拉取源码
```
repo init -u git@gitlab.ebf.local:rockchip/linux/manifests.git -b linux -m rk356x_linux_release.xml

.repo/repo/repo sync -c --no-tags
```