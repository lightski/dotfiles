redshift -l 41:-87 &
feh --bg-scale ~/Pictures/Wallpapers/anton-fadeev-image.jpg &
xscreensaver &
xmobar &
xcompmgr -c &
~/.dotfiles/bin/start-owncloud.sh &
eval $(keychain --eval --quiet --noask --confhost)
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec xmonad
