import XMonad
import XMonad.Hooks.EwmhDesktops

main = xmonad defaultConfig
	{ terminal		= "urxvt"
	, modMask		= mod4Mask
	, borderWidth	= 3
	, normalBorderColor = "#073642"
	, focusedBorderColor = "#2aa198"
	, handleEventHook = fullscreenEventHook
	}
