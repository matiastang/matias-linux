<!--
 * @Author: tangdaoyong
 * @Date: 2021-02-09 17:18:08
 * @LastEditors: tangdaoyong
 * @LastEditTime: 2021-02-09 17:21:10
 * @Description: ifconfig&ip
-->
# ifconfig&ip

[放弃 ifconfig，拥抱 ip 命令 | Linux 中国](https://mp.weixin.qq.com/s?__biz=MjM5NjQ4MjYwMQ==&mid=2664629806&idx=2&sn=ab42e692005ae7be83c196274efe462b&chksm=bdcf3d688ab8b47e919fcdf38c80c87fc9664ed070c71ea2eeb3f26f761f4a1c9adff7d09ea9&scene=132#wechat_redirect)

## ip 和 ipconfig 的优缺点

ip 命令比 ifconfig 更通用，技术上也更有效，因为它使用的是 Netlink 套接字，而不是 ioctl 系统调用。

ip 命令可能看起来比 ifconfig 更详细、更复杂，但这是它拥有更多功能的一个原因。一旦你开始使用它，你会了解它的内部逻辑（例如，使用 set 而不是看起来随意混合的声明或设置）。

最后，ifconfig 已经过时了（例如，它缺乏对网络命名空间的支持），而 ip 是为现代网络而生的。尝试并学习它，使用它，你会由衷高兴的！