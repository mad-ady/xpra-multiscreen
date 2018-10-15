#!/bin/bash
DESKTOPUSER=odroid
SCREENNAME="c1-right"
SYNERGYSERVER="xu4-left"

logger -s -t "$0" "Starting local X server"

sleep 3
DISPLAY=:0 su -c "synergyc --name '$SCREENNAME' '$SYNERGYSERVER'" $DESKTOPUSER

#start the window positioning script
/usr/local/bin/window-positioning.sh &

#do this forever so that if the network disconnects, the session is rejoined.
while :
do
        logger -s -t "$0" "Starting xpra client"
        xpra attach --sharing=yes --password-file=/root/.xpra.pass tcp://$DESKTOPUSER@$SYNERGYSERVER:14500
done

