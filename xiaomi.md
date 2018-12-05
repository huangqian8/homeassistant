# 小米智能家居设备
### 小米多功能网关 v2
> 成功添加网关后，门窗传感器、人体传感器、温湿度传感器、亮度传感器（网关内置）自动添加。
```
# 单个网关，可不填 mac
xiaomi_aqara:
  discovery_retry: 5
  gateways:
    - key: xxxxxxxxxxxxxxxx
```
```
# 多个网关
xiaomi_aqara:
  gateways:
    - mac: xxxxxxxxxxxx
      key: xxxxxxxxxxxxxxxx
    - mac: xxxxxxxxxxxx
      key: xxxxxxxxxxxxxxxx
```
配置变量说明：
- mac (可选): 网关 mac 地址，使用多个网关则必须填写
- key (可选): 网关通信协议密码。如果想要控制网关灯和开关，则必须填写；传感器在无密码情况下仍可正常运作。
- discovery_retry (可选): 连接失败重试次数，默认为 3。
- interface (可选): 所使用的接口，默认为全部(all)。
- host (可选): 网关 IP 地址。如使用此参数，discovery_retry将失效。
### 智能插座
> 可通过在电脑上安装安卓模拟器获取TOKEN码
```
switch:
  - platform: xiaomi_miio
    name: Xiaomi Smart WiFi Plug
    host: ip address
    token: YOUR_TOKEN
```
配置变量说明：
- name (可选): 插座自定义名称
- host (必须): 插座的 IP 地址
- token (必须): 插座 TOKEN码
### Yeelight
> Home Assistant 支持自动发现Yeelight灯，设置IP会更稳定些。
> 需要在Yeelight APP中打开“局域网控制“选项。
```
light:
  - platform: yeelight
    devices:
      192.168.1.24:  #yeelight在内网的IP地址
        name: yeelight
        transition: 1000
        save_on_change: True
```
