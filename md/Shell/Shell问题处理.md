<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-21 12:01:57
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-21 14:44:04
 * @Description: 问题处理
-->
# 问题处理

## 解决shell脚本cd命令不能进入指定目录的问题

在linux环境下，我们经常会有通过shell脚本进入指定目录的操作，脚本cddir.sh内容如下:
```sh
#!/bin/sh
path=/usr/local
cd $path
```
./cddir.sh 执行之后并不会进入local目录， 这是因为shell在执行脚本时，会创建一个子shell，并在子shell中逐个执行脚本中的指令； 而子shell中从父shell中继承了环境变量，但是执行后不会改变父shell的环境变量

解决方法:
```
source cddir.sh
. start.sh
```
source命令是在当前shell环境下执行脚本，不会创建子shell;
`. start.sh` 前的 `.` 不能忘记，代表的是在当前bash环境下读取并执行FileName中的命令，否则会新开子进程执行FileName中的命令，此时cd无法再当前bash环境跳转。 
source、sh、bash、./执行脚本的区别：http://blog.csdn.net/yun90/article/details/22667829 
（2）添加sh目录到环境变量目的是一方面可以在任何目录下执行FileName中命令，另外可以在该sh目录下添加多个此类脚本。