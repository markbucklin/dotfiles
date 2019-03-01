fzf-dmenu() {
	# note: xdg-open has a bug with .desktop files, so we cant use that shit
	selected="$(ls /usr/share/applications | fzf -e)"
	nohup `grep '^Exec' "/usr/share/applications/$selected" | tail -1 | sed 's/^Exec=//' | sed 's/%.//'` >/dev/null 2>&1&
}

# hotkey to run the function (Ctrl+O)
bind '"\C-O":"fzf-dmenu\n"'
