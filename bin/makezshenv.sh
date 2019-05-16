#!/usr/bin/env bash

set -e

# args
srcdir="${HOME}/.dotfiles"
destdir="${HOME}/.dotfiles"
file=''

# ensure destination directory exists
[[ -d $destdir ]] || mkdir -p "${destdir}"

function init_file(){
    local name=$1
    file="${destdir}/${name}"
    [[ -e "${file}" ]] && cp "${file}" "${file}.bak"
    echo '#!/usr/bin/env sh' > "${file}"
    echo $file
}

function write_file(){
    local filter=$1
    local files=( $(command find "$srcdir" -type f -name "$filter" -print) )
    # | while read f ; do
    for f in "${files[@]}"
    do
        echo "adding $f to $file"
        printf '\n# ======================================\n# %s\n# ======================================\n' "${f}" >> $file
        cat "${f}" >> $file
    done
}

file="$(init_file zshenv)"
write_file '*.preenv'
write_file '*.env'
write_file '*.postenv'
ln -sfvr "$destdir/zshenv" "$HOME/.zshenv"

