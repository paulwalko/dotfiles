#if [[ "$SSH_CONNECTION" != "" && "$MY_SSH_CONNECTION" != "yes" ]]; then
#    	/bin/zsh
#fi
#export SHELL=/bin/zsh
#exec /bin/zsh -l

if [[ -z $TMUX ]]; then
    if [ -e /usr/share/terminfo/x/xterm-256color ]; then # may be xterm-256 depending on your distro
        export TERM='rxvt-256color'
    else
        export TERM='rxvt'
    fi
else
    if [ -e /usr/share/terminfo/s/screen-256color ]; then
        export TERM='screen-256color'
    else
        export TERM='screen'
    fi
fi

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 13)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PATH=$HOME/.local/bin:$PATH
