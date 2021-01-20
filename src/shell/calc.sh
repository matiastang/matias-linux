#!/bin/zsh
# calc.sh

# 说明：这里通过 while [ 条件表达式 ];
# do .... done 循环来实现。-lt 是小于号 <，具体见 test 命令的用法：help test

i=0;
while [ $i -lt 100 ]
do
    ((i++))
done
echo $i