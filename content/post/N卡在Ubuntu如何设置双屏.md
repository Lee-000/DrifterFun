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
有关xrandr的更多命令可以Google（需科学上网，推荐Lantern）。
