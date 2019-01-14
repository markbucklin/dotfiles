
# export DEFAULT_USER=mark
# export DOTDIR="/home/$DEFAULT_USER/dotfiles"


# export fpath=($DOTDIR/functions $fpath)

# skip_global_compinit=1


# Source Local Dot-Files (common to all shells)
env_dir=$HOME/dotfiles/login.d
if [ -d ${env_dir} ]; then
  for file in $env_dir/*.sh ; do
      source $file
  done
fi


# remove duplicate entries
typeset -U PATH
