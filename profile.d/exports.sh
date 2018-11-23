# Currently this path is appended to dynamically when picking a ruby version
# zshenv has already started PATH with rbenv so append only here
#export PATH=$PATH:/usr/local/bin:/usr/local/sbin:$HOME/bin
#export PATH=$PATH:/usr/local/sbin:$HOME/bin:/usr/local/go/bin



# set PATH so it includes user's private bin if it exists
if [[ -d "$HOME/bin" ]] ; then
    PATH="$HOME/bin:$PATH"
fi




# Setup terminal, and turn on colors
#export TERM=xterm-256color
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

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
fi

# Set default editor
if [[ -x $(which sublime 2> /dev/null) ]]; then
    export EDITOR="atom"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

# Set LC_ALL="UTF8"
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Virtual Environment Stuff
export PROJECT_HOME=$HOME/projects
#if [[ $HAS_VIRTUALENV -eq 1 ]]; then
#    source /usr/local/bin/virtualenvwrapper.sh
#fi

#export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export WORDCHARS='*?.[]~&;!#$%^(){}<>'


# remove duplicate entries
typeset -U PATH
export VDPAU_DRIVER=nvidia
export LIBVA_DRIVER_NAME=vdpau
export PATH=$PATH:$HOME/gems/bin
export GEM_HOME=$HOME/gems
