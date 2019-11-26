LN_FLAGS = -sfnv
MKDIR_FLAGS = -pv

home_symlinks = aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc zprofile zshrc vimrc vim Xmodmap oh-my-zsh bash_profile tmux.conf gitconfig

config_copy = 

config_symlinks = termite dircolors-solarized i3

ssh_symlinks = config

gnupg_symlinks = gpg-agent.conf


local_install: aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc zprofile zshrc vimrc vim termite dircolors-solarized oh-my-zsh i3 gitconfig config gpg-agent.conf

mac_local_install: zprofile zshrc vimrc vim dircolors-solarized oh-my-zsh gpg-agent.conf tmux.conf

remote_install: vim vimrc dircolors-solarized zshrc aliases oh-my-zsh zprofile tmux.conf

noroot_install: bash_profile

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
