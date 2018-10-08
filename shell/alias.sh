

# Some more basic aliases
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -lAh'
alias l='ls -lah'
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
alias df='df -hT'
alias ocaml='rlwrap ocaml'
alias vi=vim
alias make=pretty_make.py
# Random aliases
alias find_duplicate_names='find . -type f | sed "s#.*/##" | sort | uniq -c | sort -nr | egrep -v "\s+1\s+"'
alias hh='history | grep -i '
alias tododiff='git diff develop | grep -E -A8 "((JPADS)FSW.[0-9]+.*)|(todo.*)" --color=always | cut -c 2- | less -r'
alias sshutdown='sudo shutdown -P 0'
# Find aliases
alias rfind='find -regextype posix-extended -regex'
# Fake pbcopy/paste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
