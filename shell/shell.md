



# 学习资料
```shell
Mode                 LastWriteTime         Length Name 
----                 -------------         ------ ----        
-a----         2021/6/25     20:26       17824956 Linux Command Line and Shell Scripting Bible 3rd Edition {PRG}.pdf    
-a----         2021/6/25     20:26       22758095 Linux命令行与shell脚本编程大全.第3版.pdf   
```


## 20 正则

### 知识点

**知识点1**

正则表达式引擎是一套底层软件，负责解释正则表达式模式并使用这些模式进行文本匹配。
在Linux中，有两种流行的正则表达式引擎：

 POSIX基础正则表达式（basic regular expression，BRE）引擎

 POSIX扩展正则表达式（extended regular expression，ERE）引擎

大多数Linux工具都至少符合POSIX BRE引擎规范，能够识别该规范定义的所有模式符号。



**知识点2**

正则表达式对匹配的模式非常挑剔。

- 第一条原则就是：正则表达式模式都区分大小写。




**Special characters**

These special characters are recognized by regular expressions:

```shell
.*[]^${}\+?|()
```

- 要用某个特殊字符作为文本字符，前面反斜线（\）。

- 正斜线在 sed编辑器或gawk程序 同样被当作特殊字符。正斜线不是正则表达式的特殊字符，但如果它出现在sed编辑器或gawk程序的正

  则表达式中，你就会得到一个错误。
  
  

**脱字符（^）**

- 脱字符（^）定义从数据流中文本行的行首开始的模式

  ```sh
  $ cat data3 
  This is a test line. 
  this is another test line. 
  A line that tests this feature. 
  Yet more testing of this 
  $ sed -n '/^
  this/p' data3 
  this is another test line. 
  $
  ```

  

- 将脱字符放到模式开头之外的其他位置，那么它就跟普通字符一样，不再是特殊字符了：

    ```sh
    $ echo "This ^
     is a test" | sed -n '/s ^
    /p' 
    This ^ is a test 
    $
    ```










### 用途

案例1；查看文本文件中空格问题
```shell
$ cat data1 
This is a normal line of text. 
This is  a line with too many spaces. 
$ sed -n '/ /p' data1 
This is a line with too many spaces. 
$
```



案例2：删除文本中的空行

sed——删除空行（包括空格、特殊字符、tab等组成的空行）

```SH
如果都是空行，而空行中没有字符的情况(但是不建议这样写)
sed -i '/^$/d' test.txt

建议加入 [[:space:]] 用以匹配空格、tab、^M 等特殊字符
sed -i '/^[[:space:]]*$/d' test.txt

上述建议方式的简化版(本人比较喜爱的一种方式，但特殊字符只匹配过'^M'，其他未验证)
sed -i '/^\s*$/d' test.txt

 * (星号)用以匹配空格、tab、'^M'类特殊字符等至少零次

```

