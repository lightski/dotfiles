redshift -l 41:-87 &
feh --bg-fill ~/Pictures/Wallpapers/hyper-light-drifter.png &
xscreensaver &
xmobar &
xcompmgr -c &
~/.dotfiles/bin/start-owncloud.sh &
eval $(keychain --eval --quiet --noask --confhost)
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec xmonad
