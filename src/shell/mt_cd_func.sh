#!/bin/zsh
###
 # @Author: tangdaoyong
 # @Date: 2021-01-21 09:48:53
 # @LastEditors: tangdaoyong
 # @LastEditTime: 2021-01-21 13:54:28
 # @Description: mt_cd_func.sh
###
###
 # @description: cd 扩展多级返回
 # @param {*} 在cd ../的基础上添加../
 # @return {*}
###
mt_cd() {
    # ls -a

    # local a="l"
    # local b="s"
    # eval ${a}${b}
    # eval l${b}
    # l${b} -a
    # eval l${b} -a

    # local b="../"
    # echo "cd ${b}"
    # cd ${b}

    # local shell=cd
    # local b="s"../
    # eval `${shell} ${b}`

    # local dirPath=`pwd`
    # echo "bin目录：$path"
    # echo "当前工作目录：$dirPath"
    local max=`pwd | grep -o "\/" | grep -c "\/"`
    # echo "最多返回级数$max"
    # echo "当前参数：$*"
    # echo "当前参数：$1"
    local parameters=$1
    # 获取第一个参数的长度
    # local number=${#parameters}
    echo "parameters：$parameters"
    # local parameters1=${$parameters//^./}
    # echo "parameters1：$parameters1"
    # local number=expr match $1 "."
    local number=`echo $parameters | grep -o "\." | grep -c "\."`
    echo "parameters2：$number"
    echo "参数*个数：$number"
    if (($max <= $number))
    then
        echo "返回级数过多"
        cd ~
    else
        # echo "返回级数过多$max$number"
        local shell="../"
        for ((i=1; i<=$number; i++))
        do
            shell+="../"
        done
        echo "执行命令：cd $shell"
        cd ${shell}
    fi
}
# mt_cd .a.
# echo "mt_cd exit status is: $?";