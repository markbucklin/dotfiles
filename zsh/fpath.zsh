#!/bin/zsh
#add each topic folder to fpath so that they can add functions and completion scripts

# note: doing this slows down startup time immensely (150ms -> 1000ms)



zfuncdir="$HOME/.zfunctions"
[[ -d "$zfuncdir" ]] || mkdir -p "$zfuncdir"
fpath=( "$zfuncdir" $fpath )
