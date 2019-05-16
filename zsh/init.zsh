#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Local function path
zsh_user_dir=$(dirname $0)

# Set up fpath
source $zsh_user_dir/fpath.zsh

# Prompt
autoload -U promptinit && promptinit
# prompt pure
PS1='%18<..<%B%4~ %(!,#,$)%b '

# Completion Init
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit


# Vi-Mode Keybindings
source $zsh_user_dir/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
MODE_CURSOR_VICMD="green steady underline"
# MODE_CURSOR_VIINS="#20d08a blinking bar"
MODE_CURSOR_VIINS="red blinking bar"
MODE_CURSOR_SEARCH="yellow steady block"
MODE_INDICATOR_VIINS='%F{1}[%F{6}INSERT%F{1}]%f'
MODE_INDICATOR_VICMD='%F{8}[%F{10}NORMAL%F{8}]%f'
MODE_INDICATOR_REPLACE='%F{1}[%F{11}REPLACE%F{1}]%f'
MODE_INDICATOR_SEARCH='%F{13}[%F{14}SEARCH%F{13}]%f'
MODE_INDICATOR_VISUAL='%F{12}[%F{12}VISUAL%F{12}]%f'
MODE_INDICATOR_VLINE='%F{12}[%F{13}[VISLINE%F{12}]%f'
setopt promptsubst
PS1='%B${MODE_INDICATOR_PROMPT}%b %(!,#,$) '
RPS1='%24<..<%B%~%b'


# setopt vi

export CLICOLOR=1

# source $zsh_user_dir/keys.zsh
source $zsh_user_dir/history.zsh
source $zsh_user_dir/completion.zsh
source $zsh_user_dir/aliases.zsh
source $zsh_user_dir/stack.zsh
source $zsh_user_dir/functions.zsh
# source $zsh_user_dir/help.zsh

#source $zsh_user_dir/plugins/which.plugin.zsh

# Colors
autoload -U colors && colors
source $zsh_user_dir/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Keymaps (TODO)
# source $zsh_user_dir/keys.zsh
# source $zsh_user_dir/load-surround.zsh

# FASD
if command -v fasd >/dev/null 2>&1; then
    eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi
source "$zsh_user_dir/plugins/fasd-fzf/fasd-fzf.plugin.zsh"

# Options
setopt autocontinue
