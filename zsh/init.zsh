#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Local path
zsh_user_dir=$(dirname "$0")

fpath=( $zsh_user_dir $fpath )



# Prompt
autoload -Uz promptinit && promptinit
prompt pure

# Completion Init
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit


setopt autocd
setopt extendedglob
setopt NO_NOMATCH

export CLICOLOR=1

# add completions plugin
source $zsh_user_dir/plugins/zsh-completions/zsh-completions.plugin.zsh

# source $zsh_user_dir/keys.zsh
source $zsh_user_dir/history.zsh
source $zsh_user_dir/completion.zsh
source $zsh_user_dir/aliases.zsh
source $zsh_user_dir/stack.zsh
source $zsh_user_dir/functions.zsh



# Colors
autoload -U colors && colors
source $zsh_user_dir/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh


# FASD
if command -v fasd >/dev/null 2>&1; then
    eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi

# Other Tool Files
# source $zsh_user_dir/fpath.zsh

# Keymaps (TODO)
# source $zsh_user_dir/keybindings.viins.zsh
bindkey -e
source $zsh_user_dir/keybindings.emacs.zsh
source $zsh_user_dir/keys.zsh
