
# Set less options
if [[ -x $(which less 2> /dev/null) ]]; then
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
    export LESSHISTFILE='-'
    if [[ -x $(which lesspipe 2> /dev/null) ]]; then
    	LESSOPEN="| lesspipe %s"
        # todo
        # "highlight -O ansi -l %s"
        # '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file ||  (highlight -O ansi -l {} ||  coderay {} || rougify {} || cat {}) 2> /dev/null | head
	     export LESSOPEN
    fi
    export LESS_TERMCAP_mb="$'\e[1;32m'"
    export LESS_TERMCAP_md="$'\e[1;32m'"
    export LESS_TERMCAP_me="$'\e[0m'"
    export LESS_TERMCAP_se="$'\e[0m'"
    export LESS_TERMCAP_so="$'\e[01;33m'"
    export LESS_TERMCAP_ue="$'\e[0m'"
    export LESS_TERMCAP_us="$'\e[1;4;31m'"
fi
