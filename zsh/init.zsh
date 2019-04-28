#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Local function path
zsh_user_dir=$(dirname $0)

# Set up fpath
source $zsh_user_dir/fpath.zsh

# Prompt
autoload -U promptinit && promptinit
prompt pure

# Completion Init
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit


source $zsh_user_dir/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh


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
# source $zsh_user_dir/load-surrund.zsh
source $zsh_user_dir/keys.vi.zsh

# FASD
if command -v fasd >/dev/null 2>&1; then
    eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi

