# Linux静态IP配置（CentOS-7-x86_64）

## 1. 更改默认网卡信息

> 网卡位置：/etc/sysconfig/network-scripts/网卡名

```sh
# 网卡名称
DEVICE=ens33
# MAC 地址
HWADDR=
# 激活此设备时所使用的地址配置协议，常用的dhcp,static,none,bootp
BOOTPROTO=
# NM是NetworkManager的简写，此网卡是否接受NM控制，建议CentOS6及以下该为"no"
NM_CONTROLLED=
# 在系统引导时是否激活此设备
ONBOOT=
# 接口类型；常见的有Ethernet,Bridge

```

```sh
HWADDR=00:0C:29:7B:42:A2
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLED=yes
BOOTPROTO=static
BROADCAST=192.168.1.255
DNS1=114.114.114.114
IPADDR=192.168.1.254
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DEFROUTE=yes
PEERDNS=yes
PEERROUTES=yes
IPV4_FAILURE_FATAL=yes
IPV6INIT=yes
```

