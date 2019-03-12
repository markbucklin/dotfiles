# ---------
# Setup fzf
# ---------
fzf_dot_dir="$( dirname $(realpath ${0}))"
[[ -d $FZF_PLUGIN_DIR  ]] || export FZF_PLUGIN_DIR="$fzf_dot_dir"

# Add main fzf repository binary dir to path
prepend-path "$FZF_ROOT/bin"

# ---------------
# Completion
# ---------------
# export FZF_COMPLETION_OPTS='+c -x'
source "$FZF_ROOT/shell/completion.zsh" 2> /dev/null

source "$FZF_ROOT/shell/key-bindings.zsh" 2> /dev/null

# Add Functions dir to FPATH and Bin dir to PATH (custom functions and scripts)
export FZF_FUNCTION_DIR="$FZF_PLUGIN_DIR/functions"

prepend-path "$FZF_PLUGIN_DIR/bin"
fpath+="$FZF_FUNCTION_DIR"
fpath+="$FZF_FUNCTION_DIR/autoload"
autoload -Uz $(ls -F $FZF_FUNCTION_DIR/autoload | grep -v /)

# FZF-Extras (submodule)
fzf_extras_init="$fzf_dot_dir/fzf-extras/fzf-extras.zsh"
[[ -e  "$fzf_extras_init" ]]  && source "$fzf_extras_init"

# fzf-widgets (submodule)
fzf_widgets_init="$fzf_dot_dir/fzf-widgets/init.zsh"
[[ -e  "$fzf_widgets_init" ]]  && source "$fzf_widgets_init"

