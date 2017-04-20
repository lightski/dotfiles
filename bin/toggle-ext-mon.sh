#!/bin/bash
# toggle_ext_mon.sh 
# toggles on/off external monitors

IN="LVDS1"
EXT1="VGA2"
EXT2="HDMI1"

if (xrandr | grep "$EXT1 disconnected"); then
	if (xrandr | grep "$EXT2 disconnected"); then
		xrandr --output $IN --auto --output $EXT1 --off --output $EXT2 --off
	else 
		xrandr --output $IN --auto --primary --output $EXT1 --off --output $EXT2 --auto --right-of $IN
	fi
else
	if (xrandr | grep "$EXT2 disconnected"); then
		xrandr --output $IN --auto --primary --output $EXT1 --auto --right-of $IN --output $EXT2 --off
	else 
		xrandr --output $IN --auto --output $EXT1 --auto --right-of $IN --output $EXT2 --auto --left-of $IN
	fi
fi

