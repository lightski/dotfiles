redshift -l 41:-87 &
feh --bg-scale ~/Pictures/Wallpapers/axiom-verge-2.png &
xscreensaver -no-splash &
xcompmgr -c &
eval $(keychain --eval --quiet --noask --confhost)
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec xmonad
