# ---------
# Setup fzf
# ---------
fzf_dot_dir="$(dirname $(realpath ${0}))"
[[ -d $FZF_PLUGIN_DIR ]] || export FZF_PLUGIN_DIR="$fzf_dot_dir"

# Add main fzf repository binary dir to path
prepend-path "$FZF_ROOT/bin"

# ---------------
# Completion
# ---------------
# export FZF_COMPLETION_OPTS='+c -x'
source "$FZF_ROOT/shell/completion.zsh" 2>/dev/null

source "$FZF_ROOT/shell/key-bindings.zsh" 2>/dev/null

# Add Functions dir to FPATH and Bin dir to PATH (custom functions and scripts)
export FZF_FUNCTION_DIR="$FZF_PLUGIN_DIR/functions"

prepend-path "$FZF_PLUGIN_DIR/bin"
fpath+="$FZF_FUNCTION_DIR"
fpath+="$FZF_FUNCTION_DIR/autoload"
autoload -Uz $(ls -F $FZF_FUNCTION_DIR/autoload | grep -v /)

# FZF-Extras (submodule)
fzf_extras_init="$fzf_dot_dir/fzf-extras/fzf-extras.zsh"
[[ -e "$fzf_extras_init" ]] && source "$fzf_extras_init"

# fzf-widgets (submodule)
fzf_widgets_init="$fzf_dot_dir/fzf-widgets/init.zsh"
[[ -e "$fzf_widgets_init" ]] && source "$fzf_widgets_init"

# ------------------------
# Default Options
# ------------------------
export HIGHLIGHT_CMD='highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null'
export FZF_DEFAULT_OPTS='--no-height --no-reverse'
export FZF_CTRL_R_OPTS="--exact --preview '(echo {} | highlight --syntax=bash -O ansi || echo {})' --preview-window down:25%:wrap --height=50%"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null ' --preview-window down:70%:wrap --height=80%"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200' --preview-window down:70%"

# export FZF_ALT_C_CMD='fd . '../../..' -t d --max-depth=1 -a

# fzf-preview() {
#     fzf -m --layout=reverse-list --exact --no-height --border --margin 5%,5%,10%,5% --inline-info --ansi --preview-window=right:60%:wrap --preview='([[ -d {} ]] && (exa -T {} || tree -C {}) || ( [[ -r {} ]] && [[ $(file -b {}) = *text* ]] && highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null)' | tee "$HOME/.cache/fzf.out" | tee >(xsel -i -b)
# }

# export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null' --preview-window down:120"
# rg --files --no-ignore-vcs --hidden | fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file ||  (highlight -O ansi -l {} ||  coderay {} || rougify {} || cat {}) 2> /dev/null | head -$LINES' --preview-window right
