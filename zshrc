#!/bin/zsh

# Allow for startup profiling
# zmodload zsh/zprof

bindkey -v

# export DOTDIR=$(dirname $(realpath $0))
export DOTDIR="$HOME/.dotfiles"

# Call "slim" zsh script
source "$DOTDIR/zsh/init.zsh"


# Protect keybindings with capture function
# BINDKEY_CAPTURED_UNSET=()
# export BINDKEY_CAPTURED_UNSET
# bindkey(){
#     BINDKEY_CAPTURED_UNSET+=( "$(print -r "bindkey $@")" )
# }

# Source all files with '.rc.sh' or '.rc.zsh' suffix (e.g. pager.rc.sh)
shrcfiles=( $(command ls $DOTDIR/**/*.rc.sh) $(command ls $DOTDIR/**/*.rc.zsh))
for F in "${shrcfiles[@]}"; do
    source "$F"
done

shfunctiondir="$HOME/functions"
if [[ -d $shfunctiondir ]]; then
    shfiles=( $(find "$shfunctiondir/" -type f -readable) )
    for F in "${shfiles[@]}"; do
        source "$F"
    done
fi

# hook direnv into shell
eval "$(direnv hook zsh)"


# Reset keybinding protection
# unfunction bindkey


# bindkey '^I' $fzf_default_completion

 #Dedicated Completion Key
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
# expand-or-complete

source $DOTDIR/zsh/keys.vi.zsh

# print result of profile
# zprof &
