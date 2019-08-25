#!/bin/sh

[ -f ~/.Xresources ] && xrdb -merge .Xresources
xsetroot -cursor_name left_ptr

HOSTNAME=$(hostname)

compton &
#com.discordapp.Discord &
#com.slack.Slack &
if [ "$HOSTNAME" = cabinet ]; then
    if [ -d /etc/X11/xinit/xinitrc.d ]; then
        for f in /etc/X11/xinit/xinitrc.d/*; do
            [ -x "$f" ] && . "$f"
        done
        unset f
    exec $STARTUP i3
    fi
else
    xbindkeys
    xmodmap ~/.Xmodmap
    nm-applet &
    exec i3
fi
