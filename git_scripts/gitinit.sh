#!/bin/bash

sudo su -s /bin/bash homeassistant <<EOF
cd /home/homeassistant/.homeassistant
git init
git config user.email "bluefire1982@gmail.com"
git config user.name "huangqian8"
git add .
git commit -m "Inital commit"
git remote add origin git@github.com:huangqian8/Home-AssistantConfig.git
git push -u origin master
EOF

exit
