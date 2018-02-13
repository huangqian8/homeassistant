# 数据库
## MariaDB
### 1、安装数据库服务端
``` bash
sudo apt-get install mariadb-server
```
### 2、虚拟环境安装客户端
``` bash
pip3 install mysqlclient
exit
```
### 3、创建数据库及用户
``` bash
sudo mysql -u root -p
CREATE DATABASE homeassistant;
CREATE USER 'homeassistantuser' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON homeassistant.* TO 'homeassistantuser';
FLUSH PRIVILEGES;
exit
```
### 4、configuration.yaml配置
```
recorder:
  purge_interval: 2
  purge_keep_days: 30
  db_url: !secret mariadb_connection_url
```
### 5、secrets.yaml配置
```
mariadb_connection_url: mysql://homeassistantuser:password@localhost/homeassistant
```
## PostgreSQL（原创：墨澜技术站）
> 测试有坑！
### 1、安装数据库服务器端
```
sudo apt-get install postgresql-10.1 postgresql-server-dev-10.1
```
### 2、创建数据库用户
```
sudo -u postgres createuser homeassistant
```
### 3、创建数据库
```
sudo -u postgres createdb -O homeassistant homeassistant
```
### 4、虚拟环境安装
```
sudo su -s /bin/bash homeassistant
source /srv/homeassistant/bin/activate
pip3 install psycopg2
```
### 5、配置
```
recorder:
  db_url: postgres://@/homeassistant
```
