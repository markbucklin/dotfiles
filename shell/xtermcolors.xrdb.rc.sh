
if [[ -e $HOME/.Xdefaults ]]; then
    xrdb $HOME/.Xdefaults
elif [[ -e $HOME/.Xresources ]]; then
    xrdb $HOME/.Xresources
fi


