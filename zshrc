#!/bin/zsh

# zmodload zsh/zprof

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


# Source all files with '.rc.sh' or '.rc.zsh' suffix (e.g. pager.rc.sh)
shrcfiles=( $(ls $DOTDIR/**/*.rc.sh) $(ls $DOTDIR/**/*.rc.zsh))
for F in "$shrcfiles[@]"; do
    . "$F"
done

# Autoload all shell functions from directories in $fpathh
# for func in $^fpath/*(N-.x:t); autoload $func

# zprof
