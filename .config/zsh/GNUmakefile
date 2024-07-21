.SUFFIXES:
.SUFFIXES: .zwc

%.zwc: %
	zsh -c 'zcompile $<'

TARGET = .zshrc .zlogin .zlogout .zcompdump

.PHONY: all
all: $(TARGET) cache zcompile

.PHONY: zcompile
zcompile:
	bin/zcompile $(TARGET) .zshenv functions cache

zshrc-src := $(shell find src/rc.d -type f)
.zshrc: $(zshrc-src)
	bin/render src/rc.d
	bin/concat src/rc.d >$@
zlogin-src := $(shell find src/login.d -type f)
.zlogin: $(zlogin-src)
	bin/concat src/login.d >$@
zlogout-src := $(shell find src/logout.d -type f)
.zlogout: $(zlogout-src)
	bin/concat src/logout.d >$@

.zcompdump:
	zsh -c 'autoload -Uz compinit; compinit'

.PHONY: cache
cache: $(addprefix cache/,pager path sheldon atuin mise)
cache/pager:
	( env-config editor; env-config pager ) >$@
cache/path:
	env-config path -z >$@
cache/sheldon: ~/.config/sheldon/plugins.toml
	sheldon source >$@
cache/atuin:
	atuin init --disable-up-arrow zsh >$@
cache/mise:
	mise activate zsh >$@

.PHONY: clean clean-zwc clean-cache clean-zsh-files
clean: clean-zwc clean-cache clean-zsh-files
clean-zwc:
	find -L . -type f -name '*.zwc' | xargs -r rm
clean-cache:
	find -L cache -type f | xargs -r rm
clean-zsh-files:
	$(RM) $(TARGET)
