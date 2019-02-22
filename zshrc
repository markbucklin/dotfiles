#!/bin/zsh

# export DOTDIR=$(dirname $(realpath $0))
export DOTDIR="$HOME/.dotfiles"

# Add dirs in DOTDIR to fpath
for D in $(ls -d $DOTDIR/*); do
    if [[ -d $D ]]; then
        fpath=( $D $fpath )
    fi
done

# Call "slim" zsh script
. "$DOTDIR/zsh/init.zsh"


# Source all files with '.shrc' or '.zshrc' suffix (e.g. pager.shrc)
shrcfiles=( $(ls $DOTDIR/**/*.shrc) $(ls $DOTDIR/**/*.zshrc))
for F in "$shrcfiles[@]"; do
    . "$F"
done

