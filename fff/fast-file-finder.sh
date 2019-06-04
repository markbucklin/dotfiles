# todo make bash compatible (command is zsh only)
if ! $(command -v fff >|/dev/null); then
  wget -P ~.local/bin https://raw.githubusercontent.com/dylanaraps/fff/master/fff
  chmod ug+x ~/.local/bin/fff
fi

# Directory color [0-9]
export FFF_COL1=2

# Status color [0-9]
export FFF_COL2=7

# Selection color [0-9] (copied/moved files)
export FFF_COL3=6

# Text Editor
export FFF_EDITOR="nvim" # alternative: export EDITOR="vim"

# File Opener
export FFF_OPENER="xdg-open"

# Favourites (keys 1-9) (dir or file)
export FFF_FAV1=~/projects
export FFF_FAV2=~/.bashrc
export FFF_FAV3=~/Pictures/Wallpapers/
export FFF_FAV4=/usr/share
export FFF_FAV5=/
export FFF_FAV6=
export FFF_FAV7=
export FFF_FAV8=
export FFF_FAV9=
