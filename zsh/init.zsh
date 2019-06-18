#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Local init path
# ZSH_INIT_DIR=${ZSH}/init
ZSH_INIT_DIR="$(chase $(dirname $0))"
export ZSH_INIT_DIR

# Options
setopt autocontinue
setopt globstarshort
setopt nolistrowsfirst
setopt rcquotes
setopt autocd
setopt autolist
setopt autoparamslash
setopt autoremoveslash
setopt autoparamkeys
setopt extendedglob
setopt listambiguous
setopt interactivecomments
setopt multios
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt completealiases
setopt globcomplete
setopt nomatch
setopt vi
setopt chasedots
setopt globassign
setopt globdots

# Bind VIINS keymap to MAIN
bindkey -v

# Completion Init
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
source $ZSH_INIT_DIR/completion.zsh

# Vi-Mode Keybindings
source $ZSH_INIT_DIR/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh

# Prompt
source $ZSH_INIT_DIR/prompt.zsh

# FASD & fasd-fzf plugin (binds alt+j to cd-fzf-widget)
if (( ${+command[fasd]} )); then
    eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi
fpath+=( $ZSH_INIT_DIR/plugins/fasd-fzf )
source "$ZSH_INIT_DIR/plugins/fasd-fzf/fasd-fzf.plugin.zsh"

source $ZSH_INIT_DIR/history.zsh
source $ZSH_INIT_DIR/aliases.zsh
source $ZSH_INIT_DIR/stack.zsh
source $ZSH_INIT_DIR/functions.zsh
# source $ZSH_INIT_DIR/help.zsh

# Colors and Syntax Highlighting
autoload -Uz colors && colors
source $ZSH_INIT_DIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
