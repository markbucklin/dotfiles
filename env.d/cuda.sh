export PATH=$PATH:/usr/local/cuda/bin
export CUDADIR=/usr/local/cuda
export GLPATH=/usr/lib
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64



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
