LN_FLAGS = -sfnv
MKDIR_FLAGS = -pv

home_symlinks = aliases Xresources

config_copy = 

config_symlinks = xmonad

all: install

install: aliases Xresources xmonad

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

zprofile:
	test -e $(CURDIR)/profile && ln $(LN_FLAGS) $(CURDIR)/profile ~/.zprofile
