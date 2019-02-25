
#!/bin/bash

# export DOTDIR=$(dirname $(realpath $0))
export DOTDIR="$HOME/.dotfiles"

# functions for adding to path
pathadd() {
    newelement=${1%/}
    if [ -d "$1" ] && ! echo $PATH | grep -E -q "(^|:)$newelement($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH="$PATH:$newelement"
        else
            PATH="$newelement:$PATH"
        fi
    fi
}

pathrm() {
    PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}

# # Add dirs in DOTDIR to fpath
# for D in $(ls -d $DOTDIR/*); do
#     if [[ -d $D ]]; then
#         fpath=( $D $fpath )
#     fi
# done

# Call "slim" zsh script
# . "$DOTDIR/zsh/init.zsh"


# Source all files with '.rc.sh' or '.rc.zsh' suffix (e.g. pager.rc.sh)
shrcfiles=( $(ls $DOTDIR/**/*.rc.sh) $(ls $DOTDIR/**/*.bashrc))
for F in "$shrcfiles[@]"; do
    . "$F"
done

