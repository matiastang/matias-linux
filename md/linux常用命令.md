<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-20 17:08:24
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-20 17:12:08
 * @Description: 常用命令
-->
# linux常用命令

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