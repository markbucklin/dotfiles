# ---------
# Setup fzf
# ---------
# new_entry="$HOME/.fzf/bin"
# if [ -z $(grep -o $new_entry <(echo $PATH) ) ]
# then
#   export PATH="$new_entry":"$PATH"
# fi
export FZF_ROOT="$HOME/.fzf"
prepend-path "$FZF_ROOT/bin"

# ---------------
# Completion
# ---------------
# export FZF_COMPLETION_OPTS='+c -x'
source "$FZF_ROOT/shell/completion.zsh" 2> /dev/null

source "$FZF_ROOT/shell/key-bindings.zsh" 2> /dev/null

export FZF_FUNCTION_DIR="$HOME/.dotfiles/fzf/functions"

local fzf_function_files=( $(ls $FZF_FUNCTION_DIR/**/*) )
for F in "$fzf_function_files[@]"; do
    [[ -f "$F" ]] && source "$F"
done

