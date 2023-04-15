unset LANG
if [ -n "$TERM" ] && [ "$TERM" != dumb ]; then
	zsh=$(command -v zsh)
	if [ -x "$zsh" ]; then
		SHELL=$zsh
		exec "$zsh" -l
	fi
fi
