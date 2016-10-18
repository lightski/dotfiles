import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmonad $ defaultConfig
	{ terminal		= "urxvt"
	, modMask		= mod4Mask
	, borderWidth	= 3
	, normalBorderColor = "#073642"
	, focusedBorderColor = "#2aa198"
	, handleEventHook = fullscreenEventHook
	, manageHook	= manageDocks <+> manageHook defaultConfig
	, layoutHook	= avoidStruts $ layoutHook defaultConfig
	} `additionalKeys` --discover key numbers: xev
    [--here's meta+i. want shift? use: (mod4mask .|. shiftMask, xK_i)
      ((mod4Mask, xK_i), spawn "~/projects/shell/journal.sh"),
     --next keys: 0 indicates no leader key. These are mostly media keys
      ((0, 0x1008ff11), spawn "amixer set Master 2dB- unmute"),
      ((0, 0x1008ff12), spawn "amixer set Master toggle"),
      ((0, 0x1008ff13), spawn "amixer set Master 2dB+ unmute"),
      ((0, 0x1008ff14), spawn "deadbeef --play-pause"),
      ((0, 0x1008ff15), spawn "deadbeef --stop"),
      ((0, 0x1008ff16), spawn "deadbeef --prev"),
      ((0, 0x1008ff17), spawn "deadbeef --next"),
      ((0, 0x1008ff2d), spawn "xscreensaver-command -lock"),
     --NOTE absolute path in next line. XMonad does not follow symlinks.
      ((0, 0x1008ff59), spawn "~/.dotfiles/bin/toggle-ext-mon.sh"),
      ((0,     0xff61), spawn "maim -s ~/Pictures/$(date +%F_%T).png")
    ]

