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
export GOPATH=$HOME/go
export PATH=$HOME/.local/share/flatpak/exports/bin:$PATH
export PATH=$HOME/.local/minecraft-launcher:$PATH
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
# Run if NOT ssh session
if [ -z "$SSH_CLIENT" ] || [ -z "$SSH_TTY" ]; then
  CONTINUE=true
  if [[ "$OSTYPE" == 'darwin'* ]]; then
    eval `ssh-agent`
    ssh-add -t 48h -s $OPENSC_LIBS/opensc-pkcs11.so
    CONTINUE=false
  fi

  if [[ "$CONTINUE" == true ]]; then
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
  # ssh-agent config
  eval `ssh-agent`
  ssh-add -t 48h -s $OPENSC_LIBS/opensc-pkcs11.so
  if [ "$?" -ne 0 ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
elif [[ "$OSTYPE" == 'linux-gnu' ]]; then
  eval `dircolors ~/.config/dircolors-solarized/dircolors.256dark`
fi

# VIM
## Reduce delay swithing between normal & insert mode
export KEYTIMEOUT=1
