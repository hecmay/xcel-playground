function __xilinx_env_setup {
    export XILINX_HOME=/opt/xilinx
    export XILINX_VIVADO=/opt/xilinx/Vivado/2022.1
    export XILINX_VITIS=/opt/xilinx/Vitis/2022.1
    export XILINX_VITIS_HLS=/opt/xilinx/Vitis_HLS/2022.1
    export XILINX_XRT=/opt/xilinx/xrt
    export XILINX_VITIS_AIETOOLS=/opt/xilinx/Vitis/2022.1/aietools
    export XILINXD_LICENSE_FILE=2100@flex.ece.cornell.edu

    export PATH=$XILINX_VITIS_HLS/bin:$XILINX_XRT/bin:$XILINX_VIVADO/bin:$XILINX_VITIS/bin:$XILINX_VITIS/gnu/microblaze/lin/bin:$XILINX_VITIS/gnu/arm/lin/bin:$XILINX_VITIS/gnu/microblaze/linux_toolchain/lin64:$XILINX_VITIS/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:$XILINX_VITIS/gnu/aarch32/lin/gcc-arm-none-eabi/bin:$XILINX_VITIS/gnu/aarch64/lin/aarch64-linux/bin:$XILINX_VITIS/gnu/aarch64/lin/aarch64-none/bin:$XILINX_VITIS/gnu/armr5/lin/gcc-arm-none-eabi/bin:$XILINX_VITIS/aietools/bin/:$PATH

    export LD_LIBRARY_PATH=$HOME/install/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH
    export CPLUS_INCLUDE_PATH=$HOME/install/usr/include/
}

function __common_path_setup {
    conda activate py36
    source /opt/rh/devtoolset-7/enable 

    export LLVM_INSTALL_DIR=/scratch/users/sx233/llvm-project
    export LD_LIBRARY_PATH=$LLVM_INSTALL_DIR/build/lib:$LD_LIBRARY_PATH
    export PATH=$LLVM_INSTALL_DIR/build/bin/:$PATH

    export LOCAL=/scratch/users/sx233/install
    export LD_LIBRARY_PATH=$LOCAL/usr/local/lib:$LOCAL/usr/local/lib64:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$LOCAL/usr/lib:$LOCAL/usr/lib64:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$LOCAL/lib:$LOCAL/lib64:$LD_LIBRARY_PATH

    export PATH=$LOCAL/bin:$PATH
    export PATH=$LOCAL/usr/local/bin:$LOCAL/usr/bin:$PATH

    export CPLUS_INCLUDE_PATH=$LOCAL/usr/local/include:/opt/xilinx/2022.1/Vitis_HLS/2022.1/include/:$CPLUS_INCLUDE_PATH
    export CUDA_PATH=/usr/local/cuda-11.3
}

alias cps='__common_path_setup'