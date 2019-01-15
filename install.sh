

for d in dotfiles/*rc.d; do ; ln -sf $d $(echo ".`echo $(basename $d)`"); done
