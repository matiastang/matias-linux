<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-21 09:39:53
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-21 09:39:53
 * @Description: rm命令
-->
# rm命令

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
