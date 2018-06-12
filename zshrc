### ZSH Config

## Set TERM for proper colors
if [[ -z $TMUX ]]; then
    export TERM='xterm-256color'
else
    export TERM='screen-256color'
fi


### For local binaries (vim 8)
export PATH=$HOME/.local/bin:$PATH

## Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="steeef"

## Plugins
plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh


### User configuration
source $HOME/.aliases

## GPG Auth method
export GPG_TTY=$(tty)

##  Vim stuff
# Reduce delay swithing between normal & insert mode
export KEYTIMEOUT=1

# Keybindings
bindkey '^K' history-beginning-search-backward
bindkey '^J' history-beginning-search-forward 
bindkey '^w' backward-kill-word
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "rhel" ]; then
        bindkey '\e[1~' beginning-of-line
        bindkey '\e[4~' end-of-line
        bindkey '\e[2~' insert-last-word
    fi
fi

## Dircolors
eval `dircolors ~/.config/dircolors-solarized/dircolors.256dark`
