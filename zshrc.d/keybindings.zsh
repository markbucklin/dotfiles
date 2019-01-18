# To see the key combo you want to use just do:
# cat > /dev/null
# And press it
#  OR
# showkey -a

# ^G		ctrl-G
# ^[g		alt-G
# ^[g		esc,G
# ^[^G		ctrl-alt-G
# ^[g		super-alt-G
# ^[G		alt-shift-G


# Set emacs keyboard bindings
bindkey -e


bindkey "^[K"     kill-whole-line                      # alt-shift-k
# bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b
# bindkey -v   # Default to standard vi bindings, regardless of editor string

# [Esc-w] - Kill from the cursor to the mark
bindkey '\ew' kill-region

# [Ctrl-k] - Kill from cursor to end of line
bindkey "^K" kill-line

bindkey "^Y" yank

# [Alt-L] - run command: ls
bindkey -s '^[l' 'ls -h --color\n'

# [Ctrl-Alt-L] - run command: ls with hidden-files
bindkey -s '^[^L' 'ls -Ah --color\n'

# [Alt-.] - run command: cd ~
bindkey -s '\e.' 'cd ~\n'

# [Ctrl-r] - Search backward incrementally for a specified string. The string
# may begin with ^ to anchor the search to the beginning of the line.
# bindkey '^r' history-incremental-search-backward

# [PageUp] - Up a line of history
bindkey '^[[5~' up-line-or-history

# [PageDown] - Down a line of history
bindkey '^[[6~' down-line-or-history

# start typing + [Up-Arrow] - fuzzy find history forward
bindkey '^[[A' up-line-or-search

# start typing + [Down-Arrow] - fuzzy find history backward
bindkey '^[[B' down-line-or-search

# [Home] - Go to beginning of line
bindkey '^[[H' beginning-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[OH' beginning-of-line

# [End] - Go to end of line
bindkey '^[[F' end-of-line
bindkey '^[[4~' end-of-line
bindkey '^[OF' end-of-line


# mappings for ctrl-left-arrow and ctrl-right-arrow for word moving
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word
bindkey '\e[5C' forward-word
bindkey '\e[5D' backward-word
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word


# [Ctrl-Space] : ctrl space complete
# bindkey '^ ' expand-or-complete
# [alt-super + space]
# bindkey '^[ ' autosuggest-fetch
# [ctrl-alt-shift + space]
# bindkey '^[^@' autosuggest-execute
# bindkey '^@' autosuggest-accept

# [Alt-J] : Accept current suggestion (using zsh-autosuggestions)
bindkey '\ej' autosuggest-accept

# [Alt-Enter] : Autosuggest Execute
bindkey '\em' autosuggest-execute

# [Ctrl-Alt-J] = '^[^J'

# [Ctrl+x Ctrl+e] : Edit command line by pressing Ctrl+x Ctrl+e
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line


# [Alt-Shift-P] : insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^[P' insert-last-command-output


# [Alt-Shift-J] : back and forth
cd-last-dir-fancy () {
if [[ $#BUFFER -eq 0 ]]; then
   BUFFER="fg"
   zle accept-line
else
   zle push-input
   zle clear-screen
fi
}
zle -N cd-last-dir-fancy
bindkey '^[J' cd-last-dir-fancy



# autosuggest-clear
# autosuggest-enable
# autosuggest-disable
# autosuggest-execute
# autosuggest-fetch
bindkey -s '^[^/' 'pushd /\n'
