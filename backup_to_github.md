# 备份配置至Github
## 安装git
```
sudo apt-get update
sudo apt-get install git
```
## 创建.gitignore文件
```
cd /home/homeassistant/.homeassistant
sudo .gitignore
```
### .gitignore例子
```
.cloud/
secrets.yaml
known_devices.yaml
entity_registry.yaml
home-assistant.log
home-assistant_v2.db
home-assistant_v2.db-shm
home-assistant_v2.db-wal
.ios.conf
.uuid
.HA_VERSION
*.pyc
```
## 初始化git仓库
```
git init
git config user.email "you@example.com"
git config user.name "Your Name"
git add .
git commit -m "Inital commit"
```
## 在Github上创建repo
* 此步骤不做展开，请自行查找教程
## 初始 Commit
```
git remote add origin https://github.com/username/Home-AssistantConfig
git push -u origin master
```
## Github with ssh
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
