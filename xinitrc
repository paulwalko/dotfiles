#!/bin/sh

[ -f ~/.Xresources ] && xrdb -merge .Xresources
xsetroot -cursor_name left_ptr

xbindkeys
xmodmap ~/.Xmodmap
exec i3
