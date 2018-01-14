+++
Categories = []
Description = ""
Tags = []
date = "2018-01-14T19:31:21+08:00"
title = "Ubuntu16.04的N卡驱动安装"

+++

&emsp;&emsp;从我的内心上来说，其实不是很想写这篇文章的。讲道理作为一个已经完成一切配置的少年来说，不是应该来一发dota，把写这种文章无限期往后拖么？然而，正直善良的我怎么能够做这种过河拆桥的事呢？我一定会把自己的经验和大家分享的。咳咳……算了，还是讲实话吧：其实是发现了老婆的新剧《胜者即是正义》想看的我想着要不要边看便把文章给写了。

### 一.显卡驱动安装

&emsp;&emsp;在这里假定读者已经完成了Ubuntu16.04基本系统的安装，没有完成安装的同学可以[转到这里](https://link.jianshu.com/?t=http://forum.ubuntu.org.cn/viewtopic.php?t=478527)。在这里我会举例说明其中一种较为简单且广为适用的配置方法，读者可以理解大致流程之后找出千千万万条不同的方法进行配置，我们最终的目标都是安装好驱动即可。

**1.进行驱动安装的第一步：确定您的显卡，以及其具体需要的驱动（可以是官方的.run文件版本号也可以是apt-get可以获得的版本号）。**

&emsp;&emsp;在这一步中，我选择了具有“超级牛力”的apt-get。于是我去了系统的“软件与更新”一栏查到了我显卡配套的apt-get驱动的版本号nvidia-384。（图中为驱动已经安装好，未安装时选项应该在下面）。
<img src="http://www.drifter.fun/post/images/Ubuntu1.png" width = "" height = "400" alt="图片名称" align=center/>

**2.进行驱动安装的第二步：进入命令行模式且禁用X桌面服务**

&emsp;&emsp;ubuntu有命令行模式和X桌面模式，显卡的驱动必须在命令行模式进行。键盘上按下```ctrl + alt + F1```即进入命令行模式。您可能需要输入您的账号和密码才能进入界面。

&emsp;&emsp;禁用X桌面服务，命令行输入：```sudo service lightdm stop```。输入没有报错就好，不会有动画的。

**3.进行驱动安装的第三步：禁用nouveau驱动**

&emsp;&emsp;在安装新的驱动之前，需要对开源驱动进行屏蔽。（开源驱动是挺好，但是还是没有亲生父亲写的好呀）屏蔽的方法就是直接拉黑。首先打开黑名单：
```
sudo vi /etc/modprobe.d/blacklist.conf
```
然后加入一下几条：
```
blacklist nouveau
blacklist vga16fb
blacklist rivafb
blacklist rivatv
blacklist nvidiafb
```
(少年是不是不会vim：别怕用手机谷歌下你就知道了。提示：```i```是插入；```：wq```是保存退出)

再更新一下内核：
```
sudo update-initramfs -u
```

**4.进行驱动安装的第四步：使用apt-get安装驱动**
这一步很简单咯，记得要结合第一步的叙述。
```
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-384
```

**4.进行驱动安装的第五步：禁用Secure Boot**
首先输入```sudo reboot```重启，进入BIOS里面禁用掉Secure Boot这个Windows的小走狗。我的是华硕Z370-A主板。正好youtube上有[视频教程](https://www.youtube.com/watch?v=tnOHi0w77bU)。总之你看看呗，禁用掉就好。


&emsp;&emsp;至此您的显卡驱动就全部安装好啦，开机在“关于本机”中就能够看到你在使用你的显卡了。
<img src="http://www.drifter.fun/post/images/ubuntu2.png" width = "" height = "400" alt="图片名称" align=center/>

好累啊，今天就写到这里吧CUDA&CUDNN留到以后再写？先去把题目改了（原题目：Ubuntu16.04的N卡驱动&CUDA&CUDNN三件套安装）。

