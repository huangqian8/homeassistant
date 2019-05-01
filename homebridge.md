# HomeAssistant 已内置 HomeKit ，此篇可略过！
# Homebridge
> Homebridge is a lightweight NodeJS server you can run on your home network that emulates the iOS HomeKit API. It supports Plugins, which are community-contributed modules that provide a basic bridge from HomeKit to various 3rd-party APIs provided by manufacturers of "smart home" devices.
### 1、安装HB
``` bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs git libavahi-compat-libdnssd-dev
sudo npm install -g --unsafe-perm hap-nodejs node-gyp homebridge homebridge-homeassistant
cd /usr/lib/node_modules/homebridge/
sudo npm install --unsafe-perm bignum
cd /usr/lib/node_modules/hap-nodejs/node_modules/mdns
sudo node-gyp BUILDTYPE=Release rebuild
```
### 2、启动HB
``` bash
homebridge
```
### 4、待正常启动后停止HB
``` bash
键盘操作 CTRL+C
```
### 4、配置HB
``` bash
sudo nano /home/pi/.homebridge/config.json
```
#### 4.1 复制以下内容：（注意配置文件中注释部分，需自行修改）
```
{
  "bridge": {
    "name": "Home Assistant",
    "username": "B8:27:EB:8F:FE:45",  # 树莓派MAC地址，其实无所谓正确与否
    "port": 51826,
    "pin": "000-00-000"  # 可按格式自行修改
  },
  "description": "Homebridge for Home Assistant",
  "accessories": [],
  "platforms": [
    {
      "platform": "HomeAssistant",
      "name": "HomeAssistant",
      "host": "http://192.168.8.28:8123",  # Home Assistant 访问地址
      "password": "password",  # Home Assistant 密码，未设置可留空
      "default_visibility": "hidden", # 默认隐藏，可自行修改为visible
      "supported_types": [
        "automation",
        "binary_sensor",
        "climate",
        "cover",
        "device_tracker",
        "fan",
        "group",
        "input_boolean",
        "light",
        "lock",
        "media_player",
        "remote",
        "scene",
        "script",
        "sensor",
        "switch",
        "vacuum"
      ],
      "logging": true,
      "verify_ssl": true
    }
  ]
}
```
### 5、设置HB自启动
``` bash
sudo useradd --system homebridge
sudo mkdir /var/homebridge
sudo cp ~/.homebridge/config.json /var/homebridge/
sudo cp -r ~/.homebridge/persist /var/homebridge
sudo chmod -R 0777 /var/homebridge
cd /etc/default
sudo nano homebridge
```
#### 5.1 复制以下内容：
```
# Defaults / Configuration options for homebridge
# The following settings tells homebridge where to find the config.json file and where to persist the data (i.e. pairing and others)
HOMEBRIDGE_OPTS=-U /var/homebridge
# If you uncomment the following line, homebridge will log more
# You can display this via systemd's journalctl: journalctl -f -u homebridge
# DEBUG=*
```
#### 5.2 设置自启动服务
``` bash
sudo nano /etc/systemd/system/homebridge.service
```
##### 5.2.1 复制以下内容：
```
[Unit]
Description=Node.js HomeKit Server
After=syslog.target network-online.target
[Service]
Type=simple
User=homebridge
EnvironmentFile=/etc/default/homebridge
ExecStart=/usr/lib/node_modules/homebridge/bin/homebridge $HOMEBRIDGE_OPTS
Restart=on-failure
RestartSec=10
KillMode=process
[Install]
WantedBy=multi-user.target
```
#### 5.2.2 重启服务使配置生效
``` bash
sudo systemctl --system daemon-reload
sudo systemctl enable homebridge
sudo systemctl start homebridge
```
