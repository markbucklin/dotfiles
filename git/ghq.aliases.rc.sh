
getrepo()
{
    if [[ -n $1 ]] ; then
        url="$1"
    else
        url="$(xsel -o --clipboard)"
    fi
    ghq get "${url}"
}
alias ggl=getrepo
