# todo: check if used programs are actually installed

# Some more basic aliases
alias ls='ls --color=auto'
alias l='ls -h '
alias lsv='ls -1'
alias la='ls -Al'
alias lsl='ls -lh'
alias 'ls/'='ls -p'
alias lss='ls -S'
alias lsq='ls -Q'
alias lsd="ls --group-directories-first" # show directories
alias ltree="/bin/ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
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
alias hh='history | grep -i '
alias sshutdown='sudo shutdown -P 0'
# Find aliases
alias rfind='find -regextype posix-extended -regex'
# Fake pbcopy/paste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias aguu='sudo apt-get update -y && sudo apt-get upgrade -y'
alias agi='sudo apt-get install -y'
alias aguui='aguu && agi'

alias wordy='wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias count-words-in-files=wordy
alias filecount='find . -type f | wc -l' # number of files (not directories)
alias count-files-in-dirs=filecount

# git
alias gitgraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# tmux
alias t="tmux -2"
alias ta="tmux -2 a"

# Keyboard qwerty with accent
# and "," (leader) on Caps Lock
# causes keyboard issues (maps 'super' key to 'ctrl' ??)
# alias rebind='setxkbmap -option compose:ralt ; xmodmap -e "keycode 66 = comma Escape NoSymbol NoSymbol" ; xmodmap -e "clear lock"'

# Alias post command

alias -g G="| grep"
alias -g L="| less"
alias -g T="| tee -a "
alias -g S="| sed"
alias -g V="| vim - "
alias -g X="| xclip"
alias -g XX="\`xclip -o\`"

alias -s {txt,h,c,hpp,cpp,tex,bib,html,xml}=$EDITOR


alias npm-ls-bin="eval 'ls $(npm bin -g)'"
eval $(thefuck --alias)
alias apt-search='apt-cache search -n '
alias lx='exa -F '
# alias bk='cd /media/server/www/.nextcloud/docker'
alias duc-index-root='sudo duc index -x -p -b -d /var/.duc.db /'
alias find-executables-below-pwd="find ./ \( -type f -or -type l \) -wholename '**/bin/*' -perm /a+x"
alias duc-gui-show-root='duc gui -d /var/.duc.db --dark --gradient --ring-gap=4 --levels=3 --fuzz=1 /'
alias apmi='apm install '

# tilix
alias vsplit='tilix -a session-add-right'
alias hsplit='tilix -a session-add-down'
alias vsplitleft='tilix -a session-add-left'
alias vsplitup='tilix -a session-add-up'

# buku
#alias b='buku --suggest'

# cat
[ -e ~/.nnncp ] && alias ncp='cat ~/.nnncp'
[ -x ccat ] && alias cat='ccat'

# fzf
alias fzf-select-directories-from-current='ls -d */ | fzf -m'
alias copy_last_command_to_clipboard='fc -nlr | head -n 1 | tee >(xclip -i -selection primary) | xclip -i -selection clipboard'
alias copy_last_command_to_primary='fc -nlr | head -n 1 | tee >(xclip -i -selection primary) | xclip -i -selection primary'
