# Linux自定义命令
```c
# matias自定义脚本方法目录
drwxr-xr-x   6 matias  staff   192B  1 21 13:35 .bash_func
# matias自定义脚本
drwxr-xr-x   4 matias  staff   128B  1 21 15:03 .matias_shell
```
## 介绍

自定指令的方法主要有三种：
1. 环境变量法
2. alias方法
3. 建立fish shell一样的函数机制
4. 将`.sh`移动到`bin`文件夹

[linux中利用shell脚本条件执行linux命令](https://blog.csdn.net/qq_34810707/article/details/83116467)

## 环境变量法

熟悉linux的都知道，大部分发行版都会判断用户目录下是否有bin目录，如果有就会将这个目录加入环境变量，也就是说，我们可以将一些脚本写好放到这个目录下，也就是$HOME/bin目录下，这样我们就可以在终端直接调用脚本了，上述判断bin目录是否存在的部分一般会放在$HOME/.profile,我的系统下这部分内容如下：

```sh
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
```

当然，如果之前目录中没有bin目录，我们自己手动在$HOME目录下建立bin,这个时候需要我们注销后再登录才可以，或者执行source $HOME/.profile。

1. 编写`.sh`
```sh
#!/bin/zsh -v
###
 # @Author: tangdaoyong
 # @Date: 2021-01-21 14:58:38
 # @LastEditors: tangdaoyong
 # @LastEditTime: 2021-01-21 15:00:47
 # @Description: file content
### 
# ~/.zshrc 添加 export PATH=$HOME/bin:/Users/matias/.matias_shell:$PATH
echo "hello, start"
```
2. 添加到文件夹`/Users/matias/.matias_shell`
3. `~/.zshrc` 添加`PATH`如：`export PATH=$HOME/bin:/Users/matias/.matias_shell:$PATH`
4. 执行`source ~/.zshrc`
5. 在当前`shell`环境下执行脚本`. mt_start.sh`或`source start.sh`
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

## 总结比较
| 方法 | 优点 | 缺点 |
| - | - | - |
| 环境变量法 | 管理方便，实现简单 | fork了子模块，注定有些你想要实现的实现起来可能比较复杂 |
| alias法 | 简单，明了 | 如果要实现复杂的，将要写脚本，在赋别名，不好管理 |
| 函数法 | 管理方便，实现简单，函数在终端启动时就加载完毕 | 过多的函数可能造成启动终端较慢，单应该没有明显的迟钝 |

## 将`.sh`移动到`bin`文件夹

1. 编写`.bin`文件
2. 将`.sh`移动到`bin`文件夹
```
sudo mv mt_saferm.sh /bin
```
`MacOS`的`bin`文件夹在`/usr/local/bin`
```
sudo mv mt_saferm.sh /usr/local/bin
```
3. 定义别名，可略
```
alias rm=saferm.sh
```
4. 执行下面的命令使其生效，
```
$ source ~/.bashrc
$ source ~/.zshrc
```
5. 可以测试了。
## 错误

* assignment

`=`两边不能有空格