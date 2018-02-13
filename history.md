# history 转圈问题解决（电脑端解决，手机端未解决）
### 查找fronted.html路径
``` bash
find / -name frontend.html

/srv/homeassistant/lib/python3.5/site-packages/hass_frontend/frontend.html
/srv/homeassistant/lib/python3.5/site-packages/hass_frontend_es5/frontend.html
```
### 开始
``` bash
# 切换至homeassistant，如果是根据网上教程安装的，基本都是这个用户名
sudo su -s /bin/bash homeassistant

cd /srv/homeassistant/lib/python3.5/site-packages/hass_frontend/
cp frontend.html frontend.html.bak        #养成备份的好习惯
cp frontend.html.gz frontend.html.gz.bak        #养成备份的好习惯
sed -i 's#https://www.google.com/jsapi#../../frontend_latest/js/jsapi.js#g' frontend.html
sed -i 's#https://ajax.googleapis.com/ajax/static/modules/gviz/1.0/core#../../frontend_latest/js#g' frontend.html
gzip -c frontend.html > frontend.html.gz
chown homeassistant:homeassistant frontend.html.gz
mkdir js
cd js
curl -O https://raw.githubusercontent.com/huangqian8/homeassistant/dev/js/jsapi.js
echo "______frontend_latest_js_jsapi_js_callback___callback___api_loaded();" >> jsapi.js
curl -O https://raw.githubusercontent.com/huangqian8/homeassistant/dev/js/tooltip.css

cd /srv/homeassistant/lib/python3.5/site-packages/hass_frontend_es5/
cp frontend.html frontend.html.bak        #养成备份的好习惯
cp frontend.html.gz frontend.html.gz.bak        #养成备份的好习惯
sed -i 's#https://www.google.com/jsapi#../../frontend_es5/js/jsapi.js#g' frontend.html
sed -i 's#https://ajax.googleapis.com/ajax/static/modules/gviz/1.0/core#../../frontend_es5/js#g' frontend.html
gzip -c frontend.html > frontend.html.gz
chown homeassistant:homeassistant frontend.html.gz
mkdir js
cd js
curl -O https://raw.githubusercontent.com/huangqian8/homeassistant/dev/js/jsapi.js
echo "______frontend_es5_js_jsapi_js_callback___callback___api_loaded();" >> jsapi.js
curl -O https://raw.githubusercontent.com/huangqian8/homeassistant/dev/js/tooltip.css
```

### 重启，浏览器清缓存
```
sudo reboot
```
