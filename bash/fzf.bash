# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mark/.fzf/bin* ]]; then
  export PATH="$PATH:/home/mark/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mark/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/mark/.fzf/shell/key-bindings.bash"

