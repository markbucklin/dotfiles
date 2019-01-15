
# todo: check path for go and install if necessary
# todo: fix multiple go installs (/usr/local/go and ~/.linuxbrew)
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
