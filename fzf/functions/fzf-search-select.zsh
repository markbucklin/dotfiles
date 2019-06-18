
#!/usr/bin/env zsh
#

# ag --nobreak --nonumbers --noheading . | fzf --exact
# Find In Files
fif() { rg --files-with-matches --no-messages $1 | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 $1 || rg --ignore-case --pretty --context 10 $1 {}" }



# ftags - search ctags
ftags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-80 | fzf --nth=1,2
  ) && ${EDITOR:-vim} $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

fzf-buku-open() {
    # save newline separated string into an array
    website=( "$(buku -p -f 4 | column -ts$'\t' | fzf --multi)" )

    # open each website
    for i in "${website[@]}"; do
        index="$(echo "$i" | awk '{print $1}')"
        buku -p "$index"
        buku -o "$index"
    done
}
fzf-dmenu() {
	# note: xdg-open has a bug with .desktop files, so we cant use that shit
	selected="$(ls /usr/share/applications | fzf -e)"
	nohup `grep '^Exec' "/usr/share/applications/$selected" | tail -1 | sed 's/^Exec=//' | sed 's/%.//'` >/dev/null 2>&1&
}

# hotkey to run the function (Ctrl+O)
# bindkey -s '^O' "fzf-dmenu\n"
fzf-locate() { xdg-open "$(locate "*" | fzf -e)" ;}
# vim:syntax=sh filetype=sh
fzf-preview() {
    # TODO: handle pdf and other types, maybe use rifle. handle images. check command -V exa, highlight
    # typeset -A filetest prevcmd
    # filetest['dir']='[[ -d {} ]]'
    # filetest['text']='[[ -r {} ]]'
    # filetest['pdf']='[[ "$(print $(mimetype {} | cut -d ':' -f 2))" == "application/pdf" ]]'
    # prevcmd['dir']='exa -T {}'
    # prevcmd['text']='highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null'
    # prevcmd['pdf']='pdftotext -layout -nopgbrk -q "{}" - '

    fzf -m --layout=reverse-list --exact --no-height --border --margin 5%,5%,10%,5% --inline-info --ansi \
        --preview-window=down:60%:wrap \
        --preview='([[ -d {} ]] && exa -T {} ) || ( [[ -r {} ]] && [[ $(file -b {}) = *text* ]] && highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null)' |
        tee "/tmp/fzf.out" | tee >(xsel -i -b)

    #head -n500 {} | highlight -O ansi --wrap-no-numbers --force 2>/dev/null
}
# zle -N fzf-preview
# bindkey -s "^[t" "fzf-preview"
# zle -N _fzf-preview fzf-preview
# bindkey "^[t" "fzf-preview"

#--expect=ctrl-v,ctrl-x,ctrl-t fzf can return the key that was pressed to stop the selection as the first output -> use to map to commands
