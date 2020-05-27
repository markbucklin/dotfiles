# enable color support of ls and also add handy aliases
if ls --color -d . >/dev/null 2>&1; then
    # is GNU ls
    if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors ~/.dircolors 2>/dev/null)" || eval "$(dircolors -b | tee ~/.dircolors)"
fi
# remember COLUMNS for subprocesses
export COLUMNS

# Alias for colored Grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
# Remove any alias to ls
# unalias ls &>/dev/null && echo "ls is being unaliased and redefined as a function in $0"


# Override builtin ls command with ls function
# ls() {
#     command ls -F -h --color=always -v --author --time-style=long-iso -C "$@" | less -R -X -F
# }

# Make commands for printing directories
ls_directories() {
    ls -p -1 "$@" | grep '[[:graph:]]*/$' | sed 's/\///g'
}
alias 'ls/'='ls_directories'


# Make commands for printing hidden directories
ls_hidden() {
    ls -A -1 "$@" | grep -h '^\.[[:graph:]]*$'
}
alias 'ls.'='ls_hidden'


# Make Aliases for other ls functionality
alias ll='ls -l'
alias l='ls -l -a'
alias la='ls -A'
alias lal='ls -Alh --group-directories-first'
alias lla='ls -lA'
alias lss='ls -S'
alias lsq='ls -Q'
alias lstree="/bin/ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
# function _lsd() {ls -d ${1:-$PWD}/*/}
# alias lsd=_lsd
# function _lsdh() {ls -d ${1:-$PWD}/*/}
# alias lsdh=_lsdh
# ls -d1 $HOME/*/

fi
