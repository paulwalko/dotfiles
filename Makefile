LN_FLAGS = -sfnv
MKDIR_FLAGS = -pv

home_symlinks = aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc mutt vimrc vim Xmodmap tmux.conf gitconfig bashrc

config_copy = 

config_symlinks = termite dircolors-solarized i3

gnupg_symlinks = gpg-agent.conf


local_install: aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc mutt vimrc vim termite dircolors-solarized i3 gitconfig gpg-agent.conf bashrc

mac_local_install: vimrc vim dircolors-solarized gpg-agent.conf tmux.conf bashrc

remote_install: vim vimrc dircolors-solarized aliases tmux.conf

ctrl_install: Xmodmap

.PHONY: $(home_symlinks)
$(home_symlinks):
	$(eval DESTDIR := $(shell dirname ~/.$@))
	mkdir $(MKDIR_FLAGS) $(DESTDIR)
	test -e $(CURDIR)/$@ && ln $(LN_FLAGS) $(CURDIR)/$@ ~/.$@

.PHONY: $(config_copy)
$(config_copy):
	$(eval DESTDIR := $(shell dirname ~/.config/$@))
	mkdir $(MKDIR_FLAGS) $(DESTDIR)
	test -e $(CURDIR)/$@ && cp --remove-destination -p $(CURDIR)/$@ ~/.config/$@

.PHONY: $(config_symlinks)
$(config_symlinks):
	$(eval DESTDIR := $(shell dirname ~/.config/$@))
	mkdir $(MKDIR_FLAGS) $(DESTDIR)
	test -e $(CURDIR)/$@ && ln $(LN_FLAGS) $(CURDIR)/$@ ~/.config/$@

.PHONY: $(ssh_symlinks)
$(ssh_symlinks):
	$(eval DESTDIR := $(shell dirname ~/.ssh/$@))
	mkdir $(MKDIR_FLAGS) $(DESTDIR)
	test -e $(CURDIR)/$@ && ln $(LN_FLAGS) $(CURDIR)/$@ ~/.ssh/$@

.PHONY: $(gnupg_symlinks)
$(gnupg_symlinks):
	$(eval DESTDIR := $(shell dirname ~/.gnupg/$@))
	mkdir $(MKDIR_FLAGS) $(DESTDIR)
	test -e $(CURDIR)/$@ && ln $(LN_FLAGS) $(CURDIR)/$@ ~/.gnupg/$@
