#!/bin/bash

DESKTOPUSER=odroid

logger -s -t "$0" "Starting local X server"

sleep 3
DISPLAY=:0 su -c "synergys -c /home/$DESKTOPUSER/.synergy.conf" $DESKTOPUSER
while :
do
	logger -s -t "$0" "Starting xpra client"
	xpra --sharing=yes --password-file=/home/$DESKTOPUSER/.xpra.pass --desktop-scaling=no attach :100
done
