# ---------
# Setup fzf
# ---------
new_entry="$HOME/.fzf/bin"
if [ -z $(grep -o $new_entry <(echo $PATH) ) ]
then
  export PATH="$new_entry":"$PATH"
fi

# ---------------
# Completion
# ---------------
# export FZF_COMPLETION_OPTS='+c -x'
source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

source "$HOME/.fzf/shell/key-bindings.zsh" 2> /dev/null

