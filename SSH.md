cat# port

:3390 A4000 rdp
:6000 A4000 ssh
:6002 Lab ssh

# local proxy
```shell
ssh -o "ProxyCommand=nc -X 5 -x 127.0.0.1:7890 %h %p" aliecs
```
# frp
```shell
# remote ssh
# a4000
# ssh a4000@193.32.150.105 -p 6000 
ssh a4000@47.116.189.84 -p 6000 
# ecs.aifu.tech
# tunnel
# dn207
ssh -o ProxyCommand="ssh -W %h:%p a4000@47.116.189.84 -p 6000"  root@10.10.8.207
ssh -J lab-410 hpc-login
# ssh -o ProxyCommand="ssh -W localhost:2222 a4000@47.116.189.84 -p 6000" root@10.10.8.207
```
## frpc.toml
```toml
serverAddr = "47.116.189.84"
serverPort = 7000

auth.method = "token"
auth.token = "Qwer1234"

[[proxies]]
name = "ssh"
type = "tcp"
localIP = "127.0.0.1"
localPort = 22
remotePort = 6000
use_encryption = true  
use_compression = true

```

```cardlink
url: https://blog.csdn.net/qq_33090897/article/details/135840760
title: "LINUX:设置FRP开机自启_frpc开机自启动-CSDN博客"
description: "文章浏览阅读1.6k次，点赞12次，收藏11次。1）本教程是以frpc（客户端）为例，frps（服务端）只需要将frpc改为frps即可。2）本教程默认你已经安装并熟悉frp相关配置，如果你还没有使用过frp请先查看相关资料。1)  使用vim创建文件，此处的文件名称决定了服务的名称。3）我的frp安装目录为：/usr/local/frp/2) 写入frpc.service内容。三、使用systemctl命令管理frpc。二、创建与编辑frpc.service。4）设置开机自动启动。_frpc开机自启动"
host: blog.csdn.net
```

```cardlink
url: https://blog.csdn.net/qq233325332/article/details/136065890
title: "frp新版toml配置_frps.toml-CSDN博客"
description: "文章浏览阅读3.9k次，点赞8次，收藏17次。从frpv0.52.0版本开始，frp 将TOML作为配置文件格式。INI 格式已被弃用，并将在未来的发布中移除。因此，frp v0.52.0 及更高版本的配置文件默认为TOML格式。_frps.toml"
host: blog.csdn.net
```

# ssh key

```shell
# generate ssh keys
ssh-keygen

# powershell
Get-Content $env:USERPROFILE\.ssh\id_rsa.pub | ssh <user>@<hostname> "cat >> .ssh/authorized_keys"

# linux 
ssh-copy-id -i ~/.ssh/id_rsa.pub <user>@<hostname>
```
