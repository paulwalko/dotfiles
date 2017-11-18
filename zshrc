### ZSH Config

## Set TERM for proper colors
if [[ -z $TMUX ]]; then
    if [ -e /usr/share/terminfo/x/xterm-256color ]; then # may be xterm-256 depending on your distro
        export TERM='xterm-256color'
    else
        export TERM='xterm'
    fi
else
    if [ -e /usr/share/terminfo/s/screen-256color ]; then
        export TERM='screen-256color'
    else
        export TERM='screen'
    fi
fi

### For local binaries (vim 8)
export PATH=$HOME/.local/bin:$PATH

## Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="steeef"

## Plugins
plugins=(git vi-mode history-substring-search)

source $ZSH/oh-my-zsh.sh


### User configuration
source $HOME/.aliases

## GPG Auth method
export GPG_TTY=$(tty)

##  Vim stuff
# Reduce delay swithing between normal & insert mode
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^K' history-beginning-search-backward
bindkey '^J' history-beginning-search-forward 

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

## Dircolors
eval `dircolors ~/.config/dircolors-solarized/dircolors.256dark`
