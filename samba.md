# Samba
> 维基百科：Samba，是种用来让UNIX系列的操作系统与微软Windows操作系统的SMB/CIFS（Server Message Block/Common Internet File System）网络协议做链接的自由软件。第三版不仅可访问及分享SMB的文件夹及打印机，本身还可以集成入Windows Server的网域，扮演为网域控制站（Domain Controller）以及加入Active Directory成员。简而言之，此软件在Windows与UNIX系列OS之间搭起一座桥梁，让两者的资源可互通有无。
### 1、命令行
``` bash
sudo apt-get install -y samba samba-common-bin
```
### 2、修改Samba配置
``` bash
sudo nano /etc/samba/smb.conf
```
#### 2.1 复制粘贴以下内容至文件末尾
```
[HOME ASSISTANT]
path = /home/homeassistant/.homeassistant
comment = No comment
browsable = yes
read only = no
valid users =
writable = yes
guest ok = yes
public = yes
create mask = 0777
directory mask = 0777
force user = root
force create mode = 0777
force directory mode = 0777
hosts allow =
```
#### 2.2 重启Samba服务，使配置文件修改生效
``` bash
sudo service smbd restart
```
