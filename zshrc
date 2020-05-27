#!/bin/zsh

# Allow for startup profiling
# zmodload zsh/zprof

bindkey -v

# export DOTDIR=$(dirname $(realpath $0))
export DOTDIR="$HOME/.dotfiles"
ZSH=${ZSH:-"$HOME/.config/zsh"}


# Call "slim" zsh script
source "$DOTDIR/zsh/init.zsh"

# Add Plugin function paths to fpath
# plugindirs=($ZSH/plugins/*(/))
# ls $plugindirs &>/dev/null && fpath+=($plugindirs)
# functiondirs=($ZSH/functions{,/*(/)})
# ls $functiondirs &>/dev/null && fpath+=($functiondirs)

# Source all files with '.rc.sh' or '.rc.zsh' suffix (e.g. pager.rc.sh)
shrcfiles=($(command ls $DOTDIR/**/*.rc.sh) $(command ls $DOTDIR/**/*.rc.zsh))
for F in "${shrcfiles[@]}"; do
    source "$F"
done

# Source all files in home/functions dir
shfunctiondir="$HOME/functions"
if [[ -d $shfunctiondir ]]; then
    shfiles=($(find "$shfunctiondir/" -type f -readable))
    for F in "${shfiles[@]}"; do
        source "$F"
    done
fi

# hook direnv into shell
eval "$(direnv hook zsh)"



source $DOTDIR/zsh/keys.vi.zsh

WORDCHARS=${WORDCHARS//[&\/\=;$]}

autoload -Uz predict-on
zle -N predict-on
zle -N predict-off
bindkey '^X^Z' predict-on
bindkey '^Z' predict-off

# Load Zsh Editor
autoload -Uz zed

#Dedicated Completion Key
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
# expand-or-complete
# bindkey '^I' $fzf_default_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
