# ls
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh --group-directories-first'
alias l='ls -1'
alias la='ls -A'
alias lal='ls -Alh --group-directories-first'
alias lla='ls -lA'
alias 'ls/'='ls -p'
alias lss='ls -S'
alias lsq='ls -Q'
alias lstree="/bin/ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
# function _lsd() {ls -d ${1:-$PWD}/*/}
# alias lsd=_lsd
# function _lsdh() {ls -d ${1:-$PWD}/*/}
# alias lsdh=_lsdh
# ls -d1 $HOME/*/

# safer
alias mv="mv -i"
alias cp="cp -i"

# carry environment with sudo
alias sudo="sudo -E"

# which informative
alias wh='which -aS'



alias du_dirs='du -sckx * | sort -nr' #directories sorted by size
alias du_files='du -kx | sort -nr | less' #files sorted by size
alias md='mkdir -p'
alias rd='rmdir'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias df_human='df -hT'
alias ocaml='rlwrap ocaml'
# Random aliases
alias find_duplicate_names='find . -type f 2>/dev/null | sed "s#.*/##" | sort | uniq -c | sort -nr | egrep -v "\s+1\s+"'
alias sshutdown='sudo shutdown -P 0'
# Find aliases
alias rfind='find -regextype posix-extended -regex'
# Fake pbcopy/paste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# apt package manager for debian
alias aguu='sudo apt-get update -y && sudo apt-get upgrade -y'
alias agi='sudo apt-get install -y'
alias aguui='aguu && agi'

alias wordcountfiles='wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias filecountdirs='find . -type f | wc -l' # number of files (not directories)

# git
alias gitgraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# copy last to clipboard (primary or system clipboard)
alias copylastcmd='fc -nlr | head -n 1 | tee >(xclip -i -selection primary) | xclip -i -selection clipboard'

# server directory over port 8000 with python
alias serve="python3 -m http.server"
