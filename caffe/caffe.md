# caffe



## **prototxt配置文件**



要运行caffe，需要先创建一个模型（model)，如比较常用的Lenet,Alex等，  而一个模型由多个屋（layer）构成，每一层又由许多参数组成。所有的参数都定义在caffe.proto这个文件中。要熟练使用caffe，最重要的就是学会配置文件（prototxt）的编写。我们可以直接使用vim编写prototxt文件，也可以使用caffe的python接口编写这个配置文件。但无论如何，都应该先对于模型的各个层有所了解。

  层有很多种类型，比如Data,Convolution,Pooling等，层之间的数据流动是以Blobs的方式进行。

  caffe一般使用的prototxt配置文件有如下几种：



![img](caffe.assets/20170420092008073)









LeNet 的 prototxt 文件实例

```prototxt
// 输入层的定义：
name: "LeNet" （网络的名字）
　　layer { （定义一个网络层）
　　name: "data" (网络层的名字为 data)
　　type: "Input" （网络层的类型，输入）
　　top: "data" （该网络层的输出叫 data ）
　　input_param { shape: { dim: 64 dim: 1 dim: 28 dim: 28 } } }（64张图像为一批，28*28大小）
}
////读取这批数据维度：64 1 28 28
 
// 第一卷积层的定义：
layer {
　　name: "conv1" (网络层的名字为 conv1)
　　type: "Convolution" （网络层类型是 卷积层）
　　bottom: "data" （该层的输入层是 data 层）
　　top: "conv1" (该层的输出层叫 conv1 feature maps)
　　param {
　　　　lr_mult: 1 （weights的学习率与全局相同）
　　}
　　param {
　　　　lr_mult: 2 （biases的学习率是全局的2倍)
　　}
　　convolution_param { {（卷积操作参数设置）
　　　　num_output: 20 （卷积输出数量20，由20个特征图Feature Map构成）
　　　　kernel_size: 5 (卷积核的大小是5*5）
　　　　stride: 1 （卷积操作步长）
　　　　weight_filler {
　　　　　　type: "xavier" （卷积滤波器的参数使用 xavier 方法来初始化）
　　　　}
　　　　bias_filler {
　　　　　　type: "constant" （bias使用0初始化）
　　　　}
　　}
}
////卷积之后这批数据维度：64 20 24 24
 
// 第一池化层定义：
layer {
　　name: "pool1" （网络层的名字是 pool1 ）
　　type: "Pooling" （网络层的类型是 池化操作）
　　bottom: "conv1" （网络层的输入是 conv1 feature maps）
　　top: "pool1" （网络层的输出是 pool1）
　　pooling_param { （池化参数设置）
　　　　pool: MAX （最大池化操作）
　　　　kernel_size: 2 （池化核尺寸，2*2 区域池化）
　　　　stride: 2 （池化步长）
　　}
}
////池化之后这批数据维度：64 20 12 12
 
// 第二卷积层的定义：
layer {
　　name: "conv2" （该网络层的名字）
　　type: "Convolution" （该网络层的类型，卷积）
　　bottom: "pool1" （该网络层的输入是 pool1）
　　top: "conv2" （该网络层的输出是 conv2， feature maps）
　　param {
　　　　lr_mult: 1 （weights的学习率与全局相同）
　　}
　　param {
　　　　lr_mult: 2 （biases的学习率是全局的2倍)
　　}
　　convolution_param { (卷积参数设置)
　　　　num_output: 50 （卷积的输出个数，由50个特征图Feature Map构成）
　　　　kernel_size: 5 （卷积核尺寸 5*5）
　　　　stride: 1 （卷积步长）
　　　　weight_filler {
　　　　　　type: "xavier"
　　　　}
　　　　bias_filler {
　　　　　　type: "constant"
　　　　}
　　}
}
////卷积之后这批数据维度：64 50 8 8
 
// 第二池化层的定义：
layer {
　　name: "pool2"
　　type: "Pooling"
　　bottom: "conv2"
　　top: "pool2"
　　pooling_param {
　　　　pool: MAX
　　　　kernel_size: 2
　　　　stride: 2
　　}
}
////池化之后这批数据维度：64 50 4 4
 
// 第一层全链接层的定义：
layer {
　　name: "ip1" (该网络层的名字 ip1)
　　type: "InnerProduct" (该网络层的类型是 全链接层)
　　bottom: "pool2" （该层的输入是 pool2）
　　top: "ip1" （该层的输出是 ip1）
　　param {
　　　　lr_mult: 1
　　}
　　param {
　　　　lr_mult: 2
　　}
　　inner_product_param { (全链接层的 参数设置)
　　　　num_output: 500 （500个输出神经元）
　　　　weight_filler {
　　　　　　type: "xavier"
　　　　}
　　　　bias_filler {
　　　　　　type: "constant"
　　　　}
　　}
}
////500 个神经元
 
// 激活函数层的定义：
layer {
　　name: "relu1" （该网络层的名字 relu1）
　　type: "ReLU" （该网络层的类型， ReLU 激活函数）
　　bottom: "ip1" （该层的输入是 ip1）
　　top: "ip1" （该层的输出还是 ip1,底层与顶层相同是为了减少开支）
}
 
// 第二全链接层的定义：（数据的分类判断在这一层中完成）
layer {
　　name: "ip2"
　　type: "InnerProduct"
　　bottom: "ip1"
　　top: "ip2"
　　param {
　　　　lr_mult: 1
　　}
　　param {
　　　　lr_mult: 2
　　}
　　inner_product_param {
　　　　num_output: 10 （直接输出结果，0-9，十个数字所以维度是10）
　　　　weight_filler {
　　　　　　type: "xavier"
　　　　}
　　　　bias_filler {
　　　　　　type: "constant"
　　　　}
　　}
}
 
// 输出层的定义：
layer {
　　name: "prob"
　　type: "Softmax" （损失函数）
　　bottom: "ip2"
　　top: "prob"
}
```





[caffe] 史上最透彻的lenet.prototxt解析 - 谷阿幻 - 博客园
https://www.cnblogs.com/guweixin/p/10764687.html





Caffe学习笔记(三)：cifar10_quick_train_test.prototxt配置文件分析_Jack-Cui-CSDN博客_cifar10_quick.prototxt cifar10_quick_train_test.pr
https://blog.csdn.net/c406495762/article/details/70255099







## layer 模块



### type: "Convolution"

以 DenseNet201 为例子



如DenseNet 的第一个卷积层

```
layer {
  name: "conv1"
  type: "Convolution"
  bottom: "data"
  top: "conv1"
  convolution_param {
    num_output: 64
    bias_term: false
    pad: 3
    kernel_size: 7
    stride: 2
  }
}
```



缺少 pad 参数，默认是0

缺少 stride 参数 ， 默认是1

不过有些卷积层的参数是缺少的，那么他的默认参数是什么



```
layer {
  name: "conv2_1/x1"
  type: "Convolution"
  bottom: "conv2_1/x1/bn"
  top: "conv2_1/x1"
  convolution_param {
    num_output: 128
    bias_term: false
    kernel_size: 1
  }
}
```



书籍：《深度学习实践 基于caffe的解析》