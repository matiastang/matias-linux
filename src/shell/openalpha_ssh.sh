#!/bin/zsh
###
 # @Author: matiastang
 # @Date: 2021-12-13 16:20:52
 # @LastEditors: matiastang
 # @LastEditTime: 2021-12-13 16:20:52
 # @FilePath: /matias-linux/src/shell/openalpha_ssh.sh
 # @Description: 
### 
set PORT 22
set HOST ***.**.12.20
set USER root
set PASSWORD ************

spawn ssh -p $PORT $USER@$HOST
expect {
        "yes/no" {send "yes\r";exp_continue;}
         "*password:*" { send "$PASSWORD\r" }
        }
interact