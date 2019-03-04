
if [[ -x $(which ccat 2> /dev/null) ]];
then
# CCAT
	export PAGER="ccat"
elif [[ -x $(which bat 2> /dev/null) ]];
then
# BAT
	export PAGER="bat"
elif [[ -x $(which most 2> /dev/null) ]];
then
# MOST
    export PAGER="/usr/bin/most -s"
    # todo $HOME/.mostrc
    #     --> setkey "command" "key"
elif [[ -x $(which less 2> /dev/null) ]];
then
# LESS
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
    # export LESS="--ignore-case --LONG-PROMPT --QUIET -Sm --quit-if-one-screen --no-init"
    export LESSHISTFILE='-'
    if [[ -x $(which lesspipe 2> /dev/null) ]];
    then
        LESSOPEN="| lesspipe %s"
        export LESSOPEN
    fi
    export LESS_TERMCAP_mb="$'\e[1;32m'"
    export LESS_TERMCAP_md="$'\e[1;32m'"
    export LESS_TERMCAP_me="$'\e[0m'"
    export LESS_TERMCAP_se="$'\e[0m'"
    export LESS_TERMCAP_so="$'\e[01;33m'"
    export LESS_TERMCAP_ue="$'\e[0m'"
    export LESS_TERMCAP_us="$'\e[1;4;31m'"

    # function man()
    # {
    #   env \
    # export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
    # export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
    # export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
    # export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
    # export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
    # export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
    # export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
    # man "$@"
    # }
fi
# todo:lesskey
# todo:LESSKEY
# todo:LESSCLOSE
# lessopen.sh:
#      #! /bin/sh
#      case "$1" in
#      *.Z) uncompress -c $1  >/tmp/less.$$  2>/dev/null
#           if [ -s /tmp/less.$$ ]; then
#                echo /tmp/less.$$
#           else
#                rm -f /tmp/less.$$
#           fi
#           ;;
#      esac
#
# lessclose.sh:
#      #! /bin/sh
#      rm $2
# LESSOPEN="lessopen.sh %s"
# LESSCLOSE="close.sh %s %s"
# or
# lesspipe.sh:
#      #! /bin/sh
#      case "$1" in
#      *.Z) uncompress -c $1  2>/dev/null
#      *)   exit 1
#           ;;
#      esac
#      exit $?
# LESSOPEN="|lesspipe.sh %s"
# LC_CTYPE


# VimPager
# export PAGER=/usr/local/bin/vimpager
# alias less=$PAGER
# alias zless=$PAGER
