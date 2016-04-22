redshift -l 41:-87 &
feh --bg-fill ~/Pictures/Wallpapers/Haywyre/Widescreen-Wallpaper-4K.jpg &
xbindkeys &
xscreensaver &
xmobar &
sleep 60 && owncloud &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec xmonad
