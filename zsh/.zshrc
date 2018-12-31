# zmodload zsh/zprof

# Follow the link (if any) to find the config folder
if [[ ! -e $DOTDIR ]]; then
    export DOTDIR=../
fi

if [[ -L $HOME/.zshrc ]]; then
	export ZDOTDIR="$(dirname $(readlink -f $HOME/.zshrc))"
else
    export ZDOTDIR=${HOME}/.config/zsh
fi
# todo: also pull entire .zshrc file into dotfiles

# symbolic link to dir in local dotfiles dir:
# ~/.zsh/completions -> ~/$DOTDIR/completions/zsh
fpath=(~/.zsh/completions $fpath)


#  Run auto-load
# autoload zmv
autoload -Uz +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
# zmodload -i zsh/complete
# zmodload -i zsh/complist
# zmodload -i zsh/compctl
# zmodload -i zsh/computil
# zmodload -i zsh/curses
# zmodload -i zsh/datetime
# zmodload -i zsh/files
# zmodload -i zsh/main
# zmodload -i zsh/parameter
# zmodload -i zsh/regex
# zmodload -i zsh/stat
# zmodload -i zsh/system
# zmodload -i zsh/terminfo
# zmodload -i zsh/zle
# zmodload -i zsh/zleparameter
# zmodload -i zsh/zpty
# zmodload -i zsh/zutil



