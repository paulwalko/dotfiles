#!/bin/sh

[ -f ~/.Xresources ] && xrdb -merge .Xresources
xsetroot -cursor_name left_ptr

xbindkeys
xmodmap ~/.Xmodmap
#nm-applet &
#discord &
#slack &
compton &
exec i3
