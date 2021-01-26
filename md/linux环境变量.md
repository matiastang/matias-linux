<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-26 11:58:02
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-26 13:44:40
 * @Description: Linux环境变量
-->
# Linux环境变量

使用 env 命令来查看到 Linux 系统中所有的环境变量
```
USER=matias
__CFBundleIdentifier=com.microsoft.VSCode
COMMAND_MODE=unix2003
LOGNAME=matias
PATH=/Users/matias/bin:/Users/matias/.matias_shell:/Users/matias/bin:/Users/matias/.matias_shell:/Users/matias/bin:/Users/matias/.matias_shell:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Users/matias/bin:/Users/matias/.matias_shell
SSH_AUTH_SOCK=/private/tmp/com.apple.launchd.cETYYjGRw6/Listeners
SHELL=/bin/zsh
HOME=/Users/matias
__CF_USER_TEXT_ENCODING=0x1F5:0x19:0x34
TMPDIR=/var/folders/cm/lrgzd4ls7978yhhys2mm48f00000gn/T/
XPC_SERVICE_NAME=0
XPC_FLAGS=0x0
ORIGINAL_XDG_CURRENT_DESKTOP=undefined
SHLVL=1
PWD=/Users/matias/matias_github/matias-linux/src/shell
OLDPWD=/Users/matias
ZSH=/Users/matias/.oh-my-zsh
PAGER=less
LESS=-R
LSCOLORS=Gxfxcxdxbxegedabagacad
LANG=zh_CN.UTF-8
TERM_PROGRAM=vscode
TERM_PROGRAM_VERSION=1.52.1
COLORTERM=truecolor
VSCODE_GIT_IPC_HANDLE=/var/folders/cm/lrgzd4ls7978yhhys2mm48f00000gn/T/vscode-git-4137363542.sock
GIT_ASKPASS=/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/git/dist/askpass.sh
VSCODE_GIT_ASKPASS_NODE=/Applications/Visual Studio Code.app/Contents/Frameworks/Code Helper (Renderer).app/Contents/MacOS/Code Helper (Renderer)
VSCODE_GIT_ASKPASS_MAIN=/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/git/dist/askpass-main.js
TERM=xterm-256color
LC_ALL=zh_CN.UTF-8
_=/usr/bin/env
```

Linux系统中重要的10个环境变量

环境变量名称	作用
HOME	用户的主目录（也称家目录）
SHELL 	用户使用的 Shell 解释器名称
PATH	定义命令行解释器搜索用户执行命令的路径
EDITOR	用户默认的文本解释器
RANDOM	生成一个随机数字
LANG	系统语言、语系名称
HISTSIZE	输出的历史命令记录条数
HISTFILESIZE	保存的历史命令记录条数
PS1	Bash解释器的提示符
MAIL	邮件保存路径

## PATH环境变量

[Linux PATH环境变量及作用](http://c.biancheng.net/view/5876.html)

介绍一下 `which` 命令，它用于查找某个命令所在的绝对路径。

`echo $PATH`查看`PATH` 环境变量的值