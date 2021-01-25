<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-20 17:08:24
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-25 10:20:24
 * @Description: 常用命令
-->
# linux常用命令

[Linux中常用操作命令](https://www.cnblogs.com/banjinbaijiu/p/9140460.html)

## 查看当前用户
```
whoami
lastlog
```

* 命令groups 查看当前用户bai所du属zhi组
[root@localhost xly]# groups

root

* groups 用户（查看用户所属组）

[root@localhost xly]# groups xly

xly : xly

* id 用户(查看用户所属组）

[root@localhost xly]# id xly

uid=500(xly) gid=500(xly) groups=500(xly)

* 直接查看组文件，cat /etc/group

[root@localhost xly]# cat /etc/group

root:x:0:

bin:x:1:bin,daemon

daemon:x:2:bin,daemon

sys:x:3:bin,adm

adm:x:4:adm,daemon

tty:x:5:

disk:x:6:

lp:x:7:daemon

mem:x:8:

kmem:x:9:

xly:x:500:

* 命令：cat /etc/group|grep 组名，用于查找某个用户组
## grep

[linux grep命令详解](https://www.cnblogs.com/ggjucheng/archive/2013/01/13/2856896.html)
```
grep [-abcDEFGHhIiJLlmnOoqRSsUVvwxZ] [-A num] [-B num] [-C[num]]
        [-e pattern] [-f file] [--binary-files=value] [--color=when]
        [--context[=num]] [--directories=action] [--label] [--line-buffered]
        [--null] [pattern] [file ...]
```
[root@www ~]# grep [-acinv] [--color=auto] '搜寻字符串' filename
选项与参数：
使用grep -o "xxx字符"按行显示出所有的匹配结果
-a ：将 binary 文件以 text 文件的方式搜寻数据
<!-- -c ：计算找到 '搜寻字符串' 的次数 -->
-c ：计算找到 '搜寻字符串' 的行数，而不是次数，如果一样中出现两次 ‘搜寻字符串’ 计数为1， 而不是2
-i ：忽略大小写的不同，所以大小写视为相同
-n ：顺便输出行号
-v ：反向选择，亦即显示出没有 '搜寻字符串' 内容的那一行！
--color=auto ：可以将找到的关键词部分加上颜色的显示喔！

当前工作目录级数
```
pwd | grep --color '\/' | grep -o '\/' | grep -c '\/'
```
## pwd
该命令的作用是`print name of current/working directory`，这才是此命令的真实含义，当前的工作目录。
`pwd`命令能够显示当前所处的路径。

shell脚本内使用pwd命令：
```sh
#!/bin/bash
path=`pwd`
echo $path
```

## shell 中获取当前工作路径和命令文件所在绝对路径

[Linux中shell脚本获取当前工作目录的方法](https://blog.csdn.net/jiangshaoxin1987/article/details/102622983)

工作路径使用`pwd`
命令文件所在绝对路径使用
```sh
basepath=$(cd `dirname $0`; pwd)
```
dirname $0，取得当前执行的脚本文件的父目录
cd `dirname $0`，进入这个目录(切换当前工作目录)
pwd，显示当前工作目录(cd执行后的)
由此，我们获得了当前正在执行的脚本的存放路径。
## pbcopy

`pbcopy < id_rsa_github.pub`复制某个文件中的内容到粘贴板

## rm

`-r`: 删除文件夹
`-f`: 强制删除文件
## mkfile

`mkfile -n size[b|k|m|g]` 文件名：例如`mkfile -n 1m demo.rtf`就是在当前路径下创建一个`1m`大小名为`demo.rtf`文件。
`mkfile -n 1m demo1.rtf demo2.rtf demo3.rtf`:创建三个大小相同的文件。
`rm demo.rtf demo2.rtf`：删除两个文件。

## mkdir

`mkdir name`：创建名为`name`文件夹。
`rm -r demo/`:删除demo文件夹。

## cd

* cd        进入用户主目录 
* cd ~     进入用户主目录 
* cd -      返回进入此目录之前所在目录 
* cd ..     返回上一级目录 
* cd ../..  返回上两级目录 
* cd !$    把上个命令的参数作为 cd 参数使用 
* cd /      进入根目录
* cd .      当前目录

使用`cd ..`返回多级不是很方便，可以自定义别名
```
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
```

## 错误

### zsh error: export:54: not valid in this context:

### not an identifier

`=`两边不能有空格