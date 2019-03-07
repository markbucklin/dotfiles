#!/bin/zsh


# export DOTDIR=$(dirname $(realpath $0))
export DOTDIR="$HOME/.dotfiles"

# Call "slim" zsh script
source "$DOTDIR/zsh/init.zsh"


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


# zshfunctiondir="$HOME/.zfunctions"
# if [[ -d "$zshfunctiondir/autoload" ]]; then ;; fi
