#!/bin/bash

# do not forget to add this line to /ets/sudoers
# alwx ALL=(ALL) NOPASSWD: /usr/bin/systemctl start ocvpn.service
# alwx ALL=(ALL) NOPASSWD: /usr/bin/systemctl stop ocvpn.service

SERVICE="ocvpn.service"

if systemctl --quiet is-active "$SERVICE"; then
    sudo /usr/bin/systemctl stop "$SERVICE"
else
    sudo /usr/bin/systemctl start "$SERVICE"
fi
