#!/usr/bin/env sh

# ======================================
# /home/mark/.dotfiles/shell/default.path.preenv
# ======================================

function set-default-path()
{
if [ "`id -u`" -eq 0 ]; then
  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
else
  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/snap/bin"
fi
export PATH
}

prepend-path() {
    local bin_dir="${1}"
    
    # Get real path to given dir (if symlink given)
    [[ -L $bin_dir ]] && bin_dir=$(realpath $bin_dir)
    
    # Check if whether bin_dir is in current PATH
    if [[ -n $bin_dir ]] && [[ ":$PATH:" != *":$bin_dir:"* ]]; then
        PATH="${bin_dir}:${PATH}"
        export PATH
    fi
}


function library-search-path() {
	ld --verbose | grep SEARCH_DIR | sed -E 's/("\); |"\);|)(SEARCH_DIR\("=?|$)/\n/g' | head -n -1 | tail -n +2
	}




# Set Default Path
set-default-path

# Add local user directory to path
prepend-path ${HOME}/.local/bin

# ======================================
# /home/mark/.dotfiles/ffmpeg/ffmpeg.shell.env
# ======================================
# FFMPEG
export VDPAU_DRIVER=nvidia
export LIBVA_DRIVER_NAME=vdpau


# ======================================
# /home/mark/.dotfiles/go/go.path.env
# ======================================
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
prepend-path "${GOROOT}/bin"
prepend-path "${GOPATH}/bin"

# ======================================
# /home/mark/.dotfiles/git/ghq.shell.env
# ======================================

# GHQ
export GHQ_ROOT=$HOME/.ghq:$HOME/repo
# ======================================
# /home/mark/.dotfiles/java/java.path.env
# ======================================
export JAVA_BINDIR=$(dirname $(readlink -f $(which java)))
export JAVA_HOME=$(dirname ${JAVA_BINDIR})

# ======================================
# /home/mark/.dotfiles/node/nvm.shell.env
# ======================================

##### nvm (node version manager) #####
# placeholder nvm shell function
# On first use, it will set nvm up properly which will replace the `nvm`
# shell function with the real one
# [ -n $NVM_DIR ] || source "$(dirname ${0})/nvm.env"

NVM_DIR="$HOME/.nvm"
export NVM_DIR

# Get path to bin directory for default node version
local alias_name='default'
local alias_root="${NVM_DIR}/alias"
local version_root="${NVM_DIR}/versions/node"
local alias_file="$alias_root/$alias_name"
local version_bin_dir=""

# Allow for multiple alias pointers (e.g. default -> latest -> v11.6.0)
while ! [[ -d $version_bin_dir ]] && [[ -f $alias_file ]]
do
  alias_value=`cat $alias_file`
  alias_file="$alias_root/$alias_value"
  version_bin_dir="$version_root/$alias_value/bin"
done

# Set PATH to default node-version/bin
# PATH="${version_bin_dir}:${PATH}"
prepend-path "${version_bin_dir}"


nvm() {
  if [[ -d "${NVM_DIR}" ]]; then
    
    # Source original file
   if [[ -f "$NVM_DIR/nvm.sh" ]]
   then
     . "${NVM_DIR}/nvm.sh"
    fi
        
    # invoke the real nvm function now
    nvm "$@"
  else
    echo "nvm is not installed" >&2
    return 1
  fi
}

# ======================================
# /home/mark/.dotfiles/haskell/haskell.path.env
# ======================================
prepend-path "${HOME}/.cabal/bin"

# ======================================
# /home/mark/.dotfiles/python/conda.env
# ======================================
if [ -d ${HOME}/miniconda* ] ; then
  source ~/miniconda*/etc/profile.d/conda.sh
fi


# ======================================
# /home/mark/.dotfiles/cuda/cuda.shell.env
# ======================================
# CUDA
    export CUDADIR=/usr/local/cuda
    export GLPATH=/usr/lib
    export CUDA_HOME=/usr/local/cuda
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64

prepend-path "${CUDADIR}/bin"



# from https://www.pugetsystems.com/labs/hpc/NAMD-Custom-Build-for-Better-Performance-on-your-Modern-GPU-Accelerated-Workstation----Ubuntu-16-04-18-04-CentOS-7-1196/
#CUDAINCL=-I$(CUDADIR)/include
#CUBDIR=.rootdir/cub
#CUBINCL=-I$(CUBDIR)
#CUDALIB=-L$(CUDADIR)/lib64 -lcufft_static -lculibos -lcudart_static -lrt
#CUDASODIR=$(CUDADIR)/lib64
#LIBCUDARTSO=
#CUDAFLAGS=-DNAMD_CUDA
#CUDAOBJS=$(CUDAOBJSRAWSTATIC)
#CUDA=$(CUDAFLAGS) -I. $(CUDAINCL) $(CUBINCL)
#CUDACC=$(CUDADIR)/bin/nvcc -Xcompiler "-m64"

#CUDACCOPTS=-O3 --maxrregcount 48 $(CUDAGENCODE) $(CUDA)

# limit CUDADLINKOPTS to architectures available in libcufft_static

#CUDADLINKOPTS=-gencode arch=compute_30,code=sm_30 -gencode arch=compute_35,code=sm_35 -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,\
#code=sm_60 -gencode arch=compute_60,code=compute_60 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_70,code=compute_70

#CUDAGENCODE=-gencode arch=compute_30,code=sm_30 -gencode arch=compute_35,code=sm_35 -gencode arch=compute_37,code=sm_37 -gencode arch=compute_50,co\
#de=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_61,code=\
#compute_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_70,code=compute_70

# ======================================
# /home/mark/.dotfiles/ruby/ruby.path.env
# ======================================
export GEM_HOME=$HOME/gems
prepend-path "${GEM_HOME}/bin"

# ======================================
# /home/mark/.dotfiles/zsh/completion.home.env
# ======================================

export zsh_completion_system_dir="/usr/share/zsh/vendor-completions"
export zsh_completion_cache_home="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
[[ -d "$zsh_completion_cache_home" ]] || md -p "$zsh_completion_cache_home"
export ZSH_COMPLETION_DIR=$zsh_completion_cache_home
fpath=( "$zsh_completion_cache_home" $fpath )

# ======================================
# /home/mark/.dotfiles/shell/shell.env
# ======================================
# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

# Set a backup directory on university server
export BACKUP_DIR="/hanlab/People/Mark Bucklin/backup"
# todo: check backup path exists

export PROJECT_HOME=$HOME/projects

# ======================================
# /home/mark/.dotfiles/rust/rust.path.env
# ======================================
export CARGO_HOME="${HOME}/.cargo"
export RUSTUP_HOME="${HOME}/.rustup"
prepend-path "${CARGO_HOME}/bin"

# ======================================
# /home/mark/.dotfiles/shell/shell.postenv
# ======================================
# shell.post.env

# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH
