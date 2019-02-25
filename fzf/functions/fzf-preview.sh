function fzf-preview()
{
    # TODO: handle pdf and other types, maybe use rifle. handle images. check command -V exa, highlight
    # typeset -A filetest prevcmd
    # filetest['dir']='[[ -d {} ]]'
    # filetest['text']='[[ -r {} ]]'
    # filetest['pdf']='[[ "$(print $(mimetype {} | cut -d ':' -f 2))" == "application/pdf" ]]'
    # prevcmd['dir']='exa -T {}'
    # prevcmd['text']='highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null'
    # prevcmd['pdf']='pdftotext -layout -nopgbrk -q "{}" - '
    
    fzf -m --expect=ctrl-v,ctrl-x,ctrl-t --no-height --preview='([[ -d {} ]] && exa -T {} ) || ( [[ -r {} ]] && [[ $(file -b {}) = *text* ]] && highlight -O ansi --wrap-no-numbers --force -i {} 2>/dev/null)' | tee ~/.cache/fzf.out | tee >(xsel -i -p)
    
}
zle -N fzf-preview
bindkey "^[t" fzf-preview
