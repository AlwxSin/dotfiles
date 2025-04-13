#!/bin/bash

SERVICE="ocvpn.service"

if systemctl --quiet is-active "$SERVICE"; then
    sudo /bin/systemctl stop "$SERVICE"
else
    sudo /bin/systemctl start "$SERVICE"
fi
