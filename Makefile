LN_FLAGS = -sfnv
MKDIR_FLAGS = -pv

home_symlinks = aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc mutt zprofile zshrc vimrc vim Xmodmap bash_profile oh-my-zsh

config_copy = 

config_symlinks = termite dircolors-solarized


all: 

local_install: aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc mutt zprofile zshrc vimrc vim Xmodmap termite dircolors-solarized oh-my-zsh

remote_install: bash_profile vim vimrc dircolors-solarized zshrc aliases oh-my-zsh

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
