<!--
 * @Author: tangdaoyong
 * @Date: 2021-01-21 16:40:15
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-01-21 16:45:26
 * @Description: cd命令
-->
# cd命令

* cd        进入用户主目录 
* cd ~     进入用户主目录 
* cd -      返回进入此目录之前所在目录 
* cd ..     返回上一级目录 
* cd ../..  返回上两级目录 
* cd !$    把上个命令的参数作为 cd 参数使用 
* cd /      进入根目录
* cd .      当前目录

使用`cd ..`返回多级不是很方便，可以自定义别名
```
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
```


## zsh

`zsh`实现了`cd ...`及`...`功能，不过最多`......`返回三级。


```sh
if is-at-least 5.0.0 && [[ ! $UID -eq 0 ]]; then                                                                                                                             
  ## http://www.zsh.org/mla/users/2010/msg00769.html                                                                                                                       
  function rationalise-dot() {                                                                                                                                             
    local MATCH # keep the regex match from leaking to the environment                                                                                                   
    if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' && ! $LBUFFER = p4* ]]; then                                                                                  
        #if [[ ! $LBUFFER = p4* && $LBUFFER = *.. ]]; then                                                                                                               
        LBUFFER+=/..                                                           
    else                                                                                                                                                                 
        zle self-insert                                                                                                                                                  
    fi                                                                                                                                                                   
}                                                                                                                                                                        
zle -N rationalise-dot                                                                                                                                                   
bindkey . rationalise-dot                                                                                                                                                
bindkey -M isearch . self-insert                                                                                                                                         
fi
```