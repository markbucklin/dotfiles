#!/bin/zsh

# Allow for startup profiling
#zmodload zsh/zprof

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
shrcfiles=( $(ls $DOTDIR/**/*.rc.sh) $(ls $DOTDIR/**/*.rc.zsh))
for F in "$shrcfiles[@]"; do
    source "$F"
done

shfunctiondir="$HOME/functions"
if [[ -d $shfunctiondir ]]; then
    shfiles=( $(find "$shfunctiondir/" -type f -readable) )
    for F in "$shfiles[@]"; do
        source "$F"
    done
fi

# hook direnv into shell
eval "$(direnv hook zsh)"


# Reset keybinding protection
# unfunction bindkey

# Bind Common FZF Widget Keybindings
export FZF_COMPLETION_TRIGGER=''
for m in viins vicmd
do
    bindkey -M "$m" '^R' fzf-history-widget
    bindkey -M "$m" '^T' fzf-file-widget
    bindkey -M "$m" '^[c' fzf-cd-widget
    bindkey -M "$m" '^[i' fzf-locate-widget
    bindkey -M "$m" '^I' expand-or-complete
    bindkey -M "$m" '^@^@' fzf-completion
    # bindkey -M "$m" '^I' fzf-completion
done
bindkey -M menuselect '^j' 'vi-down-line-or-history'
bindkey -M menuselect '^k' 'vi-up-line-or-history'

# bindkey '^I' $fzf_default_completion

 #Dedicated Completion Key
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
# expand-or-complete

source $DOTDIR/zsh/keys.vi.zsh

# print result of profile
# zprof &
