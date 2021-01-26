<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-26 11:49:48
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-26 11:53:52
 * @Description: Linux命令执行过程
-->

# Linux命令执行过程

[Linux命令执行过程](http://c.biancheng.net/view/5969.html)

判断一个命令属于内部命令还是外部命令，可以使用 type 命令实现。例如：
[root@localhost ~]# type pwd
pwd is a shell builtin  <-- pwd是内部命令
[root@localhost ~]# type top
top is /usr/bin/top  <-- top是外部命令