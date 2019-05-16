# Make functions for managing keys
bindkey "^[OH" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
# bindkey '^[[Z' reverse-menu-complete

# bindkey '^[[5;6~'
# Fill remaining (unsigned) keybindings with zsh defaults for selected keymap
# bindkey -m &>/dev/null


# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
#     zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select
# export KEYTIMEOUT=1
# bindkey '^[K' zle-keymap-select
# bindkey -s '\el' "ls\n"
#
#
#
#

# source ./keybindings.emacs.zsh
# source ./keybindings.viins.zsh
