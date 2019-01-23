#!/usr/bin/sh

set -euo pipefail

for d in homedir/* ; do 
	ln -sf "${PWD}/$d" "${HOME}/$(printf '.%s' $(basename $d))";
done
