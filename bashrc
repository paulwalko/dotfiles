# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s checkwinsize

# PS1
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Generic exports
  export GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$PATH
  export PATH=$HOME/.local/bin:$PATH
if [[ -z $TMUX ]]; then
  export TERM='xterm-256color'
else
  export TERM='screen-256color'
fi

# GPG/SSH
## Void: Install pcsclite, pcsc-ccid, gnupg2-scdaemon
## Debian: Install pcscd scdaemon
## Yubico openpgp: https://support.yubico.com/support/solutions/articles/15000006420-using-your-yubikey-with-openpgp
# Run if ALL variables are not set
if [ -z "$SSH_CONNECTION" ] && [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
  # Check for macOS pkcs key
  if [[ "$OSTYPE" == 'darwin'* ]]; then
    eval `ssh-agent`
    ssh-add -t 48h -s $OPENSC_LIBS/opensc-pkcs11.so
  fi

  # Run if not macOS or if macOS failed to load pkcs11 key
  if [[ "$OSTYPE" != 'darwin'* || ("$?" != '0' && "$OSTYPE" == 'darwin'*) ]]; then
    unset SSH_AGENT_PID
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
      export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    fi
    export GPG_TTY=$(tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null
  fi
fi

# OS specific settings
## macOS: do this to prevent incorrect path ordering in tmux:
## https://apple.stackexchange.com/questions/248813/tmux-always-modify-my-zsh-path
if [[ "$OSTYPE" == 'darwin'* ]]; then
  export CLICOLOR=YES
  export GEM_HOME=/Users/paul.walko/.gem
  export OPENSC_LIBS=/usr/local/lib
  if [[ -z $TMUX ]]; then
    export PATH=$GEM_HOME/bin:$PATH
    export PATH=$HOME/.linkerd2/bin:$PATH
    export PATH=/usr/local/opt/python/libexec/bin:$PATH
    export PATH=/usr/local/opt/ncurses/bin:$PATH
  fi
elif [[ "$OSTYPE" == 'linux-gnu' ]]; then
  alias ls="ls --color=auto"
  eval `dircolors ~/.config/dircolors-solarized/dircolors.256dark`
fi

# VIM
## Reduce delay swithing between normal & insert mode
export KEYTIMEOUT=1
