<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-21 09:39:53
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-25 11:28:38
 * @Description: rm命令
-->
# rm命令

## 介绍

Linux rm（英文全拼：remove）命令用于删除一个文件或者目录。
> rm [options] name...

-f, --force    忽略不存在的文件，从不给出提示。即使原档案属性设为唯读，亦直接删除，无需逐一确认。
-i, --interactive 进行交互式删除，删除前逐一询问确认。
-r, -R, --recursive   指示rm将参数中列出的全部目录和子目录均递归地删除。将目录及以下之档案亦逐一删除。
-v, --verbose    详细显示进行的步骤
    --help     显示此帮助信息并退出
    --version  输出版本信息并退出

### 删除文件可以直接使用rm命令
> rm test.md
### 删除目录则必须配合选项"-r"
> rm -r test

### 删除当前目录下的所有文件及目录
> rm  -r  *


rm常见命令参数
rm: 可以备份，尽量不要删除，比删除更好的是重命名  -->只删除文件链接，重启、重新写入后回收

删除文件时，使用绝对路径或者进入到目标路径下后使用删除命令 –> 禁止使用rm –rf ./XXX文件【少个点就是根目录了】

-r : 删除文件夹

-f : 强制删除文件

rm命令删除文件的原理
文件删除原理: Linux通过文件link的数量控制文件的删除，只有当一个文件不存在任何link的时候且没有程序调用的时候，文件才会被真正删除。

就rm命令而言，就是减少磁盘引用计数i_link(文件到inode的链接数量)；inode节点指向存储数据的block,删除文件并不是清除inode和block，而是将文件的硬链接为0，引用计数为0 才能删除文件

注：如果有新的数据存储或者系统通过类似fsck命令做磁盘检查的时候，被删除的数据块和目录会被释放，数据无法找回

文件删除的条件：

i_nlink  文件的硬链接数量，磁盘的引用计数器

i_count 内存引用计数(一个文件被几个程序调用，有一个程序使用i_count + 1 )

i_link = 0 && i_count =0

删除一个文件，也是删除上一级目录的block里面的文件名

 

rm相关的问题答疑
问题1：当执行了删除操作后，ls 无法查找到这个文件，但是调用这个删除文件的进程却正常执行，依然能够读取和写入文件内容？

答案： 因为rm只是减少了i_nlink，如果没有其他的链接了[即i_link=0】，但由于文件依然被进程使用，所以即时执行了rm命令，系统并未真正的删除。

只有当i_link和i_count==0时候，系统才会整正删除这个文件，也就是删除文件还需要解除进程对该文件的调用才行。

问题2：当文件没有被调用，但是执行了rm命令，删除后的文件还能找回来么？

答案：rm只是减少了i_link的数量，实际就是将文件的inode的链接删除了，但是并没有删除文件实体(block数据块)，如果停止机器工作，还是可以找回数据的。如果此时继续有数据写入，当新数据就可能会被分配到被删除的数据的block数据块，此时文件就会被真正的回收。

问题3：被进程占用的文件能否被删除？

答案： 能

问题4：如何找回没有链接指向但被进程占用的文件？

答案：lsof -c 'vim'   根据后台占用文件的命令查找

1
2
3
4
5
[root@localhost omc]# touch hhh.txt
[root@localhost omc]# vim hhh.txt &
[root@localhost omc]# rm hhh.txt
[root@localhost omc]# lsof -c 'vim' | grep hhh.txt
vim     3385 root    4u   REG    8,2     4096 271298 /home/omc/.hhh.txt.swp
 

 

常用的命令展示：
删除某个文件夹： -r

1
rm -rf /home/omc/last.txt
自定义回收站功能: 定义一个函数，将文件移动到指定目录；同时别命名rm命令即可

1
2
3
myrm(){ D=/tmp/$(date +%Y%m%d%H%M%S); mkdir -p $D; mv "$@" $D && echo "moved to $D ok"; }
alias rm='myrm'
# $@: 这个程序的所有参数，作为一个i整体传递、

## 自定义`rm`回收站

[GitHub自定义`rm`回收站脚本文件](https://github.com/lagerspetz/linux-stuff)

`linux-stuff/scripts/saferm.sh`适用于服务器和桌面两种环境。 如果脚本检测到 `GNOME` 、`KDE`、`Unity` 或 `LXDE` 桌面环境（`DE`），则它将文件或文件夹安全地移动到默认垃圾箱 `$HOME/.local/share/Trash/files`，否则会在您的主目录中创建垃圾箱文件夹 `$HOME/Trash`。
`.sh`文件查看`mt_saferm.sh`文件
`MacOS`使用处理
修改`.sh`文件
```sh
# trash_desktops="$HOME/.local/share/Trash/files"
trash_desktops="$HOME/.Trash"
# if neither is running:
# trash_fallback="$HOME/Trash"
trash_fallback="$HOME/.Trash"
```
修改删除指令
`MacOS`删除夹的位置在用户目录下：`/Users/matias/.Trash/`即`$HOME/.Trash`。
```sh
# mv -b -- "$1" "${trash}" # moves and backs up old files
# MacOS
# mv: illegal option -- b
# usage: mv [-f | -i | -n] [-v] source target
#        mv [-f | -i | -n] [-v] source ... directory
    mv -i "$1" "${trash}"
```
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
[参考](https://mp.weixin.qq.com/s/2oaX-ZRGkSC_9Cd1IYm1uQ)