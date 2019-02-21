#!/usr/bin/sh

set -euo pipefail

srcdir=${1:-$BASH_SOURCE}
for d in $srcdir/* ; do
    ln -sf "${PWD}/$d" "${HOME}/$(printf '.%s' "$(basename $d)")";
done
