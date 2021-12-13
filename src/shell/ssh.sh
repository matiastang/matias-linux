#!/bin/zsh
###
 # @Author: matiastang
 # @Date: 2021-12-13 16:17:45
 # @LastEditors: matiastang
 # @LastEditTime: 2021-12-13 16:19:09
 # @FilePath: /matias-linux/src/shell/ssh.sh
 # @Description: 远程链接
### 
set timeout 30
#连接远程服务器，[lindex $argv 0/1/2/3]是外部输入的参数，当然也可以写里面，第一个参数是端口。第二个参数是登录的账号，点个参数是服务器地址，第四个参数是密码
spawn ssh -p [lindex $argv 0] [lindex $argv 1]@[lindex $argv 2]
#自动输入
expect {
        "(yes/no)?"
        {send "yes\n";exp_continue}
        "password:"
        {send "[lindex $argv 3]\n"}
}
#终端清屏
expect "~"
send "clear\n"
#cd到服务器想要的目录
send "cd /home/byxf-acc-front/jetty/logs/acc-front/\n"
#打开实时日志文件
send "tail -f acc-front.log\n"