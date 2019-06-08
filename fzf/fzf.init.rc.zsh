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
export FZF_COMPLETION_OPTS='-c -x -m'
source "$FZF_ROOT/shell/completion.zsh" 2>/dev/null
source "$FZF_ROOT/shell/key-bindings.zsh" 2>/dev/null

# Add Functions dir to FPATH and Bin dir to PATH (custom functions and scripts)
export FZF_BIN_DIR="$FZF_PLUGIN_DIR/bin"
export FZF_FUNCTION_DIR="$FZF_PLUGIN_DIR/functions"
append-path "$FZF_BIN_DIR"
# fpath+="$FZF_FUNCTION_DIR"
# local funcdirlist=($FZF_FUNCTION_DIR/*(/))
# fpath=($fpath ${funcdirlist1})

# Autoload function files in fzf functions dir
local funcfilelist
funcfilelist=($FZF_FUNCTION_DIR/*(.))
# autoload -Uz "$funcfilelist"

# source functions from functions dir
for f in ${funcfilelist[@]}; do
    source "$f"
done

# FZF-Extras (submodule)
fzf_extras_init="$fzf_dot_dir/fzf-extras/fzf-extras.zsh"
[[ -e "$fzf_extras_init" ]] && source "$fzf_extras_init"

# fzf-widgets (submodule)
fzf_widgets_init="$fzf_dot_dir/fzf-widgets/init.zsh"
[[ -e "$fzf_widgets_init" ]] && source "$fzf_widgets_init"
FZF_WIDGET_OPTS["insert-history"]='--exact'

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# ------------------------
# Default Options
# ------------------------

# --tabstop=4

# export HIGHLIGHT_CMD='highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null'
export PREVIEW_CMD='
    (
    [[ $\"\$(file --mime \"\$(chase {} )\")\" =~ binary ]]
    && eval \"{} --help\"
    || highlight -O ansi -t 2 -l --wrap-no-numbers --line-length=$COLUMNS {} 2> /dev/null
    || cat {} ||
    )
    2> /dev/null'
export PREVIEW_FILTER='tr -dc \"[\\n[:print:]]\"'
# --height 75% --multi --no-height --no-reverse --bind ctrl-f:page-down,ctrl-b:page-up'
# --bind \"enter:execute(less {})\"
typeset -A FILE_SEARCH_CMD
FILE_SEARCH_CMD["rg"]=$'rg --files --no-ignore --hidden --follow --glob \'\!.git/*\' '
FILE_SEARCH_CMD["fd"]='fd --type f . '
FILE_SEARCH_CMD["find"]="find * -type f -not -path './.git/*\'"
export FILE_SEARCH_COMMAND

#  FZF_DEFAULT_OPTS="
#          $FZF_DEFAULT_OPTS
#          --ansi
#          --height '80%'
#          --bind='alt-k:preview-up,alt-p:preview-up'
#          --bind='alt-j:preview-down,alt-n:preview-down'
#          --bind='ctrl-r:toggle-all'
#          --bind='ctrl-s:toggle-sort'
#          --bind='?:toggle-preview'
#          --preview-window='right:60%'
#          --bind='alt-w:toggle-preview-wrap'
#          $FORGIT_FZF_DEFAULT_OPTS
#      "

# export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --no-ignore-messages --no-messages --hidden --follow 2>/dev/null'
# FZF_DEFAULT_PREVIEW=( --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || ccat {} || cat {}) 2>/dev/null' --preview-window down:60%:hidden)

declare -a fzf_default_opts
fzf_default_opts=(
    '--no-height'
    '--multi'
    '--layout=reverse-list'
    '--bind=ctrl-alt-j:half-page-down,ctrl-alt-k:half-page-up'
    '--bind=ctrl-d:preview-down,ctrl-u:preview-up'
    '--bind=ctrl-alt-p:toggle-preview'
    '--bind=ctrl-alt-w:toggle-preview-wrap'
    '--bind=?:toggle-preview'
    '--bind=alt-z:toggle-preview-wrap'
    '--bind="ctrl-y:execute(echo -n {} | cut -d \" \" -f1 --complement | xsel -i -b)"'
    '--bind=ctrl-alt-a:toggle-all,alt-a:select-all'
    '--filepath-word'
    '--inline-info'
    '--ansi'
    '--tabstop=4'
    '--color=dark,info:3,hl:12,hl+:11,pointer:9,marker:1,border:4,prompt:10'
    "--history=$HOME/.fzfhistory"
    '--preview-window down:60%:hidden:wrap'
    '--preview ''eval "fzf_preview_command {}" '' '
)

# '--preview ''[[ $(file --mime {+}) =~ binary ]] && echo {+} is a binary file || (highlight -O ansi -l {+} || coderay {+} || rougify {+} || ccat {+} || cat {+}) 2>/dev/null'''
# '--preview-window=right:45%:wrap'
# '--preview="echo {+}"'
export FZF_DEFAULT_OPTS="${fzf_default_opts[@]}"

export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_ALT_C_OPTS='
    --select-1
    --exit-0
    --no-multi
    --preview "tree -C {} | head -200"
    --preview-window down:50%
    '

export FZF_CTRL_R_OPTS='
    --multi
    --preview "(echo {+} | highlight --syntax=bash -O ansi || echo {+})"
    --preview-window down:45%:wrap
    --layout=default
    '

# export FZF_CTRL_R_OPTS="${(@q-)fzf_ctrl_r_opts[@]}"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS=" \
    --select-1 \
    --exit-0 \
    --layout=reverse-list \
    --exact \
    --no-height \
    --border \
    --margin 5%,5%,10%,5% \
  --preview-window=down:60%:wrap \
 "

#   --preview='([[ $\"\$(file --mime \"\$(chase {} )\")\" =~ binary ]] && eval \"{} --help\" 2>/dev/null || [[ $\"\$(file --mime \"\$(chase {} )\")\" =~ text ]] && highlight -O ansi -t 2 --force --line-length=$COLUMNS {} 2>/dev/null ) 2>/dev/null' \
# FZF_PREVIEW_CMD='([[ -d {} ]] && exa -T {} ) || ( [[ -r {} ]] && [[ $(file -b {}) = *text* ]] && highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null)'

# export FZF_ALT_C_CMD='fd . '../../..' -t d --max-depth=1 -a

# fzf-preview() {
#     fzf -m --layout=reverse-list --exact --no-height --border --margin 5%,5%,10%,5% --inline-info --ansi --preview-window=right:60%:wrap --preview='([[ -d {} ]] && (exa -T {} || tree -C {}) || ( [[ -r {} ]] && [[ $(file -b {}) = *text* ]] && highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null)' | tee "$HOME/.cache/fzf.out" | tee >(xsel -i -b)
# }

# export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null' --preview-window down:120"
# rg --files --no-ignore-vcs --hidden | fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file ||  (highlight -O ansi -l {} ||  coderay {} || rougify {} || cat {}) 2> /dev/null | head -$LINES' --preview-window right
