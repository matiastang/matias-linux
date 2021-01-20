# Linux自定义命令


## 介绍

自定指令的方法主要有三种：
1. 环境变量法
2. alias方法
3. 建立fish shell一样的函数机制

## 环境变量法

## alias方法

我使用的`zsh`，自定义命令放在`~/.zshrc`
1. `vim ~/.zshrc`编辑
```
# matiastang

alias mt_c="clear"
```
2. 查看`cat ~/.zshrc`
3. 生效`source ~/.zshrc`

## 建立fish shell一样的函数机制

上面两种方式不太好管理，而fish shell中自定义指令是使用函数的方式来实现的，一条自定义指令可以对应一个函数，于是我们可以借助fish shell的这种思路来在bash上实现。实现方法如下：

**建立放置函数的文件夹**
我的方法是在$HOME下建立.bash_func文件夹，可使用命令 mkdir -p $HOME/.bash_func实现。

在$HOME/.bashrc下添加加载函数的代码
在$HOME/.bashrc后面添加以下部分
```sh
# 查看~/.bash_func目录是否存在
if [ -d "$HOME/.bash_func" ]
then
    if [[ $(ls $HOME/.bash_func | wc -c ) -gt 0 ]];then
        for flist in $(ls $HOME/.bash_func) 
        do
            . $HOME/.bash_func/$flist
        done
    fi
fi
```
这样以来，我们在~/.bash_func/下建立文件写函数，启动终端后，就能自动加载函数，之后就可以做为自定义的指令使用。

比如，我们建立t_func文件(.sh)，文件内容如下：
```sh
function t_func(){
    echo "hello,this is a demo!"
}
```
 
然后我们新打开一个终端，注意要新打开，或者你可以先把shell切换到sh，再切换到bash，使得.vimrc文件被加载，然后我们终端输入t_func可以看到效果！

需要注意的是，要写成函数的形式，虽然一个文件中可以写多个函数，但是建立一个文件写一个函数，一个函数就是一条自定义指令，这样方便管理！

## 错误

* assignment

`=`两边不能有空格