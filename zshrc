#!/bin/zsh

# Allow for startup profiling
PROFILE_STARTUP=true
if [[ "$PROFILE_STARTUP" == true ]]; then
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%M%S%.} %N:%i> '
    exec 3>&2 2>$HOME/tmp/startlog.$$
    setopt xtrace prompt_subst
fi

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


# Close Profiling 
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi
