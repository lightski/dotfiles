redshift -l 41:-87 &
feh --bg-fill ~/Pictures/Wallpapers/Haywyre/Widescreen-Wallpaper-4K.jpg &
xbindkeys &
xscreensaver &
xmobar &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xcompmgr -c &
sleep 60 && owncloud &
sleep 70 && dropbox-cli &
exec xmonad
