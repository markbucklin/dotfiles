#!/usr/bin/env bash

set -Eeuo pipefail
trap "echo ERR trap fired!" ERR

for f in "$@"; do
    # print INPUT

    printf '\e[3m\e[38;5;9m%s\e[m\n' "${f}"
    if [[ -L "$f" ]];
    then
        printf "\t==> \e[1;34m%s\e[0m\n" "$(chase "$f")"
    fi
    if ! [[ -s "$f" ]];
    then
        echo "$f" is empty
    else
        # Check file MIME type
        mimestr="$(file --mime --brief --dereference "$f")"

        # Check if file is BINARY
        echo "$mimestr"
        [[ $mimestr =~ binary ]] && echo "$f" is a binary file
        echo '_____________________'

        # Check if file is EXECUTABLE
        if  [ -x "$f" ]
        then
            # if EXECUTABLE: Get "whatis" and  "--help" info
            (
                whatis_str=$(whatis $(basename "$f") 2>/dev/null)
                if [[ $? ]]
                then
                    ccat --color=always ${whatis_str}
                    echo '---------------------'
                fi
                help_str=$(eval "$f --help" 2>/dev/null || eval "$f -h" 2>/dev/null)
                if [[ $? ]] ;
                then
                    ccat --color=always ${help_str}
                    echo '====================='
                    exit $?
                fi
            ) &
        fi

        # Exit if NOT-READABLE:
        if ! [[ -r "$f" ]] ; then exit 3; fi

        # if TEXT print highlighted
        if  [[ $mimestr =~ text ]]
        then
            (
                highlight -O ansi --line-numbers --wrap-no-numbers \
                --replace-tabs=4 --force --line-length=$COLUMNS "$f" \
                2>/dev/null || coderay "$f" || rougify highlight "$f" || ccat --color=always "$f" \
                --color=always || cat "$f"
            ) &
            exit $?
        fi

        # PDF
        if  [[ $mimestr =~ pdf ]]
        then
            # pdftotext -nopgbrk -q -eol unix "$f" - | ccat --color=always
            pdfinfo "$f" 2>/dev/null | ccat --color=always -
            exit $?
        fi

# todo: image
# todo: video
# todo: archive
# todo: directory

    fi
done

# exit 0

# -o [ -x ${commands[$f]} ] ;

# --preview='([[ $\"\$(fili --mime \"\$(chase {} )\")\" =~ binary ]] && eval \"{} --help\" 2>/dev/null || [[ $\"\$(file --mime \"\$(chase {} )\")\" =~ text ]] && highlight -O ansi -t 2 --force --line-length=$COLUMNS {} 2>/dev/null ) 2>/dev/null'
