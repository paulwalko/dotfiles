export SHELL=/bin/zsh
if [[ "$SSH_CONNECTION" != "" && "$MY_SSH_CONNECTION" != "yes" ]]; then
    	/bin/zsh
fi
exec /bin/zsh -l
