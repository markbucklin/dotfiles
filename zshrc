#!/bin/zsh

# Allow for startup profiling
#zmodload zsh/zprof

# Cache default keymaps
cachedir="$HOME/.cache/zsh"
keymapcachedir="$cachedir/keymap"
mkdir -p "$keymapcachedir"/{initial,current}
kmapnames=($(bindkey -l))
for m in "$kmapnames[@]"; do
    bindkey -M "$m" > "$keymapcachedir/initial/$m.txt"
done

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


# hook direnv into shell
eval "$(direnv hook zsh)"


# Cache current keymaps as they are at end of zshrc
kmapnames=($(bindkey -l))
for m in "$kmapnames[@]"; do
    bindkey -M "$m" > "$keymapcachedir/current/$m.txt"
done

# print result of profile
# zprof &
