-- import section
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

-- main function launches xmobar then reads config
main = xmonad =<< xmobar myConfig

-- setup custom window layouts
myManageHook = composeAll
    [className =? "deadbeef" --> doShift "1"
    , manageDocks]

-- settings for everything
myConfig = def
        { workspaces = ["1", "2:web", "3", "4", "5", "6", "7", "8", "9"]
        , manageHook = myManageHook <+> manageHook def
        , layoutHook = avoidStruts $ layoutHook def
        , handleEventHook = fullscreenEventHook
        , terminal = "urxvt"
        , modMask = mod4Mask
        , borderWidth = 2
        , normalBorderColor = "#073642"
        , focusedBorderColor = "#2aa198"
        } `additionalKeys` --discover key numbers: xev
        [--here's meta+i. want shift? use: (mod4mask .|. shiftMask, xK_i)
            ((mod4Mask, xK_i), spawn "~/.dotfiles/bin/wiki-index.sh"),
            --next keys: 0 indicates no leader key. These are mostly media keys
            ((0, 0x1008ff11), spawn "amixer set Master 2dB- unmute"),
            ((0, 0x1008ff12), spawn "amixer set Master toggle"),
            ((0, 0x1008ff13), spawn "amixer set Master 2dB+ unmute"),
            ((0, 0x1008ff14), spawn "deadbeef --play-pause"),
            ((0, 0x1008ff15), spawn "deadbeef --stop"),
            ((0, 0x1008ff16), spawn "deadbeef --prev"),
            ((0, 0x1008ff17), spawn "deadbeef --next"),
            ((0, 0x1008ff2d), spawn "xscreensaver-command -lock"),
            ((0, 0x1008ff59), spawn "~/.dotfiles/bin/toggle-ext-mon.sh"),
            ((0,     0xff61), spawn "maim -s ~/Pictures/$(date +%F_%T).png")
        ]

