# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

# ^G     	ctrl-G	
# ^[g		alt-G
# ^[g		esc,G
# ^[^G		ctrl-alt-G
# ^[g		super-alt-G
# ^[G		alt-shift-G


bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
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
bindkey '^k' kill-line

bindkey '^y' yank

# [Esc-l] - run command: ls
bindkey -s '\el' 'ls -lha\n'

# [Esc-.] - run command: cd ~
bindkey -s '\e.' 'cd ~\n'

# [Ctrl-r] - Search backward incrementally for a specified string. The string
# may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward

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


# ctrl space complete
# bindkey '^ ' expand-or-complete
# [ctrl + space]
bindkey '^@' autosuggest-accept
# [alt-super + space]
bindkey '^[ ' autosuggest-fetch
# [ctrl-alt-shift + space]
bindkey '^[^@' autosuggest-execute




# autosuggest-clear
# autosuggest-enable
# autosuggest-disable
# autosuggest-execute
# autosuggest-fetch

# # clear bindings
#   unbind C-b
#   unbind '"'
#   unbind %
#   # nicer prefix
#   set -g prefix C-Space
#   bind Space send-prefix
#   # splitting like spacemacs
#   bind / split-window -h
#   bind - split-window -v
#   # do like terminator
#   bind -n C-E split-window -h
#   bind -n C-S-Left resize-pane -L 3
#   bind -n C-S-Right resize-pane -R 3
#   bind -n C-S-Up resize-pane -U 3
#   bind -n C-S-Down resize-pane -D 3
#   bind -n C-O split-window -v
#   # move panes without prefix
#   bind -n M-h select-pane -L
#   bind -n M-l select-pane -R
#   bind -n M-k select-pane -U
#   bind -n M-j select-pane -D
#   bind r source-file ~/.tmux.conf
# bindkey ' ' magic-space
