xbindkeys &> /dev/null

systemctl --user is-active --quiet offlineimap || (pass dumb &> /dev/null && systemctl --user start offlineimap)
