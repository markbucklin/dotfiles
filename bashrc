bashrc_dir="$HOME/.bashrc.d"
for file in $bashrc_dir/*.sh ; do
    source $file
done

rc_dir="$HOME/.rc.d"
for file in $rc_dir/*.sh ; do
	source $file
done


