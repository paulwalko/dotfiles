## Set term for proper colors
if [[ -z $TMUX ]]; then
    if [ -e /usr/share/terminfo/x/xterm-256color ]; then # may be xterm-256 depending on your distro
        export TERM='xterm-256color'
    else
        export TERM='xterm'
    fi
else
    if [ -e /usr/share/terminfo/s/screen.xterm-256color ]; then
        export TERM='screen-256color'
    else
        export TERM='screen'
    fi
fi

# Other settings
xbindkeys
gpg2 --quiet --no-tty --batch -d $HOME/.mutt/passwords/dumb.gpg &> /dev/null
