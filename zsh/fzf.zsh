# ---------
# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mark/.fzf/bin* ]]; then
  export PATH="$PATH:/home/mark/.fzf/bin"
fi

# ---------------
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mark/.fzf/shell/completion.zsh" 2> /dev/null

# ---------
# Completion
# ---------
export FZF_COMPLETION_OPTS='+c -x'

# ---------
# Default
# ---------
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--extended --ansi --tabstop=4 --margin=1,4,2,1 --no-height"
# export FZF_DEFAULT_OPTS='--height=50% --reverse --multi --preview="[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'

# --------------------------
# CTRL-R: History Search
# --------------------------
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:hidden:wrap"

# --------------------------
# ALT-C: Change Directory
# --------------------------
if $(command -v blsd > /dev/null) ; then
  # Breadth first list directories
  # bash <(curl -fL https://raw.githubusercontent.com/junegunn/blsd/master/install)
  export FZF_ALT_C_COMMAND='blsd'
else
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

export FZF_ALT_C_COMMAND='print -D -l "${PWD}/.." ; blsd  2>/dev/null'
export FZF_ALT_C_OPTS="--preview 'tree -C {}  2> /dev/null | head -300' --preview-window right:60% --reverse --bind=ctrl-space:replace-query"

# --------------------------
# CTRL-T: File Search
# --------------------------
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} || cat {} || tree -C {}) 2> /dev/null | head -$LINES' --reverse --preview-window down:wrap"





# ---------------
# Other Functions
# ---------------
fzf-down() {
  # fzf --height 50% "$@" --border
  fzf
}
# Figlet font selector => copy to clipboard
fgl() (
  [ $# -eq 0 ] && return
  cd /usr/local/Cellar/figlet/*/share/figlet/fonts
  local font=$(ls *.flf | sort | fzf --no-multi --reverse --preview "figlet -f {} $@") &&
  figlet -f "$font" "$@" | pbcopy
)

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") | sed '/^$/d' |
    fzf-down --no-hscroll --reverse --ansi +m -d "\t" -n 2 -q "$*") || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# ftags - search ctags
ftags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-$COLUMNS | fzf --nth=2 --tiebreak=begin
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key n
  IFS=$'\n' read -d '' -rA out < <(fzf-tmux -m --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=${out[1]}
  n=2
  file=${out[$n]}
  while [ -n "$file" ]; do
    if [ "$key" = ctrl-o ]; then
      open "$file"
    else
      ${EDITOR:-vim} "$file"
    fi
    n=$n+1
    file=${out[$n]}
  done
}



# GIT heart FZF
# -------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

git-forward-diff-maybe() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

git-backward-diff-maybe() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -200' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

git-tag-show() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -200'
}

git-log-header() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -200' |
  grep -o "[a-f0-9]\{7,\}"
}

git-remote-log() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

# c - browse chrome history
chrome-history() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}
zle -N chrome-history

# function cd() {
#     if [[ "$#" != 0 ]]; then
#         builtin cd "$@";
#         return
#     fi
#     while true; do
#         local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
#         local dir="$(printf '%s\n' "${lsd[@]}" |
#             fzf --reverse --preview '
#                 __cd_nxt="$(echo {})";
#                 __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
#                 echo $__cd_path;
#                 echo;
#                 ls -p --color=always "${__cd_path}";
#         ')"
#         [[ ${#dir} != 0 ]] || return 0
#         builtin cd "$dir" &> /dev/null
#     done
# }


# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
z() {
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
alias j=z


# ALT-I - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
  local selected
  if selected=$(locate / | fzf -q "$LBUFFER"); then
    LBUFFER=$selected
  fi
  zle redisplay
}
zle     -N    fzf-locate-widget
bindkey '\ei' fzf-locate-widget







# export FZF_CTRL_T_OPTS="--select-1 --exit-0"

# export FZF_DEFAULT_COMMAND='
#   (git ls-tree -r --name-only HEAD ||
#    find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
#       sed s/^..//) 2> /dev/null'


# export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file ||  (highlight -O ansi -l {} ||  coderay {} || rougify {} || cat {}) 2> /dev/null | head -$LINES' --preview-window down:1"
# --preview='head -$LINES {}' --bind='alt-p:toggle-preview'
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
 # --bind '?:toggle-preview'

 # export FZF_DEFAULT_OPTS="--extended --ansi --multi"
 # export FZF_DEFAULT_OPTS='--no-reverse --inline-info --extended --no-height'
