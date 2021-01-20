# hello

* 查看环境(查看默认的环境，可以切换)
```
$ echo $SHELL           
/bin/zsh
```
* 创建文件`helloShell.sh`
```
#!/bin/zsh -v
# helloShell.sh
echo "hello, world"
```
* 查看权限(helloShell.sh目录下)
```
ls -l helloShell.sh
-rwxr-xr-x  1 yunxi  staff  49  8 20 17:16 helloShell.sh
```
如果没有运行权限(`x`)使用命令`chmod +x helloShell.sh`开启。

* 运行
```
$ ./helloShell.sh     

#!/bin/zsh -v
# helloShell.sh
echo "hello, world"hello, world

zsh helloShell.sh
hello, world

source helloShell.sh
hello, world
```
已`./helloShell.sh`运行时，打印了源码，原因在该文件的第一行，当我们直接运行该脚本文件时，该行告诉操作系统使用用#! 符号之后面的解释器以及相应的参数来解释该脚本文件，通过分析第一行，我们发现对应的解释器以及参数是 `/bin/bash -v`，而 `-v` 刚好就是要打印程序的源代码；但是我们在用后面二种方法时没有给 zsh 传递任何额外的参数，因此，它仅仅解释了脚本文件本身。