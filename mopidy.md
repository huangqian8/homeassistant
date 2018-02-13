# Mopidy
### 1、安装
``` bash
sudo apt-get -y install mopidy
```
### 2、安装Mopidy网页端Mopde
``` bash
sudo apt-get install python-pip
sudo pip install Mopidy-Moped
```
### 3、启动Mopidy
``` bash
mopidy
```
### 4、停止Mopidy
``` bash
键盘操作 CTRL+C
```
### 5、修改配置
``` bash
sudo nano /home/pi/.config/mopidy/mopidy.conf
```
### 6、设置自启动
```
sudo nano /etc/systemd/system/mopidy-mpd.service
```
#### 6.1 复制如下内容：
```
[Unit]
Description=Mopidy music server
After=avahi-daemon.service
After=dbus.service
After=network.target
After=nss-lookup.target
After=pulseaudio.service
After=remote-fs.target
After=sound.target 
[Service]
Type=simple
ExecStart=/usr/bin/mopidy --config /home/pi/.config/mopidy/mopidy.conf 
[Install]
WantedBy=multi-user.target
```
#### 6.2 重启服务使配置生效
``` bash
sudo systemctl --system daemon-reload
sudo systemctl enable mopidy-mpd
sudo systemctl start mopidy-mpd
```
