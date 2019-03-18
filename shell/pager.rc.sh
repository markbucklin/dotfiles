
USE_LESS=true
if [[ $USE_LESS ]];
then
    # LESS
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines --tabs=4 --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --window=-8 --HILITE-UNREAD --status-column"
    # export LESS="--ignore-case --LONG-PROMPT --QUIET -Sm --quit-if-one-screen --no-init"
    export LESSHISTFILE='-'
    # lesspipe exports LESSOPEN and LESSCLOSE
    eval $(lesspipe)
    # LESS_TERMCAP gets system colors
    export LESS_TERMCAP_mb=$(tput bold; tput setaf 1) # green
    export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
    export LESS_TERMCAP_me=$(tput sgr0)
    export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
    export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
    export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
    export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
    export LESS_TERMCAP_mr=$(tput rev)
    export LESS_TERMCAP_mh=$(tput dim)
    export LESS_TERMCAP_ZN=$(tput ssubm)
    export LESS_TERMCAP_ZV=$(tput rsubm)
    export LESS_TERMCAP_ZO=$(tput ssupm)
    export LESS_TERMCAP_ZW=$(tput rsupm)
    export LESS_TERMCAP_mb=$'\E[01;31m'
    export LESS_TERMCAP_md=$'\E[01;31m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[01;44;33m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[01;32m'
    if type pygmentize >/dev/null 2>&1; then
        export LESSCOLORIZER='pygmentize'
    fi

else
    # NOT LESS
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
fi
fi

# VimPager
# export PAGER=/usr/local/bin/vimpager
export MANPAGER=less
# alias less=$PAGER
# alias zless=$PAGER
