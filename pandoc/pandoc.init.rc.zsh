#!/bin/zsh

tool_name="pandoc"

# todo [[ command -v $tool_name]] || exit

zsh_cache=${XDG_CACHE_HOME:-$HOME/.cache}/zsh
[[-d $zsh_cache ]] || md -p "$zsh_cache"


# Generate completion file to source
completion_file="$zsh_cache/${tool_name}.completion.zsh"
gen_command='pandoc --bash-completion'
[[ -f "$completion_file"]] || eval "${gen_command}" > "${completion_file}"
# todo use zsh


# source completion file
source "${completion_file}"
