<!--
 * @Author: matiastang
 * @Date: 2021-12-14 15:23:40
 * @LastEditors: matiastang
 * @LastEditTime: 2021-12-14 15:23:40
 * @FilePath: /matias-linux/md/scp.md
 * @Description: scp
-->
scp即secure copy，主要用于远程文件拷贝。用法如下：

scp [-option] [[user@]host1:]file1 ... [[user@]host2:]file2
参数如下：
-1  强制scp命令使用协议ssh1  
-2  强制scp命令使用协议ssh2  
-4  强制scp命令只使用IPv4寻址  
-6  强制scp命令只使用IPv6寻址  
-B  使用批处理模式（传输过程中不询问传输口令或短语）  
-C  允许压缩。（将-C标志传递给ssh，从而打开压缩功能）  
-p  保留原文件的修改时间，访问时间和访问权限。  
-q  不显示传输进度条。  
-r  递归复制整个目录。  
-v  详细方式显示输出。   
-c cipher  以cipher将数据传输进行加密，这个选项将直接传递给ssh。   
-F ssh_config  指定一个替代的ssh配置文件，此参数直接传递给ssh。  
-i identity_file  从指定文件中读取传输时使用的密钥文件，此参数直接传递给ssh。    
-l limit  限定用户所能使用的带宽，以Kbit/s为单位。     
-o ssh_option  如果习惯于使用ssh_config(5)中的参数传递方式，   
-P port  注意是大写的P, port是指定数据传输用到的端口号   
-S program  指定加密传输时所使用的程序。此程序必须能够理解ssh(1)的选项。
现在假设服务器的ip为：10.12.13.14，域名是www.abc.com。
1、从服务器分别复制文件和文件夹到本地：

scp root@10.12.13.14:/home/file /myMachine/x (可以将ip换成域名，也可以去掉root@)

scp -r www.abc.com:/home/file/ /myMachine/myFile/
1
2
3
2、本地复制到服务器

复制文件
scp /myMachine/x root@10.12.13.14:/home/file
复制文件夹
scp -r /myMachine/myFile/ www.abc.com:/home/file/ 