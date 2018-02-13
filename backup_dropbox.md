# 备份配置文件至Dropbox
## 下载脚本文件并执行
```
cd
curl -O https://raw.githubusercontent.com/huangqian8/homeassistant/dev/dropbox_uploader/dropbox.py
curl -O https://raw.githubusercontent.com/huangqian8/homeassistant/dev/dropbox_uploader/dropbox_uploader.sh
chmod +x dropbox_uploader.sh
./dropbox_uploader.sh
```
## 加入Cron定时任务
```
crontab -e

# 添加如下命令行（路径以实际为准）
# 每2个小时执行一次备份
0 */2 * * * /usr/bin/python3 /home/pi/dropbox.py -f /home/pi/.dropbox_uploader
```
## 重启Cron服务和树莓派
```
sudo /etc/init.d/cron restart
sudo reboot
```
