# vim:syntax=sh filetype=sh
fzf-preview()
{
    # TODO: handle pdf and other types, maybe use rifle. handle images. check command -V exa, highlight
    # typeset -A filetest prevcmd
    # filetest['dir']='[[ -d {} ]]'
    # filetest['text']='[[ -r {} ]]'
    # filetest['pdf']='[[ "$(print $(mimetype {} | cut -d ':' -f 2))" == "application/pdf" ]]'
    # prevcmd['dir']='exa -T {}'
    # prevcmd['text']='highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null'
    # prevcmd['pdf']='pdftotext -layout -nopgbrk -q "{}" - '

    fzf -m --layout=reverse-list --exact --no-height --border --margin 5%,5%,10%,5% --inline-info --ansi \
	    --preview-window=right:60%:wrap \
	    --preview='([[ -d {} ]] && exa -T {} ) || ( [[ -r {} ]] && [[ $(file -b {}) = *text* ]] && highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null)' \
        | tee "$HOME/.cache/fzf.out" | tee >( xsel -i -b ) 

#head -n500 {} | highlight -O ansi --wrap-no-numbers --force 2>/dev/null
}
# zle -N fzf-preview
bindkey -s "^[t" "fzf-preview\n"


#--expect=ctrl-v,ctrl-x,ctrl-t fzf can return the key that was pressed to stop the selection as the first output -> use to map to commands
