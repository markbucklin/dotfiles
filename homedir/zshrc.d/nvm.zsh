#!/usr/bin/env zsh

export NVM_DIR="$HOME/.nvm"

# # standard NVM init
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# cached NVM init
# cache_file="$HOME/.cache/nvm-init-$(basename $SHELL)"
src_file="$NVM_DIR/nvm.sh"
if ! $(type -f 'nvm' &>/dev/null )
then
	.	"$src_file"
fi
	# TODO: test if nvm has a node version loaded and npm is available, otherwise choose default
  # set path with current npm
  npm_bin=`npm bin -g`
  if [[ ! "*${npm_bin}*" == "$PATH" ]]
  then
	  export PATH="$npm_bin:$PATH"
fi
