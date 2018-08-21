# Other settings
xbindkeys &> /dev/null
gpg2 --quiet --no-tty --batch -d $HOME/.mutt/passwords/dumb.gpg &> /dev/null

export PATH="$HOME/.cargo/bin:$PATH"
