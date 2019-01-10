# Until LinuxBrew is fixed, the following is required.
# See: https://github.com/Homebrew/linuxbrew/issues/47

# default /usr/lib/pkgconfig and /usr/share/pkgconfig
# echo $(pkg-config --variable pc_path pkg-config)${PKG_CONFIG_PATH:+:}${PKG_CONFIG_PATH}
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig


# Setup linux brew
export LINUXBREWHOME=$HOME/.linuxbrew
export PATH=$PATH:$LINUXBREWHOME/bin
export MANPATH=$MANPATH:$LINUXBREWHOME/share/man
export INFOPATH=$INFOPATH:$LINUXBREWHOME/share/info
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$LINUXBREWHOME/lib/pkgconfig
export LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:/usr/lib64:/usr/lib:$LD_LIBRARY_PATH:$LINUXBREWHOME/lib
