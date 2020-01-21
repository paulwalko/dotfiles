#source $HOME/.aliases

# Set TERM for proper tmux colors
if [[ -z $TMUX ]]; then
  export TERM='xterm-256color'
else
  export TERM='screen-256color'
fi

# Customl binaries
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/flatpak/exports/bin:$PATH
export PATH=$HOME/.local/minecraft-launcher:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export GOPATH=$HOME/go

# ZSH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME='steeef'
plugins=(git history-substring-search docker docker-compose)
source $ZSH/oh-my-zsh.sh

## Keybindings
bindkey '^K' history-beginning-search-backward
bindkey '^J' history-beginning-search-forward 
bindkey '^w' backward-kill-word
bindkey '\e[2~' insert-last-word
if [ -f /etc/os-release ]; then
  . /etc/os-release
  if [ "$ID" = 'rhel' ]; then
    bindkey '\e[1~' beginning-of-line
    bindkey '\e[4~' end-of-line
  fi
fi

# GPG/SSH
## Void: Install pcsclite, pcsc-ccid, gnupg2-scdaemon
## Yubico openpgp: https://support.yubico.com/support/solutions/articles/15000006420-using-your-yubikey-with-openpgp
# Run if ALL variables are not set
if [ -z "$SSH_CONNECTION" ] && [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
  if [[ "$OSTYPE" == 'darwin'* ]]; then
    eval `ssh-agent`
    ssh-add -t 48h -s $OPENSC_LIBS/opensc-pkcs11.so
  fi

  if [[ "$OSTYPE" != 'darwin'* || ("$?" != '0' && "$OSTYPE" == 'darwin'*) ]]; then
    unset SSH_AGENT_PID
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
      export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    fi
    export GPG_TTY=$(tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null
  fi
fi

if [[ "$OSTYPE" == 'darwin'* ]]; then
  export CLICOLOR=YES
  export PATH=/usr/local/opt/python/libexec/bin:$PATH
  export PATH=/usr/local/opt/ncurses/bin:$PATH
  export PATH=$PATH:$HOME/.linkerd2/bin
  export OPENSC_LIBS=/usr/local/lib
  source $HOME/.cargo/env
elif [[ "$OSTYPE" == 'linux-gnu' ]]; then
  eval `dircolors ~/.config/dircolors-solarized/dircolors.256dark`
fi

# VIM
## Reduce delay swithing between normal & insert mode
export KEYTIMEOUT=1
