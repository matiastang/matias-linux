<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-21 12:01:57
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-21 12:02:54
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
```
source命令是在当前shell环境下执行脚本，不会创建子shell;