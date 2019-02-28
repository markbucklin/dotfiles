#!/bin/zsh

tool_name="pandoc"



# todo
# ZSH_COMPLETION_DIR
zsh_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
completion_dir="${zsh_cache}/completions"
[[ -d "$completion_dir" ]] || mkdir -p "$completion_dir"


# Generate completion file to source
completion_file="${completion_dir}/_${tool_name}"
gen_command='pandoc --bash-completion'
[[ -f "${completion_file}" ]] || bash -c $(echo ${gen_command}) > ${completion_file}
# todo use zsh


# source completion file
source "${completion_file}"