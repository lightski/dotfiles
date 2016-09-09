#!/bin/bash
# called by xinitrc to start owncloud after delay if 
#  laptop has net connection
sleep 300
ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null
if [ $? -eq 0 ]; then # $? is last shell result
	/usr/bin/owncloud &
fi

