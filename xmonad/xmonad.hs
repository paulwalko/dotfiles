-- Old Imports saved so I don't loose them
-- import qualified XMonad.StackSet as W
-- Also random comments for future reference:
-- https://gist.github.com/BinRoot/8154650
-- TODO: statusbar

import XMonad
import XMonad.Wallpaper
import XMonad.Config.Desktop
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Spacing (smartSpacing)
import XMonad.Util.EZConfig ( additionalKeys )
import XMonad.Layout.NoBorders ( smartBorders )

import System.Exit

-- Fullscreen video hax Imports
-- https://www.reddit.com/r/xmonad/comments/4cnjhi/fullscreen_video_in_firefox/d1juwkl/
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders

-- set mod key (alt)
myModMask     = mod1Mask

-- set terminal
myTerminal    = "urxvt"

-- border spacing
myLayoutHook  = smartSpacing 4 $ smartBorders ( avoidStruts $  layoutHook defaultConfig )

-- border sie
myBorderWidth = 0

main = do
    setRandomWallpaper ["$HOME/images/wallpaper"]
    xmonad $ defaultConfig
        { terminal        = myTerminal
        , layoutHook      = myLayoutHook
        , borderWidth     = myBorderWidth
        -- Video hax
        , manageHook      = manageDocks <+> manageHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook
        --
        } `additionalKeys` myAdditionalKeys

myAdditionalKeys =
    [ ((myModMask,               xK_q), spawn "i3lock -i $HOME/images/lock.png")
    ] ++
    [ ((myModMask .|. shiftMask, xK_q), kill)
    ] ++ 
    [ ((myModMask,               xK_c), spawn "xmonad --recompile; xmonad --restart")
    ] ++
    [ ((myModMask .|. shiftMask, xK_c), io (exitWith ExitSuccess))
    ]

-- More Video hax
myManageHooks = composeAll
      [ isFullscreen --> doFullFloat
      ]
--
