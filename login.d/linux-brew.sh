# Until LinuxBrew is fixed, the following is required.
# See: https://github.com/Homebrew/linuxbrew/issues/47

# default /usr/lib/pkgconfig and /usr/share/pkgconfig
# echo $(pkg-config --variable pc_path pkg-config)${PKG_CONFIG_PATH:+:}${PKG_CONFIG_PATH}
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig


# Setup linux brew
export LINUXBREWHOME=$HOME/.linuxbrew
export PATH="$LINUXBREWHOME/bin:$PATH"
export MANPATH=$LINUXBREWHOME/share/man:$MANPATH
export INFOPATH=$LINUXBREWHOME/share/info:$INFOPATH
export PKG_CONFIG_PATH=$LINUXBREWHOME/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LINUXBREWHOME/lib:/usr/local/lib:/usr/lib
