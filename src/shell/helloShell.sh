#!/bin/zsh
# helloShell.sh
echo "hello, world"

# 查看~/.bash_func目录是否存在
if [ -d "$HOME/.bash_func" ]
then
    echo "~/.bash_func目录存在"
    # if [[ $(ls $HOME/.bash_func | wc -c ) -gt 0 ]];then
    #     for flist in $(ls $HOME/.bash_func) 
    #     do
    #         . $HOME/.bash_func/$flist
    #     done
    # fi
else
    echo "~/.bash_func目录不存在!"
fi
cd ...