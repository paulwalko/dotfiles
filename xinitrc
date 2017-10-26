#!/bin/sh

[ -f ~/.Xresources ] && xrdb -merge .Xresources
xsetroot -cursor_name left_ptr

xbindkeys &
slack &
exec i3
