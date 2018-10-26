# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mark/.fzf/bin* ]]; then
  export PATH="$PATH:/home/mark/.fzf/bin"
fi


export FZF_COMPLETION_OPTS='+c -x'

# export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# --preview='head -$LINES {}' --bind='alt-p:toggle-preview'

# export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file ||  (highlight -O ansi -l {} ||  coderay {} || rougify {} || cat {}) 2> /dev/null | head -$LINES' --preview-window down:1"

export FZF_DEFAULT_OPTS='--no-reverse --inline-info --extended --no-height'

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -$LINES' --preview-window down"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Breadth first list directories
# bash <(curl -fL https://raw.githubusercontent.com/junegunn/blsd/master/install)
command -v blsd > /dev/null && export FZF_ALT_C_COMMAND='blsd'



# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mark/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/mark/.fzf/shell/key-bindings.zsh"




# export FZF_CTRL_T_OPTS="--select-1 --exit-0"

# export FZF_DEFAULT_COMMAND='
#   (git ls-tree -r --name-only HEAD ||
#    find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
#       sed s/^..//) 2> /dev/null'
