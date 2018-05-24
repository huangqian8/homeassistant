# Mosquitto
> Mosquitto™ is an open source (EPL/EDL licensed) message broker that implements the MQTT protocol versions 3.1 and 3.1.1. MQTT provides a lightweight method of carrying out messaging using a publish/subscribe model. This makes it suitable for "Internet of Things" messaging such as with low power sensors or mobile devices such as phones, embedded computers or microcontrollers like the Arduino.
### 1、添加用户mosquitto
``` bash
sudo adduser mosquitto
sudo usermod -aG sudo mosquitto
su mosquitto
cd
```
### 2、下载Mosquitto，编译安装
``` bash
wget http://mosquitto.org/files/source/mosquitto-1.5.tar.gz
tar zxvf mosquitto-1.5.tar.gz
cd mosquitto-1.5
make && sudo make install
```
### 3、添加Mosquitto服务用户（homeassistant 可自行修改）并设置密码
``` bash
sudo mosquitto_passwd -c /etc/mosquitto/pwfile homeassistant
```
### 4、修改Mosquitto配置
``` bash
sudo mkdir /var/lib/mosquitto/
sudo chown -R mosquitto:mosquitto /var/lib/mosquitto/
sudo nano /etc/mosquitto/mosquitto.conf
```
#### 4.1 复制以下内容：
```
persistence true
persistence_location /var/lib/mosquitto/
persistence_file mosquitto.db
log_dest syslog
log_dest stdout
log_dest topic
log_type error
log_type warning
log_type notice
log_type information
connection_messages true
log_timestamp true
allow_anonymous false
password_file /etc/mosquitto/pwfile
```
#### 4.2 使配置生效
``` bash
sudo ldconfig
```
### 5、设置Mosquitto自启动
``` bash
sudo nano /etc/systemd/system/mosquitto.service
```
#### 5.1 复制以下内容：
```
[Unit]
Description=Insite MQTT Broker
[Service]
ExecStart=/usr/local/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
Restart=always
[Install]
WantedBy=multi-user.target
```
#### 5.2 重启服务使配置生效
``` bash
sudo systemctl --system daemon-reload
sudo systemctl enable mosquitto
sudo systemctl start mosquitto
```
