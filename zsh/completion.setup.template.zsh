#!/bin/zsh

tool_name="pandoc"

zsh_completion_gen_arg=('--zsh-completion' 'completion --zsh' 'completions zsh --completion=zsh' 'gen autocomplete' '+ complete setup zsh')

gen_args=($zsh_completion_gen_arg[@] 'completion')

# todo add bash completion as backup and cycle through all args

# todo [[ command -v $tool_name]] || exit
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
