#!/bin/zsh
###
 # @Author: matiastang
 # @Date: 2021-12-14 13:44:54
 # @LastEditors: matiastang
 # @LastEditTime: 2021-12-14 13:53:32
 # @FilePath: /matias-linux/src/shell/test.sh
 # @Description: Shell 脚本获取当前目录 和 获得 文件夹名
### 
project_path=$(cd `dirname $0`; pwd)
project_name="${project_path##*/}"
echo $project_path
echo $project_name

#   #:表示从左开始算起，并且截取第一个匹配的字符
#   ##:表示从左开始算起，并且截取最后一个匹配的字符
#   %:表示从右开始算起，并且截取第一个匹配的字符
#   %%:表示从右开始算起，并且截取最后一个匹配的字符