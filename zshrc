source $HOME/.aliases

# Set TERM for proper tmux colors
if [[ -z $TMUX ]]; then
    export TERM='xterm-256color'
else
    export TERM='screen-256color'
fi

# Customl binaries
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export GOPATH=$HOME/go
export PATH=$HOME/.local/share/flatpak/exports/bin:$PATH
export PATH=$HOME/.local/minecraft-launcher:$PATH

# ZSH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="steeef"
plugins=(git history-substring-search)
source $ZSH/oh-my-zsh.sh

## Keybindings
bindkey '^K' history-beginning-search-backward
bindkey '^J' history-beginning-search-forward 
bindkey '^w' backward-kill-word
bindkey '\e[2~' insert-last-word
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "rhel" ]; then
        bindkey '\e[1~' beginning-of-line
        bindkey '\e[4~' end-of-line
    fi
fi

# GPG/SSH
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# VIM
## Reduce delay swithing between normal & insert mode
export KEYTIMEOUT=1

# Fancy tui dircolors
eval `dircolors ~/.config/dircolors-solarized/dircolors.256dark`
