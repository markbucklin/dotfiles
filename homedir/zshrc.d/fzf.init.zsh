# ---------
# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# ---------------
# Completion
# ---------------
# export FZF_COMPLETION_OPTS='+c -x'
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

[[ $- == *i* ]] && source "$HOME/.fzf/shell/key-bindings.zsh" 2> /dev/null

