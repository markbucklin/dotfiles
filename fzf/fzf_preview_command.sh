#!/usr/bin/env bash

for f in "$@"; do
    (! [[ -s "$f" ]] && echo "$f" is empty) ||
        (
            [[ $(file --mime "$f") =~ binary ]] &&
                (
                    echo "$f" is a binary file
                    whatis "$f" || eval "$f --help" 2>/dev/null
                ) &
            [[ -r "$f" ]] &&
                (
                    highlight -O ansi --line-numbers --wrap-no-numbers --replace-tabs=4 --force --line-length=$COLUMNS "$f" || coderay "$f" || rougify "$f" || ccat "$f" || cat "$f"
                ) 2>/dev/null &
        )
done

# --preview='([[ $\"\$(file --mime \"\$(chase {} )\")\" =~ binary ]] && eval \"{} --help\" 2>/dev/null || [[ $\"\$(file --mime \"\$(chase {} )\")\" =~ text ]] && highlight -O ansi -t 2 --force --line-length=$COLUMNS {} 2>/dev/null ) 2>/dev/null'
