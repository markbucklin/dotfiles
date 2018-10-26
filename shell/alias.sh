

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
alias vim=nvim
alias vi=vim
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
alias aguu='sudo apt-get update -y && sudo apt-get upgrade -y'
alias agi='sudo apt-get install -y'



# git
alias gitgraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# tmux
alias t="tmux -2"
alias ta="tmux -2 a"

# Keyboard qwerty with accent
# and "," (leader) on Caps Lock
alias rebind='setxkbmap -option compose:ralt ; xmodmap -e "keycode 66 = comma Escape NoSymbol NoSymbol" ; xmodmap -e "clear lock"'

# Alias post command

alias -g G="| grep"
alias -g L="| less"
alias -g T="| tee -a "
alias -g S="| sed"
alias -g V="| vim - "
alias -g X="| xclip"
alias -g XX="\`xclip -o\`"

alias -s {txt,h,c,hpp,cpp,tex,bib,html,xml}=$EDITOR
# alias npm-ls-bin='ls $HOME/.nvm/versions/node/v10.1.0/bin'
alias npm-ls-bin="ls $(dirname $(which npm))"
eval $(thefuck --alias)
