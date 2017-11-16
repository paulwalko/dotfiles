LN_FLAGS = -sfnv
MKDIR_FLAGS = -pv

<<<<<<< HEAD
home_symlinks = aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc mutt zprofile zshrc vimrc vim Xmodmap
=======
home_symlinks = vimrc vim bash_profile
>>>>>>> be3d088b245011c8fe325ad807f90fbbcf691edb

config_copy = 

config_symlinks =

all: install

<<<<<<< HEAD
install: aliases Xresources xbindkeysrc xinitrc offlineimaprc urlview msmtprc mutt zprofile zshrc vimrc vim Xmodmap
=======
install: vimrc vim bash_profile
>>>>>>> be3d088b245011c8fe325ad807f90fbbcf691edb

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
