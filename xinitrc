redshift -l 41:-87 &
feh --bg-fill ~/Pictures/Wallpapers/Haywyre/Widescreen-Wallpaper-4K.jpg &
xbindkeys &
xscreensaver &
xmobar &
xcompmgr -c &
~/.dotfiles/start-owncloud.sh &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec xmonad
