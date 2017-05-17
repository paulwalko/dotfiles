-- Old Imports saved so I don't loose them
-- import qualified XMonad.StackSet as W
-- Also random comments for future reference:
-- https://gist.github.com/BinRoot/8154650
-- Fullscreen video hax Imports
-- https://www.reddit.com/r/xmonad/comments/4cnjhi/fullscreen_video_in_firefox/d1juwkl/

-- imports {{{
import XMonad
import XMonad.Wallpaper
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive 
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders ( smartBorders )
import XMonad.Layout.Spacing (smartSpacing)
import XMonad.Util.EZConfig ( additionalKeys )
import XMonad.Util.Run

import System.IO
import System.Exit

--}}}

-- fields {{{
-- set mod key (alt)
myModMask     = mod1Mask

-- set terminal
myTerminal    = "urxvt"

-- border spacing
myLayoutHook  = smartSpacing 4 $ smartBorders ( avoidStruts $  layoutHook defaultConfig )

-- border sie
myBorderWidth = 0

-- status bar
myXmonadBar = "dzen2 -x '0' -y '0' -h '24' -w '1690' -ta 'l' -fg '#FFFFFF' -bg '#1B1D1E'"
myStatusBar = "conky -c $HOME/.xmonad/.conky_dzen | dzen2 -x '1690' -w '2560' -h '24' -ta 'r' -bg '#1B1D1E' -fg '#FFFFFF' -y '0'"
myBitmapsDir = "$HOME/.xmonad/dzen2"
--}}}

-- main-config {{{
main = do
    dzenLeftBar <- spawnPipe myXmonadBar
    dzenRightBar <- spawnPipe myStatusBar
    setRandomWallpaper ["$HOME/images/wallpaper"]
    xmonad $ fullscreenSupport defaultConfig
        { terminal        = myTerminal
        , layoutHook      = myLayoutHook
        , borderWidth     = myBorderWidth
        , logHook         = myLogHook dzenLeftBar >> fadeInactiveLogHook 0xdddddddd
        , handleEventHook = mconcat
            [ docksEventHook
            , handleEventHook  defaultConfig]
        } `additionalKeys` myAdditionalKeys
--}}}

-- key-bindings {{{
myAdditionalKeys =
    [ ((myModMask,               xK_q), spawn "i3lock -i $HOME/images/lock.png")
    ] ++
    [ ((myModMask .|. shiftMask, xK_q), kill)
    ] ++ 
    [ ((myModMask,               xK_c), spawn "xmonad --recompile; xmonad --restart")
    ] ++
    [ ((myModMask .|. shiftMask, xK_c), io (exitWith ExitSuccess))
    ]
--}}}

-- video-hax {{{
myManageHooks = composeAll
      [ isFullscreen --> doFullFloat
      ]
--}}}

-- Hooks {{{
--Bar
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
    {
        ppCurrent           =   dzenColor "#ebac54" "#1B1D1E" . pad
      , ppVisible           =   dzenColor "white" "#1B1D1E" . pad
      , ppHidden            =   dzenColor "white" "#1B1D1E" . pad
      , ppHiddenNoWindows   =   dzenColor "#7b7b7b" "#1B1D1E" . pad
      , ppUrgent            =   dzenColor "#ff0000" "#1B1D1E" . pad
      , ppWsSep             =   " "
      , ppSep               =   "  |  "
      , ppLayout            =   dzenColor "#ebac54" "#1B1D1E" .
                                (\x -> case x of
                                    "ResizableTall"             ->      "^i(" ++ myBitmapsDir ++ "/tall.xbm)"
                                    "Mirror ResizableTall"      ->      "^i(" ++ myBitmapsDir ++ "/mtall.xbm)"
                                    "Full"                      ->      "^i(" ++ myBitmapsDir ++ "/full.xbm)"
                                    "Simple Float"              ->      "~"
                                    _                           ->      x
                                )
      , ppTitle             =   (" " ++) . dzenColor "white" "#1B1D1E" . dzenEscape
      , ppOutput            =   hPutStrLn h
    }
--}}}
