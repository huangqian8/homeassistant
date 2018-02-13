# 依赖包

## 通过SSH方式连接树莓派，用户名pi，密码raspberry
![](https://github.com/huangqian8/homeassistant/blob/dev/screenshots/ssh.png)

### 以下均为命令行指令
1、设置时区
```
sudo dpkg-reconfigure tzdata
```
2、更新源
``` bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
cd /etc/apt/
sudo sed -i 's#mirrordirector.raspbian.org#mirrors.ustc.edu.cn/raspbian#g' sources.list

sudo cp /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list.bak
cd /etc/apt/sources.list.d/
sudo sed -i 's#archive.raspberrypi.org/debian#mirrors.ustc.edu.cn/archive.raspberrypi.org#g' raspi.list
```
3、 更新系统组件
``` bash
sudo apt-get -y update
sudo apt-get -y upgrade
```
4、 安装依赖包
``` bash
sudo apt-get -y install python3 python3-venv python3-pip python-pip
sudo apt-get -y install build-essential python quilt devscripts python-setuptools
sudo apt-get -y install libwrap0-dev libssl-dev libc-ares-dev uuid-dev xsltproc
```
