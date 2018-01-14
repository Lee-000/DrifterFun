+++
Categories = []
Description = ""
Tags = []
date = "2018-01-14T14:29:44+08:00"
title = "N卡在Ubuntu如何设置双屏"

+++

&emsp;&emsp;当你在运行了Ubuntu并且插上N卡的电脑上想要怼上两个显示器时，你可能需要这篇文章来帮助你设置。在这篇文章的内容之前你要首先安装好N卡在Ubuntu下的专有驱动（这是一个痛苦的过程）。本文推荐的方式是利用```xrandr```命令的方式。具体步骤如下：
```
xrandr //查看现在连接的显示器 
xrandr --output HDMI-0 --primary//设置连接HDMI-0的显示器为主显示器 
xrandr --output DVI-D-0 --right-of HDMI-0 --auto //设置连接DVI-D-0的显示器在连接HDMI-0的显示器右边
```
有关xrandr的更多命令可以Google（需科学上网，推荐[Lantern](https://github.com/getlantern/forum)）。

PS:如果你购买了Lantern专业版，请用我的邀请码：YGV8NWY 你我都可以获得额外的一个月使用期限。

___ ___ ___

&emsp;&emsp;额……我傻了，```xrandr```命令的作用是只有当前会话有用，也就是说你重启或者注销之后再进去，设置就木有了。查了下，推荐的方式是写xorg.conf文件，但是我完全不会写呀……好在我还是机智的，运行了```xrandr```命令之后，你的桌面应该就是你想要的了。然后呢？然后打开系统的“显示”设置，点一下“应用修改”就可以了。原理是啥我也不太清楚，不过讲道理应该也是通过写xorg.conf吧。不管他了。
<img src="http://www.drifter.fun/post/images/N.png" width = "" height = "400" alt="图片名称" align=center />
