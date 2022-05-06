
function make_host {
    /usr/local/cuda-11.3/bin/nvcc -o p2p_bandwidth xcl2.cpp cmdlineparser.cpp logger.cpp src/host.cu -I/opt/xilinx/xrt/include -I/opt/xilinx/Xilinx_Vivado_vitis_2020.2/Vivado/2020.2/include -O0 -g -std=c++11 -I./ -L/opt/xilinx/xrt/lib -lOpenCL -lxilinxopencl -lrt -lstdc++
}

function run_host {
    ./p2p_bandwidth -x bandwidth.xclbin -p ./data/sample.txt -d 2
}
