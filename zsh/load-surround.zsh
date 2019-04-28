# https://sourceforge.net/p/zsh/code/ci/master/tree/Functions/Zle/surround
if [[ -e surround ]]; then
    wget -O ./surround https://sourceforge.net/p/zsh/code/ci/master/tree/Functions/Zle/surround
fi

autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround
