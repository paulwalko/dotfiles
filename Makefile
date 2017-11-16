LN_FLAGS = -sfnv
MKDIR_FLAGS = -pv

home_symlinks = aliases Xresources xbindkeysrc xinitrc zprofile zshrc mutt offlineimaprc msmtprc urlview vimrc vim Xmodmap

config_copy = 

config_symlinks =

all: install

install: aliases Xresources xbindkeysrc xinitrc zprofile zshrc mutt offlineimaprc msmtprc urlview vimrc vim Xmodmap

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
