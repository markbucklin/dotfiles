
# export DEFAULT_USER=mark
# export DOTDIR="/home/$DEFAULT_USER/dotfiles"


export fpath=($HOME/.functions $fpath)

skip_global_compinit=1


# Source Local Shell Environment Dot-Files (common to all shells)
env_dir=$HOME/.env.d
if [ -d ${env_dir} ]; then
  for file in $env_dir/*.sh ; do
      source $file
  done
fi


# remove duplicate entries
# typeset -U PATH
