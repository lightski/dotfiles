redshift -l 41:-87 &
feh --bg-fill ~/Pictures/Wallpapers/Haywyre/Widescreen-Wallpaper-4K.jpg &
xbindkeys &
xscreensaver &
xmobar &
xcompmgr -c &
~/.dotfiles/start-owncloud.sh &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec xmonad
