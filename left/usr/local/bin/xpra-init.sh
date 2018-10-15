#!/bin/bash
DESKTOPUSER=odroid
#accept X11 connections from any system
/usr/bin/xhost +
#start the desktop session
/bin/su -c /usr/bin/mate-session - $DESKTOPUSER
