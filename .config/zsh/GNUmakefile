.SUFFIXES:
.SUFFIXES: .zwc

%.zwc: %
	zsh -c 'zcompile $<'

TARGET = .zshrc .zlogin .zlogout .zcompdump

all: $(TARGET) cache zcompile

zcompile:
	bin/zcompile $(TARGET) .zshenv functions cache

.zshrc:
	bin/render src/rc.d
	bin/concat src/rc.d >$@
.zlogin:
	bin/concat src/login.d >$@
.zlogout:
	bin/concat src/logout.d >$@
.zcompdump:
	zsh -c 'autoload -Uz compinit; compinit'

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

clean: clean-zwc clean-cache clean-zsh-files
clean-zwc:
	find -L . -type f -name '*.zwc' | xargs -r rm
clean-cache:
	find -L cache -type f | xargs -r rm
clean-zsh-files:
	$(RM) $(TARGET)
