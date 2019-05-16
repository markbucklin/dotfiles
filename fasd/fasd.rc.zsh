
# Fasd is hosted on GitHub: https://github.com/clvv/fasd

# # minimal zsh setup (no tab completion)
# zsh_minimal=('posix-alias' 'zsh-hook')
# zsh_full=('posix-alias' 'zsh-hook' 'zsh-ccomp' 'zsh-ccomp-install' 'zsh-wcomp' 'zsh-wcomp-install')
# bash_basic=('posix-alias' 'bash-hook' 'bash-ccomp' 'bash-ccomp-install')


#TODO: CACHE_DIR env variable
# cached
cache_file="$HOME/.cache/fasd-init-$(basename $SHELL)"
src_file="$(command -v fasd)"
# TODO: add src_opts and src_args
if [ "$src_file" -nt "$cache_file" -o ! -s "$cache_file" ]; then
	fasd --init auto >| "$cache_file"
fi
source "$cache_file"
unset fasd_cache



bindkey '^@^I' fasd-complete    # C-x C-a to do fasd-complete (fils and directories)
bindkey '^@^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
bindkey '^@^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)




# export _FASD_DATA=
# Path to the fasd data file, default "$HOME/.fasd".
#

# export _FASD_BLACKLIST=
# List of blacklisted strings. Commands matching them will not be processed.
# Default is "--help".


# export _FASD_SHIFT=
# List of all commands that needs to be shifted, defaults to "sudo busybox".
#

# export _FASD_IGNORE=
# List of all commands that will be ignored, defaults to "fasd ls echo".
#

# export _FASD_TRACK_PWD=
# Fasd defaults to track your "$PWD". Set this to 0 to disable this behavior.
#

# export _FASD_AWK=
# Which awk to use. fasd can detect and use a compatible awk.
#

# export _FASD_SINK=
# File to log all STDERR to, defaults to "/dev/null".
#

# export _FASD_MAX=
# Max total score / weight, defaults to 2000.
#

# export _FASD_SHELL=
# Which shell to execute. Some shells will run faster than others. fasd
# runs faster with dash and ksh variants.


# export _FASD_BACKENDS=
# Default backends.
#

# export _FASD_RO=
# If set to any non-empty string, fasd will not add or delete entries from
# database. You can set and export this variable from command line.


# export _FASD_FUZZY=
# Level of "fuzziness" when doing fuzzy matching. More precisely, the number of
# characters that can be skipped to generate a match. Set to empty or 0 to
# disable fuzzy matching. Default value is 2.


# export _FASD_VIMINFO=
# Path to .viminfo file for viminfo backend, defaults to "$HOME/.viminfo"
#

# export _FASD_RECENTLY_USED_XBEL=
# Path to XDG recently-used.xbel file for recently-used backend, defaults to
# "$HOME/.local/share/recently-used.xbel"

# DEBUGGING
# Fasd is hosted on GitHub: https://github.com/clvv/fasd



# # TO USE CACHE (for faster startup)
# fasd_cache="$HOME/.fasd-init-bash"
# if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
# fi
# source "$fasd_cache"
# unset fasd_cache


 # zsh-hook             # define _fasd_preexec and add it to zsh preexec array
 # zsh-ccomp            # zsh command mode completion definitions
 # zsh-ccomp-install    # setup command mode completion for zsh
 # zsh-wcomp            # zsh word mode completion definitions
 # zsh-wcomp-install    # setup word mode completion for zsh
 # bash-hook            # add hook code to bash $PROMPT_COMMAND
 # bash-ccomp           # bash command mode completion definitions
 # bash-ccomp-install   # setup command mode completion for bash
 # posix-alias          # define aliases that applies to all posix shells
 # posix-hook           # setup $PS1 hook for shells that's posix compatible
 # tcsh-alias           # define aliases for tcsh
 # tcsh-hook            # setup tcsh precmd alias
