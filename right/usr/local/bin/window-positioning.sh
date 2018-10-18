#!/bin/bash

#assumes 2 monitors of the same resolution
XRESOLUTION=`DISPLAY=:0 xdotool getdisplaygeometry | cut -d " " -f 1`

while [ : ]
do
    logger -s -t "$0" "Looking for xpra client window"
    ACTIVEWIN=`DISPLAY=:0 xdotool search --onlyvisible --class xpra`
    if [ -n "$ACTIVEWIN" ]; then
    
         DISPLAY=:0 xdotool windowmove $ACTIVEWIN "-$XRESOLUTION" "0"
         if [ "$?" -eq "0" ]; then
         	logger -s -t "$0" "Positioned desktop to final position"
        	exit;
    	 else
        	logger -s -t "$0" "Looking for active window ($ACTIVEWIN)..."
        	sleep 1;
    	fi
    else
	sleep 1;
    fi
done
