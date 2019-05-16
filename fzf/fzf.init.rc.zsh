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

# source functions from functions dir
for f in $(command find $FZF_FUNCTION_DIR -maxdepth 1 -type f)
do
    source "$f"
done

# FZF-Extras (submodule)
fzf_extras_init="$fzf_dot_dir/fzf-extras/fzf-extras.zsh"
[[ -e "$fzf_extras_init" ]] && source "$fzf_extras_init"
# source "$fzf_dot_dir/fzf-extras/fzf-extras.sh"

# fzf-widgets (submodule)
# $FZF_WIDGET_OPTS[insert-history]='--exact'
fzf_widgets_init="$fzf_dot_dir/fzf-widgets/init.zsh"
[[ -e "$fzf_widgets_init" ]] && source "$fzf_widgets_init"

# ------------------------
# Default Options
# ------------------------
# export HIGHLIGHT_CMD='highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null'
export PREVIEW_CMD='
    (
    [[ $\"\$(file --mime \"\$(chase {} )\")\" =~ binary ]]
    && eval \"{} --help\"
    || highlight -O ansi -t 2 -l --wrap-no-numbers --line-length=$COLUMNS {} 2> /dev/null
    || cat {} ||
    )
    2> /dev/null'
    # --height 75% --multi --no-height --no-reverse --bind ctrl-f:page-down,ctrl-b:page-up'
    # --bind \"enter:execute(less {})\"
typeset  -A FILE_SEARCH_CMD
FILE_SEARCH_CMD["rg"]=$'rg --files --no-ignore --hidden --follow --glob \'\!.git/*\' '
FILE_SEARCH_CMD["fd"]='fd --type f . '
FILE_SEARCH_CMD["find"]="find * -type f -not -path './.git/*\'"
export FILE_SEARCH_COMMAND


export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
declare -a fzf_default_opts
fzf_default_opts=(
    '--height 75%'
    '--multi'
    '--layout=reverse-list'
    '--bind=ctrl-d:page-down,ctrl-u:page-up'
    '--bind=?:toggle-preview'
    '--bind=ctrl-alt-j:preview-down,ctrl-alt-k:preview-up'
    '--bind=ctrl-alt-d:preview-page-down,ctrl-alt-u:preview-page-up'
    '--bind=alt-z:toggle-preview-wrap'
    '--bind=ctrl-alt-a:toggle-all,alt-a:select-all'
    '--filepath-word'
    '--inline-info'
    '--ansi'
    '--tabstop=4'
    '--color=dark,info:3,hl:12,hl+:11,pointer:9,marker:1,border:4,prompt:10'
    "--history=$HOME/.fzfhistory"
    '--preview="echo {+}"'
    '--preview-window=down:3:wrap'
    )
export FZF_DEFAULT_OPTS="${fzf_default_opts[@]}"

export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_ALT_C_OPTS='
    --select-1
    --exit-0
    --no-multi
    --preview "tree -C {} | head -200"
    --preview-window down:70%
    '

export FZF_CTRL_R_OPTS='
    --preview "(echo {} | highlight --syntax=bash -O ansi || echo {})"
    --preview-window down:45%:wrap
    --layout=default
    --bind="ctrl-y:execute(echo -n {} | cut -d \" \" -f1 --complement | xsel -i -b)"
    '

# export FZF_CTRL_R_OPTS="${(@q-)fzf_ctrl_r_opts[@]}"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
    --select-1
    --exit-0
    --layout=reverse-list
    --exact
    --no-height
    --border
    --margin 5%,5%,10%,5%
  --preview-window=right:60%:wrap
  --preview='([[ $\"\$(file --mime \"\$(chase {} )\")\" =~ binary ]] && eval \"{} --help\" 2>/dev/null || [[ $\"\$(file --mime \"\$(chase {} )\")\" =~ text ]] && highlight -O ansi -t 2 --force --line-length=$COLUMNS {} 2>/dev/null ) 2>/dev/null'
 "

# FZF_PREVIEW_CMD='([[ -d {} ]] && exa -T {} ) || ( [[ -r {} ]] && [[ $(file -b {}) = *text* ]] && highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null)'

# export FZF_ALT_C_CMD='fd . '../../..' -t d --max-depth=1 -a

# fzf-preview() {
#     fzf -m --layout=reverse-list --exact --no-height --border --margin 5%,5%,10%,5% --inline-info --ansi --preview-window=right:60%:wrap --preview='([[ -d {} ]] && (exa -T {} || tree -C {}) || ( [[ -r {} ]] && [[ $(file -b {}) = *text* ]] && highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null)' | tee "$HOME/.cache/fzf.out" | tee >(xsel -i -b)
# }

# export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null' --preview-window down:120"
# rg --files --no-ignore-vcs --hidden | fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file ||  (highlight -O ansi -l {} ||  coderay {} || rougify {} || cat {}) 2> /dev/null | head -$LINES' --preview-window right
