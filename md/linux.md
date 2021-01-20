# Linux

[Linux 内核文档（中文版）](https://tinylab.gitbooks.io/linux-doc/content/zh-cn/)
[Linux](https://www.linux.org/)
[Linux 中国](https://linux.cn/)
[Oracle 技术网](https://www.oracle.com/cn/database/technologies/oracle-technology-network.html)
[Linux 指令手册](http://linux.51yip.com/)
[嵌入式 Linux 知识库 (eLinux.org)](https://tinylab.gitbooks.io/elinux/content/zh/)
[手册页部分 1M： 系统管理命令](https://docs.oracle.com/cd/E56344_01/html/E54077/mkfile-1m.html)

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