# Source Local Dot-Files (common to all shells)
for file in $DOTDIR/profile.d/*.sh ; do
    source $file
done

# Source Local Dot-Files for ZSH
for file in $ZDOTDIR/*.zsh ; do
    source $file
done

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
export HISTSIZE=30000
export SAVEHIST=400000
export HISTFILE=~/.zsh_history

##############################
# Colors
##############################
# ls command colors
# export LSCOLORS=exfxcxdxbxegedabagacad
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

eval `dircolors -b`
export ZLS_COLORS=$LS_COLORS



##############################
# Aliases
##############################
# Git Aliases
alias gup='git pull --rebase origin $(current_branch)'
compdef gup=git
alias gpush='git push origin $(current_branch)'
compdef gpush=git
alias gsync='git pull --rebase origin $(current_branch) && git push origin $(current_branch)'
compdef gsync=git


##############################
# Zplug
##############################
# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Add a bunch more of your favorite packages!
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "~/.zsh", from:local, use:"<->_*.zsh"

##############################
# Theme
##############################
export ZSH_THEME=punctual
export PUNCTUAL_CURRENT_DIR_COLOUR=yellow;
export PUNCTUAL_SHOW_HOSTNAME=false;
export PUNCTUAL_SHOW_USER="false";
export PUNCTUAL_SHOW_TIMESTAMP="false";
export PUNCTUAL_SHOW_CURRENT_DIR="true";
export PUNCTUAL_SHOW_GIT="false";
export PUNCTUAL_CURRENT_DIR_BOLD="true";
# PUNCTUAL_TIMESTAMP_COLOUR="red";
# PUNCTUAL_USER_COLOUR="green";
# PUNCTUAL_ROOT_USER_COLOUR="yellow";
# PUNCTUAL_HOSTNAME_COLOUR="blue";
# PUNCTUAL_CURRENT_DIR_COLOUR="magenta";
# PUNCTUAL_GIT_COLOUR="cyan";
# PUNCTUAL_TIMESTAMP_BOLD="true";
# PUNCTUAL_USER_BOLD="true";
# PUNCTUAL_ROOT_USER_BOLD="true";
# PUNCTUAL_HOSTNAME_BOLD="true";
# PUNCTUAL_CURRENT_DIR_BOLD="true";
# PUNCTUAL_GIT_BOLD="true";
# PUNCTUAL_TIMESTAMP_FORMAT="%l:%M%P";

# PUNCTUAL_GIT_SYMBOL_UNTRACKED="?";
# PUNCTUAL_GIT_SYMBOL_ADDED="+";
# PUNCTUAL_GIT_SYMBOL_MODIFIED="!";
# PUNCTUAL_GIT_SYMBOL_RENAMED="!";
# PUNCTUAL_GIT_SYMBOL_DELETED="!";
# PUNCTUAL_GIT_SYMBOL_STASHED="*";
# PUNCTUAL_GIT_SYMBOL_UNMERGED="M";
# PUNCTUAL_GIT_SYMBOL_AHEAD="↑";
# PUNCTUAL_GIT_SYMBOL_BEHIND="↓";
# PUNCTUAL_GIT_SYMBOL_DIVERGED="~";
export PUNCTUAL_PROMPT=" $";
zplug "dannynimmo/punctual-zsh-theme", use:punctual.zsh-theme, from:github, as:theme

##############################
# PLUGINS
##############################
zplug "mollifier/zload"
zplug "mafredri/zsh-async"
zplug "supercrabtree/k"
zplug "desyncr/auto-ls"
zplug "joepvd/zsh-hints"
zplug "srijanshetty/zsh-pandoc-completion"
zplug "chipsenkbeil/zsh-notes"
zplug "lukechilds/zsh-nvm"
zplug "hkupty/ssh-agent"
zplug "athityakumar/colorls"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:3
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

export FORGIT_NO_ALIASES
zplug "wfxr/forgit", defer:1
# Define them before sourcing the plugin if you don't use any plugin manager.
forgit_log=glo
forgit_diff=gd
forgit_add=ga
forgit_ignore=gi
forgit_restore=gcf
forgit_clean=gclean
forgit_stash_show=gss

zplug "Schnouki/git-annex-zsh-completion"
zplug "akoenig/gulp.plugin.zsh", defer:2
zplug "ytet5uy4/fzf-widgets"
# zplug "zlsun/solarized-man"
zplug "aramboi/zsh-ipfs", defer:2
zplug "hcgraf/zsh-sudo", from:oh-my-zsh
#, ignore:oh-my-zsh.sh, defer:2
zplug "plugins/colored-man-pages", from:oh-my-zsh

zplug "plugins/git",    from:oh-my-zsh, if:"which git"
zplug "plugins/go",     from:oh-my-zsh, if:"which go"
zplug "plugins/golang", from:oh-my-zsh, if:"which go"
zplug "plugins/nmap",   from:oh-my-zsh, if:"which nmap"
zplug "plugins/sudo",   from:oh-my-zsh, if:"which sudo"
zplug "plugins/tmux",   from:oh-my-zsh, if:"which tmux"


zplug "ogham/exa"
zplug 'knqyf263/pet', as:command, hook-build:'go get -d && go build'
# zplug "zdharma/zsh-diff-so-fancy", as:command, use:bin/git-dsf
zplug "stedolan/jq", as:command, from:gh-r, rename-to:jq
zplug "motemen/ghq", as:command, from:gh-r, rename-to:ghq

# Local plugins
zplug "~/.zsh", from:local


# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi


##############################
# ZSTYLE
##############################
# man zshcontrib
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git #svn cvs

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _correct
zstyle ':completion:*' group-order original corrections
# _approximate

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# list-colors '=(#b) #([0-9]#)*=0=01;31'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true

# menu if nb items > 2
zstyle ':completion:*' menu select=2

# Quote stuff that looks like URLs automatically.
autoload -U url-quote-magic
zstyle ':url-quote-magic:*' url-metas '*?[]^(|)~#='
zstyle ':urlglobber' url-other-schema ftp git gopher http https magnet
zle -N self-insert url-quote-magic

# File/directory completion, for cd command
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found' '(*/)#CVS'
#  and for all commands taking file arguments
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

# Prevent offering a file (process, etc) that's already in the command line.
zstyle ':completion:*:(rm|cp|kill|diff|scp):*' ignore-line yes
# (Use Alt-Comma to do something like "mv abcd.efg abcd.efg.old")

# Completion selection by menu for kill
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Filename suffixes to ignore during completion (except after rm command)
# This doesn't seem to work
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(^rm):*' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
#zstyle ':completion:*:(all-|)files' file-patterns '(*~|\\#*\\#):backup-files' 'core(|.*):core\ files' '*:all-files'

zstyle ':completion:*:*:rmdir:*' file-sort time



