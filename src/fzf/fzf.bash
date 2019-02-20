# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mark/.config/nvim/plugged/fzf/bin* ]]; then
  export PATH="$PATH:/home/mark/.config/nvim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mark/.config/nvim/plugged/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/mark/.config/nvim/plugged/fzf/shell/key-bindings.bash"

