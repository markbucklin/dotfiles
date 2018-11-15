# Follow the link (if any) to find the config folder
if [ -L $HOME/.zshrc ]; then
   export ZDOTDIR=$(dirname `readlink -f $HOME/.zshrc`)
else
   export ZDOTDIR=${HOME}/.config/zsh
fi





#  Run auto-load
autoload zmv
autoload -Uz compinit && compinit
zmodload -i zsh/complete
zmodload -i zsh/complist
# zmodload -i zsh/compctl
# zmodload -i zsh/computil
zmodload -i zsh/curses
# zmodload -i zsh/datetime
# zmodload -i zsh/files
# zmodload -i zsh/main
zmodload -i zsh/parameter
# zmodload -i zsh/regex
# zmodload -i zsh/stat
# zmodload -i zsh/system
# zmodload -i zsh/terminfo
zmodload -i zsh/zle
zmodload -i zsh/zleparameter
# zmodload -i zsh/zpty
# zmodload -i zsh/zutil



# Source Local Dot-Files (common to all shells)
for file in $DOTDIR/shell/*.sh ; do
	source $file
done

# Source Local Dot-Files for ZSH
for file in $ZDOTDIR/*.zsh ; do
	source $file
done

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
export HISTSIZE=10000
export SAVEHIST=100000
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



zplug "Schnouki/git-annex-zsh-completion"
zplug "akoenig/gulp.plugin.zsh", defer:2
zplug "ytet5uy4/fzf-widgets"
zplug "wfxr/forgit", defer:1
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
# Add path to my completions
fpath=(~/.zsh/completion.local $fpath)

# man zshcontrib
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git #svn cvs

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# list of completers to use
# zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
# zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# insert all expansions for expand completer
# zstyle ':completion:*:expand:*' tag-order all-expansions

# match uppercase from lowercase
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

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

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true

# menu if nb items > 2
zstyle ':completion:*' menu select=2



# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose false
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#
# # Expansion options
# zstyle ':completion:*' completer _expand _complete _correct _prefix _approximate
# zstyle ':completion::prefix-1:*' completer _complete
# zstyle ':completion:incremental:*' completer _complete _correct
# zstyle ':completion:predict:*' completer _complete
#
# # Completion caching
# zstyle ':completion::complete:*' use-cache 1
# zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
#
# # Use menu selection
# zstyle ':completion:*' menu select=2
#
# # Expand partial paths
# zstyle ':completion:*' expand 'yes'
# zstyle ':completion:*' squeeze-slashes 'yes'
#
# # Include non-hidden directories in globbed file completions
# # for certain commands
# zstyle ':completion::complete:*' '\'
#
# # Use menuselection for pid completion
# zstyle ':completion:*:kill:*' force-list always
# zstyle ':completion:*:*:kill:*' menu yes select
#
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
# # Describe each match group.
# zstyle ':completion:*:descriptions' format "%B---- %d%b"
#
# # Messages/warnings format
# zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
# zstyle ':completion:*:warnings' format '%B%U---- no match for: %d%u%b'
#
# # Describe options in full
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:options' auto-description '%d'
#
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:*:kill:*' list-colors '=%*=01;31'



##############################
# Options
##############################
setopt                       \
     NO_all_export           \
     NO_always_last_prompt   \
        always_to_end        \
        append_history       \
     	auto_cd              \
        auto_list            \
        auto_menu            \
        auto_name_dirs       \
        auto_param_keys      \
        auto_param_slash     \
     NO_auto_pushd           \
        auto_remove_slash    \
     NO_auto_resume          \
        bad_pattern          \
     NO_beep                 \
        brace_ccl            \
     NO_bsd_echo             \
        cdable_vars          \
     NO_chase_links          \
        clobber              \
        complete_aliases     \
        complete_in_word     \
        correct              \
     NO_csh_junkie_history   \
     NO_csh_junkie_loops     \
     NO_csh_junkie_quotes    \
     NO_csh_null_glob        \
        equals               \
        extended_glob        \
        extended_history     \
	 NO_flow_control         \
        function_argzero     \
        glob                 \
     NO_glob_assign          \
        glob_complete        \
     NO_glob_dots            \
     NO_glob_subst           \
        hash_cmds            \
        hash_dirs            \
        hash_list_all        \
        hist_allow_clobber   \
        hist_beep            \
        hist_ignore_dups     \
        hist_ignore_space    \
        hist_no_store        \
        hist_verify          \
     NO_hup                  \
     NO_ignore_braces        \
     NO_ignore_eof           \
        interactive_comments \
      	inc_append_history   \
        list_ambiguous       \
     NO_list_beep            \
        list_types           \
        long_list_jobs       \
        magic_equal_subst    \
     NO_mail_warning         \
     NO_mark_dirs            \
     NO_menu_complete        \
        multios              \
        nomatch              \
        notify               \
     NO_null_glob            \
        numeric_glob_sort    \
     NO_overstrike           \
        path_dirs            \
        posix_builtins       \
     NO_print_exit_value     \
        prompt_cr            \
        prompt_subst         \
        pushd_ignore_dups    \
     NO_pushd_minus          \
        pushd_silent         \
        pushd_to_home        \
        rc_expand_param      \
     NO_rc_quotes            \
     NO_rm_star_silent       \
     NO_sh_file_expansion    \
        sh_option_letters    \
        short_loops          \
     NO_sh_word_split        \
     NO_single_line_zle      \
     NO_sun_keyboard_hack    \
        unset                \
     NO_verbose              \
        zle




##############################
# For individual Zplug loaded modules
##############################
# Source fzf.zsh (fuzzy-finder)
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS="--extended --ansi --multi"

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

# # fasd
# if [[ $(command -v fasd) ]]; then
#     eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
# fi

# hub
fpath=(~/.zsh/completions $fpath)

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

neofetch



# zplug "mollifier/anyframe"
# zplug "peterhurford/up.zsh"
# zplug "vifon/deer", use:deer
# zplug "psprint/zsh-select", defer:3
# zplug qoomon/zjump
# zplug "plugins/golang", from:oh-my-zsh, ignore:oh-my-zsh.sh, defer:2
# zplug 'plugins/git', from:oh-my-zsh
# zplug "trapd00r/zsh-syntax-highlighting-filetypes"
# zplug "zpm-zsh/dircolors-material"
# zplug "zpm-zsh/ls"
# zplug "zpm-zsh/colors"
# zplug "zpm-zsh/linuxbrew"
# zplug "bbenne10/goenv"
# zplug "momo-lab/zsh-abbrev-alias"
# zplug "peterhurford/up.zsh"
# zplug "zakariaGatter/MarkEdit"
# zplug "b4b4r07/enhancd", use:init.sh
# zplug "wfxr/forgit", defer:1
# zplug "chipsenkbeil/zsh-notes"
# zplug "zlsun/solarized-man"
# zplug "aramboi/zsh-ipfs"
# zplug "hcgraf/zsh-sudo ", from:oh-my-zsh, ignore:oh-my-zsh.sh, defer:2
# zplug "mollifier/anyframe"
# zplug "psprint/zsh-select", defer:3
# DEER
# zplug "vifon/deer", use:deer
# zle -N deer
# bindkey '\ek' deer



# setopt extended_glob
# # setopt glob_dots                # include dotfiles in globbing
# setopt append_history
# setopt extended_history
# setopt inc_append_history
# setopt hist_expire_dups_first
# setopt hist_ignore_space
# setopt hist_reduce_blanks
# setopt hist_verify
# setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
# # setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
# setopt complete_in_word # Allow completion from within a word/phrase
# # setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
# # unsetopt menu_complete # do not autoselect the first completion entry
# unsetopt correct_all # spelling correction for arguments
# setopt correct # spelling correction for commands
# # unsetopt bg_nice                # no lower prio for background jobs
# setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.





# zstyle ':prezto:module:prompt' theme 'pure'
#
# # The order matters.
# zstyle ':prezto:load' pmodule \
#   'environment' \
#   'terminal' \
#   'command-not-found' \
#   'history' \
#   'directory' \
#   'spectrum' \
#   'utility' \
#   'completion' \
#   'syntax-highlighting' \
#   'history-substring-search' \
#   'autosuggestions' \
#   'prompt'


# HIST_STAMPS="mm/dd/yyyy" # variable used in oh-my-zsh/lib/history.zsh
# zplug "robbyrussell/oh-my-zsh", use:"lib/{clipboard,completion,directories,history,termsupport,key-bindings}.zsh"
