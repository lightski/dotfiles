-- import section
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers(doFullFloat, isFullscreen, isDialog)
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

-- custom manage hook
myManageHook = composeAll 
    [ manageDocks
    , isFullscreen --> doFullFloat
    , className =? "deadbeef" --> doShift "1"
    , manageHook def
    ]

-- main function launches xmobar then reads config
main = do 
    xmproc <- spawnPipe "xmobar" 
    spawn "xscreensaver -no-splash"
    xmonad $ docks def
        { manageHook = myManageHook
        , handleEventHook = fullscreenEventHook
        , layoutHook = smartBorders $
                       avoidStruts $ 
                       Tall 1 (3/100) (1/2)
                       ||| Mirror (Tall 1 (3/100) (1/2))
                       ||| Full
        , logHook = do dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "darkgreen" "" . shorten 50
                        }
        , terminal = "urxvt"
        , modMask = mod4Mask
        , borderWidth = 2
        , normalBorderColor = "#073642"
        , focusedBorderColor = "#2aa198"
        } `additionalKeys` --discover key numbers: xev
        [-- meta-i opens journal
            ((mod4Mask, xK_i), spawn "~/.dotfiles/bin/journal"),
            -- meta+shift+i opens wiki
            ((mod4Mask .|. shiftMask, xK_i), spawn "~/.dotfiles/bin/wiki-index"),
            --next keys: 0 indicates no leader key. These are mostly media keys
            ((0, 0x1008ff11), spawn "amixer -M set Master 2%- unmute"),
            ((0, 0x1008ff12), spawn "amixer set Master toggle"),
            ((0, 0x1008ff13), spawn "amixer -M set Master 2%+ unmute"),
            ((0, 0x1008ff14), spawn "deadbeef --play-pause"),
            ((0, 0x1008ff15), spawn "deadbeef --stop"),
            ((0, 0x1008ff16), spawn "deadbeef --prev"),
            ((0, 0x1008ff17), spawn "deadbeef --next"),
            ((0, 0x1008ff2d), spawn "xscreensaver-command -lock"),
            ((0, 0x1008ff59), spawn "~/.dotfiles/bin/toggle-ext-mon.sh"),
            ((0,     0xff61), spawn "maim -s ~/Pictures/$(date +%F_%T).png")
        ]

