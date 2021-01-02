unset LANG
if [ -n "$TERM" ] && [ "$TERM" != dumb ]; then
	SHELL=$(command -v zsh)
	if [ -x "$SHELL" ]; then
		exec "$SHELL" -l
	fi
fi
