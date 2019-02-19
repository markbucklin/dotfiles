#!/usr/bin/env bash

# args
srcdir="${HOME}/.dotfiles/src"
destdir="${HOME}/.dotfiles/build"
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
    find $srcdir -type f -iname $filter -print \
    | while read f ; do
        if [[ -e $f ]]; then
            echo "adding $f to $file"
            printf '\n# ======================================\n# %s\n# ======================================\n' "${f}" >> $file
            cat "${f}" >> $file
        fi
    done
}

file=$(init_file zshenv)
write_file '*.preenv'
write_file '*.env'
write_file '*.postenv'
ln -sf "$destdir/zshenv" "$HOME/.zshenv"

