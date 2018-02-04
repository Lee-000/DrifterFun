+++
Categories = []
Description = ""
Tags = []
date = "2018-02-01T17:10:41+08:00"
title = "CUDA与CUDNN安装"

+++
&emsp;&emsp;今天要把之前的坑给填上，就是接着之前的Ubuntu显卡安装的那篇文章。最近至少遇到三个求助有关于这一个方面的。我觉得我有必要写一篇小文章，这样之后可以直接给别人，会比自己讲清楚很多。

&emsp;&emsp;先介绍一下什么是CUDA与CUDNN吧。**CUDA**是[Nvidia](http://www.nvidia.cn/page/home.html)推的一种统一的计算架构。这项技术支持的[GeForce 8](https://zh.wikipedia.org/wiki/NVIDIA_GeForce_8)以后的GPU和较新的[Quadro](https://zh.wikipedia.org/wiki/Quadro) GPU 进行计算。亦是首次可以利用GPU作为C-编译器的开发环境。**cuDNN**也是Nvidia推出用于深度神经网络的GPU加速库。它强调性能、易用性和低内存开销。NVIDIA cuDNN可以集成到更高级别的机器学习框架中。简单的，插入式设计可以让开发人员专注于设计和实现神经网络模型，而不是调整性能，同时还可以在GPU上实现高性能现代并行计算。

&emsp;&emsp;从这两者的定义也可以看出他们两者安装的先后：先安装CUDA然后再安装CuDNN。这是安装的第一步。确定好了安装软件的先后次序之后就是确定你需要的版本。版本的确定是依赖与你的应用的，比如Tensorflow就支持CUDNN8.0然而最新的9.0应用是不支持的，反而会报错。所以一定要确认好自己的应用。在这一步确定好了就可以开始正式的安装进程了。

### 一、CUDA安装
&emsp;&emsp;我们需要预先下载好CUDA安装文件放进电脑，[**下载地址点这里**](https://developer.nvidia.com/cuda-downloads)，请务必下载runfile文件（后缀为.run），不能是其它文件(同时确定好自己需要的版本)。

&emsp;&emsp;或者可以用wget进行下载：
```
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
```

&emsp;&emsp;下载完毕后，输入进行安装:
```
sudo sh cuda_8.0.61_375.26_linux.run
```
&emsp;&emsp;安装过程中会提示你进行一些确认操作，首先是接受服务条款，输入accept确认，然后会提示是否安装cuda tookit、cuda-example等，均输入Y进行确定。**但请注意，当询问是否安装附带的驱动时，一定要选N！附带的驱动是旧版本的而且会有问题，所以不要选择安装驱动。**

&emsp;&emsp;最后是配置环境变量，此步很重要，不配置环境变量系统将无法知道CUDA是否被安装：
输入：```sudo vi /etc/profile```，在底部插入以下两句话：

```
export PATH=/usr/local/cuda-8.0/bin:$PATH

export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH
```

最后输入：```source /etc/profile```，使设置生效。

### 二、CUDNN安装

&emsp;&emsp;CUDNN是NVIDIA用于加速深度学习的模块，装完CUDA之后就要装这个，可以预先在其它电脑下载完毕，然后复制到本机中解压。下载地址为：[NVIDIA cudnn](https://developer.nvidia.com/cudnn)

&emsp;&emsp;注意要先注册NVIDIA账号，按确认条款后才能下载。
进入CUDNN存放的文件夹，输入：

```
tar -xzf cudnn-8.0-linux-x64-v5.1.tgz

cd cuda

sudo cp lib64/* /usr/local/cuda/lib64/

sudo cp include/* /usr/local/cuda/include/
```

PS:由于Nvidia网站炸了，CUDNN8.0不好下载了。不过github上能够找到，大家可以从[**这里**](https://gist.github.com/mjdietzx/0ff77af5ae60622ce6ed8c4d9b419f45)过去。







