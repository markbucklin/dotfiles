# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a  
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b
bindkey -v   # Default to standard vi bindings, regardless of editor string

# [Esc-w] - Kill from the cursor to the mark
bindkey '\ew' kill-region

# [Ctrl-k] - Kill from cursor to end of line
bindkey '^k' kill-line

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

# [Space] - do history expansion
# bindkey ' ' magic-space

# [Alt+Right-Arrow] - move backward one word
bindkey '^[b' backward-word

# [Alt+Left-Arrow] - move forward one word
bindkey '^[f' forward-word

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting ~
# [Delete] - delete backward
bindkey '^?' backward-delete-char

# [fn-Delete] - delete forward
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '\e[3~' delete-char

# Emacs-style bindings
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
