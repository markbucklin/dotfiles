# Make functions for managing keys
keys-using-alt(){
local map=${1-='main'}
local keys
keys=($(bindkey -M $map | grep -e '^"''\^\[''\w.*'))
}


# Make Copies of main keymaps


# Delete word or char, Backwards and Forwards
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^W' backward-kill-word
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

bindkey "^F" forward-char
bindkey "^B" backward-char

# Forward and Backward Word
bindkey "^[F" forward-word
bindkey "^[B" backward-word

# Up and Down Line
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Beginning and End of line
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey '^[[Z' reverse-menu-complete

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
