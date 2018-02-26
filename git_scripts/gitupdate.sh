#!/bin/bash

sudo su -s /bin/bash homeassistant <<EOF
cd /home/homeassistant/.homeassistant
git add .
git status
git commit -m "Update"
git push origin master
EOF

exit
