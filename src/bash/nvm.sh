#!/bin/bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [ $SHELL="/bin/bash" ]; then
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi


export PATH="`npm bin -g`:$PATH"


# alias npm-ls-bin="ls $(npm bin -g)"
