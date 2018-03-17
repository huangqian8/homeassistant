#!/bin/bash

sudo su -s /bin/bash homeassistant <<EOF
cd /srv/homeassistant
source bin/activate
pip3 install --upgrade homeassistant
EOF

exit
