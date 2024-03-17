# Neardi-3588-SDK-Linux-V3.0
> Buildroot 是 Linux 平台上一个构建嵌入式 Linux 系统的框架。整个 Buildroot 是由 Makefile(*.mk) 脚本和 Kconfig(Config.in) 配置文件构成的。你可以和编译 Linux 内核一样，通过 buildroot 配置，menuconfig 修改，编译出一个完整的可以直接烧写到机器上运行的 Linux 系统软件（包含 boot、kernel、rootfs 以及 rootfs 中的各种库和应用程序）。若您要了解更多 Buildroot 开发相关内容，可以参考 Buildroot 官方的 《开发手册》。

## 硬件配置
### 编译 Ubuntu 开发环境硬件配置建议：

> 64 位 CPU

> Ubuntu20.04系统

> 16GB 内存

> 250GB 空闲空间用来编译

> 普通用户编译，不要使用 root 用户编译

## 软件配置
### 安装环境包

```
	sudo apt update
	sudo apt-get install git ssh make gcc libssl-dev liblz4-tool \
	expect g++ patchelf chrpath gawk texinfo chrpath diffstat binfmt-support \
	qemu-user-static live-build bison flex fakeroot cmake gcc-multilib g++-multilib \
	unzip device-tree-compiler libncurses-dev
	
	sudo pip install python-pip pyelftools
```
## SDK获取

### 发送邮件至 support@neardi.com 获取相关开发资料

> 下载完成后，在解压前先查看 MD5 码和Neardi-3588-SDK-Linux-${Version}.tar.gz.md5sum中是否一致：
```
$md5sum Neardi-3588-SDK-Linux-${Version}.tar.gz
******************************** Neardi-3588-SDK-Linux-${Version}.tar.gz
解压：
```

```
tar zxvf Neardi-3588-SDK-Linux-${Version}.tar.gz
```

### 提取：
> Neardi-3588-SDK-Linux-${Version}
```
	git reset --hard
```
> branch	explain
> LZ16000002	Neardi master branch
```
git checkout LZ16000002
```
### 编译 SDK
#### 选择配置
```
	boardConfig	explain
	BoardConfig-rk3588-neardi-linux-lpb3588-f0.mk	HDMIIN + HDMI1 + HDMI2 + HDMI3 + DP
	./build.sh lunch BoardConfig-rk3588-neardi-linux-lpb3588-f0.mk
```
#### 全自动编译
> 第一次编译SDK，务必全编一次，否则打包会出错

> 全自动编译会执行所有编译, 编译生成u-boot、kernel和buildroot。
``` 
./build.sh
```
> 部分编译

> 编译 u-boot

```
./build.sh uboot
```
编译 kernel
```
./build.sh kernel
```
编译 recovery
```
./build.sh recovery
```

编译Buildroot
```
./build.sh rootfs
```
### 打包固件
> RK 固件，是以 Rockchip 专有格式打包的固件，使用 Rockchip 提供的工具可以烧写到 eMMC 或者 SD 卡中(注：若无特殊说明，WIKI 上提及的固件默认为 RK 固件)。

# 打包 RK 固件
> ./build.sh updateimg

> 生成的完整固件会保存到 rockdev/update.img。