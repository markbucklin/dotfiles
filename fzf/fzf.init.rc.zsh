# ---------
# Setup fzf
# ---------
prepend-path "$FZF_ROOT/bin"

# ---------------
# Completion
# ---------------
# export FZF_COMPLETION_OPTS='+c -x'
source "$FZF_ROOT/shell/completion.zsh" 2> /dev/null

source "$FZF_ROOT/shell/key-bindings.zsh" 2> /dev/null

export FZF_FUNCTION_DIR="$HOME/.dotfiles/fzf/functions"

declare -a fzf_function_files=( $(ls $FZF_FUNCTION_DIR/**/*{.sh,.zsh}) )
for F in "$fzf_function_files[@]"; do
    [[ -f "$F" ]] && source "$F"
done

# FZF-Extras (submodule)
fzf_dot_dir="$( dirname $(realpath ${0}))"
fzf_extras_init="$fzf_dot_dir/fzf-extras/fzf-extras.zsh"
[[ -e  "$fzf_extras_init" ]]  && source "$fzf_extras_init"

# fzf-widgets (submodule)
fzf_widgets_init="$fzf_dot_dir/fzf-widgets/init.zsh"
[[ -e  "$fzf_widgets_init" ]]  && source "$fzf_widgets_init"

