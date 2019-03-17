LN_FLAGS = -sfnv
MKDIR_FLAGS = -pv

home_symlinks = aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc mutt zprofile zshrc vimrc vim Xmodmap oh-my-zsh bash_profile tmux.conf

config_copy = 

config_symlinks = termite dircolors-solarized i3


all: 

local_install: aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc mutt zprofile zshrc vimrc vim termite dircolors-solarized oh-my-zsh i3

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
