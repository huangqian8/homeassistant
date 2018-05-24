# Home Assistant
![](https://github.com/huangqian8/homeassistant/blob/0.1/screenshots/homeassistant.png)
> Home Assistant is an open-source home automation platform running on Python 3. Track and control all devices at home and automate control. Perfect to run on a Raspberry Pi.
### 1、添加用户homeassistant
``` bash
sudo useradd -rm homeassistant -G dialout
```
### 2、创建HomeAssistant安装路径
``` bash
cd /srv
sudo mkdir homeassistant
sudo chown homeassistant:homeassistant homeassistant
```
### 3、切换至虚拟环境
``` bash
sudo su -s /bin/bash homeassistant
cd /srv/homeassistant
python3 -m venv .
source bin/activate
```
### 4、(虚拟环境)安装HA
``` bash
python3 -m pip install wheel
pip3 install homeassistant
```
### 5、(虚拟环境)启动HA
``` bash
hass
```
> 注意: Home Assistant 启动时会安装一些组件，请耐心等待。安装完成后可打开网页 http://树莓派IP地址:8123
### 6、等待安装完后停止HA
``` bash
键盘操作 Ctrl+C
```
### 7、回到普通环境
``` bash
exit
```
### 8、设置HA自启动
``` bash
sudo nano /etc/systemd/system/home-assistant.service
```
#### 8.1 复制以下内容：
```
[Unit]
Description=Home Assistant
After=network-online.target
[Service]
Type=simple
User=%i
ExecStart=/srv/homeassistant/bin/hass -c "/home/homeassistant/.homeassistant"
[Install]
WantedBy=multi-user.target
```
#### 8.2 重启服务使配置生效
``` bash
sudo systemctl --system daemon-reload
sudo systemctl enable home-assistant
sudo systemctl start home-assistant
```
### 9、常用命令
* 启动HA：`sudo systemctl start home-assistant`
* 停止HA：`sudo systemctl stop home-assistant`
* 重启HA：`sudo systemctl restart home-assistant`
* 查看HA运行状态：`sudo systemctl status home-assistant`
* 更新HA：(虚拟环境)：`pip3 install --upgrade homeassistant`
* 设置homeassistant文件夹权限：`sudo chown -R homeassistant:homeassistant /srv/homeassistant`
