export XILINX_VERSION=2022.1

export XILINX_HOME=/opt/xilinx
export XILINX_VIVADO=/opt/xilinx/Vivado/$XILINX_VERSION
export XILINX_VITIS=/opt/xilinx/Vitis/$XILINX_VERSION
export XILINX_VITIS_HLS=/opt/xilinx/Vitis_HLS/$XILINX_VERSION
export XILINX_XRT=/opt/xilinx/xrt
export XILINX_VITIS_AIETOOLS=/opt/xilinx/Vitis/$XILINX_VERSION/aietools
export XILINXD_LICENSE_FILE=2100@flex.ece.cornell.edu

export PATH=$XILINX_VITIS_HLS/bin:$XILINX_XRT/bin:$XILINX_VIVADO/bin:$XILINX_VITIS/bin:$XILINX_VITIS/gnu/microblaze/lin/bin:$XILINX_VITIS/gnu/arm/lin/bin:$XILINX_VITIS/gnu/microblaze/linux_toolchain/lin64:$XILINX_VITIS/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:$XILINX_VITIS/gnu/aarch32/lin/gcc-arm-none-eabi/bin:$XILINX_VITIS/gnu/aarch64/lin/aarch64-linux/bin:$XILINX_VITIS/gnu/aarch64/lin/aarch64-none/bin:$XILINX_VITIS/gnu/armr5/lin/gcc-arm-none-eabi/bin:$XILINX_VITIS/aietools/bin/:$PATH

# 1. Install libtinfo.so.5 locally 
# 2. Symbolically link include/asm-generic/: https://stackoverflow.com/questions/14795608/asm-errno-h-no-such-file-or-directory
# 3. AIE license not found (need a per-user node-locked license inside ~/.Xilinx): https://support.xilinx.com/s/article/76792?language=en_US
export LD_LIBRARY_PATH=$HOME/install/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH
export CPLUS_INCLUDE_PATH=$HOME/install/usr/include/

source /opt/rh/devtoolset-7/enable