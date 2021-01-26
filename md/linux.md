# Linux

[类Unix](https://github.com/yshunda/Notes/issues/4)
[Linux 内核文档（中文版）](https://tinylab.gitbooks.io/linux-doc/content/zh-cn/)
[Linux](https://www.linux.org/)
[Linux 中国](https://linux.cn/)
[Oracle 技术网](https://www.oracle.com/cn/database/technologies/oracle-technology-network.html)
[Linux 指令手册](http://linux.51yip.com/)
[嵌入式 Linux 知识库 (eLinux.org)](https://tinylab.gitbooks.io/elinux/content/zh/)
[手册页部分 1M： 系统管理命令](https://docs.oracle.com/cd/E56344_01/html/E54077/mkfile-1m.html)

## 简介

Linux 是一个类似 Unix 的操作系统，Unix 要早于 Linux，Linux 的初衷就是要替代 UNIX，并在功能和用户体验上进行优化，所以 Linux 模仿了 UNIX（但并没有抄袭 UNIX 的源码），使得 Linux 在外观和交互上与 UNIX 非常类似。

## UNIX/Linux系统结构
UNIX/Linux 系统可以粗糙地抽象为 3 个层次（所谓粗糙，就是不够细致、精准，但是便于初学者抓住重点理解），如图 3 所示。底层是 UNIX/Linux 操作系统，即系统内核（Kernel）；中间层是 Shell 层，即命令解释层；高层则是应用层。

1) 内核层
内核层是 UNIX/Linux 系统的核心和基础，它直接附着在硬件平台之上，控制和管理系统内各种资源（硬件资源和软件资源），有效地组织进程的运行，从而扩展硬件的功能，提高资源的利用效率，为用户提供方便、高效、安全、可靠的应用环境。
2) Shell层
Shell 层是与用户直接交互的界面。用户可以在提示符下输入命令行，由 Shell 解释执行并输出相应结果或者有关信息，所以我们也把 Shell 称作命令解释器，利用系统提供的丰富命令可以快捷而简便地完成许多工作。
3) 应用层
应用层提供基于 X Window 协议的图形环境。X Window 协议定义了一个系统所必须具备的功能（就如同 TCP/IP 是一个协议，定义软件所应具备的功能），可系统能满足此协议及符合 X 协会其他的规范，便可称为 X Window。


## 常用命令

### --help

查看命令帮助，如：
```
mkdir --help
```
### mkdir

```
mkdir: illegal option -- -
usage: mkdir [-pv] [-m mode] directory ...
```
创建文件夹
### mkfile
```
mkfile [ -nv ] size[b|k|m|g] filename 

   -n     Create an empty filename.  The size is noted,  but  disk             blocks aren't allocated until data is written to them.
   -v     Verbose.  Report the names and sizes of created files.
   b (512), k (1024), m (1048576), g (1073741824).
```
mkfile 用于创建一个或多个文件，使用时需要给文件制定大小，系统以补零的方式给文 件填充至制定大小。

### cat
```
cat [-benstuv] [file ...]
```
cat 用于读写文件并在终端中直接打开和编辑

### nano
```
$ nano filename
```
如果filename存在，则打开现有filename文件，并在终端中打开nano编辑器（mac 系统自带了nano 编辑器），如果filename不存在，则在当前目录下新建filename文件