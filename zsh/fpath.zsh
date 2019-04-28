#!/bin/zsh
#add each topic folder to fpath so that they can add functions and completion scripts

# note: doing this slows down startup time immensely (150ms -> 1000ms)

zuserroot=$(dirname "$0")

zfuncdir="$HOME/.zfunctions"
[[ -d "$zfuncdir" ]] || mkdir -p "$zfuncdir"
# ~/.zfunctions may link to ~/.config/zsh/functions



zdirs=( $(find "$(realpath "$zfuncdir")" -type d) "$zuserroot" )
for d in "$zdirs[@]"; do
    fpath=( "$d" $fpath )
done
