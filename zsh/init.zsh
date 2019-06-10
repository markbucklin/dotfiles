#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Local init path
# ZSH_INIT_DIR=${ZSH}/init
# command ls $ZSH_INIT_DIR &>/dev/null || ZSH_INIT_DIR="$(dirname $0)"
ZSH_INIT_DIR="$(chase $(dirname $0))"
export ZSH_INIT_DIR

# Set up fpath
# source $ZSH/init/fpath.zsh
# note: this script currently slows down startup immensely

# Prompt
autoload -U promptinit && promptinit
# prompt pure
# PS1='%18<..<%B%4~ %(!,#,$)%b '

# Completion Init
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

# Bind VIINS keymap to MAIN
bindkey -v
# setopt vi

# FASD
if command -v fasd >/dev/null 2>&1; then
    eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi
source "$ZSH_INIT_DIR/plugins/fasd-fzf/fasd-fzf.plugin.zsh"

# Vi-Mode Keybindings
source $ZSH_INIT_DIR/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
MODE_CURSOR_VICMD="green steady underline"
# MODE_CURSOR_VIINS="#20d08a blinking bar"
MODE_CURSOR_VIINS="red blinking bar"
MODE_CURSOR_SEARCH="yellow steady block"
MODE_INDICATOR_VIINS='%F{4}[%F{2}INS%F{4}]%f'
MODE_INDICATOR_VICMD='%F{11}[%F{12}CMD%F{11}]%f'
MODE_INDICATOR_REPLACE='%F{3}[%F{5}REPLACE%F{3}]%f'
MODE_INDICATOR_SEARCH='%F{7}[%F{14}SEARCH%F{7}]%f'
MODE_INDICATOR_VISUAL='%F{1}[%F{12}VIS%F{1}]%f'
MODE_INDICATOR_VLINE='%F{1}[%F{13}VISLINE%F{1}]%f'
setopt promptsubst
# PS1='%B${MODE_INDICATOR_PROMPT}%b %F{9}%(!,#,$)%f '
PS1='%F{9}%(!,#,$)%f '
RPS1='%B${MODE_INDICATOR_PROMPT}%b  %54<..<%F{9}%B%~%b%f'

export CLICOLOR=1

# source $ZSH_INIT_DIR/keys.zsh
source $ZSH_INIT_DIR/history.zsh
source $ZSH_INIT_DIR/completion.zsh
source $ZSH_INIT_DIR/aliases.zsh
source $ZSH_INIT_DIR/stack.zsh
source $ZSH_INIT_DIR/functions.zsh
# source $ZSH_INIT_DIR/help.zsh

#source $ZSH_INIT_DIR/plugins/which.plugin.zsh

# Colors
autoload -Uz colors && colors
source $ZSH_INIT_DIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Keymaps (TODO)
# source $ZSH_INIT_DIR/keys.zsh
# source $ZSH_INIT_DIR/load-surround.zsh

# Options
setopt autocontinue
setopt globstarshort
setopt nolistrowsfirst
setopt rcquotes
