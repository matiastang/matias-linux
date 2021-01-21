<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-21 11:08:45
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-21 11:11:02
 * @Description: 管道
-->
# 管道

[Linux Shell管道详解](http://c.biancheng.net/view/3131.html)

& 两条命令依次次执行，&& 表示前面失败后面不执行，|| 前面失败才执行后面命令
cd aaa & ls
 
cd aaa && ls
 
cd aaa || ls
 > 管道符号，输入到某文件中，>> 追加文件
shell 命令 > ip.txt
 
shell 命令 >> ip.txt