# WAS COMMENTED OUT BELOW HERE
# # tag-order 'globbed-files directories' all-files
# zstyle ':completion::complete:*:tar:directories' file-patterns '*~.*(-/)'
#
# # Don't complete backup files as executables
# zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'
#
# # Separate matches into groups
# zstyle ':completion:*:matches' group 'yes'
#
# # With commands like rm, it's annoying if you keep getting offered the same
# # file multiple times. This fixes it. Also good for cp, et cetera..
# zstyle ':completion:*:rm:*' ignore-line yes
# zstyle ':completion:*:cp:*' ignore-line yes
#
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:*:kill:*' list-colors '=%*=01;31'



##############################
# Options
##############################
# setopt                       \
# noall_export           \
# noalways_last_prompt   \
# noalways_to_end        \
# append_history       \
# auto_cd              \
# auto_list            \
# auto_menu            \
# auto_name_dirs       \
# auto_param_keys      \
# auto_param_slash     \
# auto_pushd           \
# auto_remove_slash    \
# noauto_resume          \
# nobad_pattern          \
# nobeep                 \
# brace_ccl            \
# nobsd_echo             \
# cdable_vars          \
# nochase_links          \
# noclobber              \
# complete_aliases     \
# complete_in_word     \
# correct              \
# nocsh_junkie_history   \
# nocsh_junkie_loops     \
# nocsh_junkie_quotes    \
# nocsh_null_glob        \
# equals               \
# extended_glob        \
# extended_history     \
# noflow_control         \
# function_argzero     \
# glob                 \
# noglob_assign          \
# glob_complete        \
# noglob_dots            \
# noglob_subst           \
# hash_cmds            \
# hash_dirs            \
# hash_list_all        \
# hist_allow_clobber   \
# hist_beep            \
# hist_ignore_dups     \
# hist_ignore_space    \
# hist_no_store        \
# hist_verify          \
# nohup                  \
# noignore_braces        \
# noignore_eof           \
# interactive_comments \
# inc_append_history   \
# list_ambiguous       \
# nolist_beep            \
# list_types           \
# long_list_jobs       \
# magic_equal_subst    \
# nomail_warning         \
# nomark_dirs            \
# nomenu_complete        \
# multios              \
# nomatch              \
# notify               \
# nonull_glob            \
# numeric_glob_sort    \
# nooverstrike           \
# path_dirs            \
# posix_builtins       \
# noprint_exit_value     \
# prompt_cr            \
# prompt_subst         \
# pushd_ignore_dups    \
# nopushd_minus          \
# pushd_silent         \
# pushd_to_home        \
# rc_expand_param      \
# norc_quotes            \
# norm_star_silent       \
# nosh_file_expansion    \
# sh_option_letters    \
# short_loops          \
# nosh_word_split        \
# nosingle_line_zle      \
# nosun_keyboard_hack    \
#
# unset                \
# noverbose              \
# zle




##############################
# For individual Zplug loaded modules
##############################
# Source fzf.zsh (fuzzy-finder)
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS="--extended --ansi --multi"

# ------------
# Key bindings
# ------------
source "/home/mark/.fzf/shell/key-bindings.zsh"
if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

# rbenv
if [[ $(command -v rbenv) ]]; then
    eval "$(rbenv init - zsh --no-rehash)"
fi

# npm
if [[ $(command -v npm) ]]; then
    . <(npm completion)
fi

# fasd
if [[ $(command -v fasd) ]]; then
    eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
fi

# grunt-cli
eval "$(grunt --completion=zsh)"




##############################
# OTHER
##############################
# yank
alias yank='yank-cli -- xsel -b'


# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH


##############################
# ZPLUG LOAD
##############################
zplug load

# neofetch

# export PATH="/home/mark/.zplug/repos/paulirish/git-open:/home/mark/.zplug/bin:/home/mark/.nvm/versions/node/v10.1.0/bin:/home/mark/.linuxbrew/bin:/home/mark/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/usr/local/cuda/bin:/home/mark/gems/bin:/usr/local/go/bin:/home/mark/go/bin:/home/mark/.fzf/bin:/home/mark/.vimpkg/bin"
