



# python





迭代器与生成器



简单点，生成器使用了yield代替了return关键字

生成器是一类特殊的迭代器，生成器只能遍历一次。生成器在需要的时候才产生结果，不是立即产生结果。







```
1、下列的说法中，不正确的是
A
迭代器协议是指：对象必须提供一个next方法
B
list、dict、str虽然是Iterable，却不是Iterator
C
生成器与迭代器对象的区别在于：它仅提供next()方法
D
生成器实现了迭代器协议，但生成器是边计算边生成达到节省内存及计算资源
```



```
正确答案是：C，您的选择是：C

解析：

迭代器和生成器都是Python中特有的概念，迭代器可以看作是一个特殊的对象，每次调用该对象时会返回自身的下一个元素。
一个可迭代的对象必须是定义了__iter__()方法的对象（如列表，元组等），而一个迭代器必须是定义了__iter__()方法和next()方法的对象。因此C选项错误。
```



AI笔试面试题库 - 七月在线
https://www.julyedu.com/question/selectAnalyze/kp_id/28/cate/Python



## 函数 

### Python  filter() 函数

[![Python 内置函数](python.assets/up.gif) Python 内置函数](https://www.runoob.com/python/python-built-in-functions.html)

------

描述

**filter()** 函数用于过滤序列，过滤掉不符合条件的元素，返回由符合条件元素组成的新列表。

该接收两个参数，第一个为函数，第二个为序列，序列的每个元素作为参数传递给函数进行判断，然后返回 True 或 False，最后将返回 True 的元素放到新列表中。





```python

# 过滤出列表中的所有奇数：
#!/usr/bin/python
# -*- coding: UTF-8 -*-
 
def is_odd(n):
    return n % 2 == 1
 
newlist = filter(is_odd, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
print(newlist)

```



## python  试题

迭代器与生成器

```
1、下列的说法中，不正确的是
A
迭代器协议是指：对象必须提供一个next方法
B
list、dict、str虽然是Iterable，却不是Iterator
C
生成器与迭代器对象的区别在于：它仅提供next()方法
D
生成器实现了迭代器协议，但生成器是边计算边生成达到节省内存及计算资源
```



```
正确答案是：C，您的选择是：C

解析：

迭代器和生成器都是Python中特有的概念，迭代器可以看作是一个特殊的对象，每次调用该对象时会返回自身的下一个元素。
一个可迭代的对象必须是定义了__iter__()方法的对象（如列表，元组等），而一个迭代器必须是定义了__iter__()方法和next()方法的对象。因此C选项错误。
```







```
2、执行以下代码的结果是？
x=True;y,z=False,False

if x or y and z:
 print('yes')
else:
 print('no')
 
A
yes

B
no

C
unable to run

D
An exception is thrown

```





