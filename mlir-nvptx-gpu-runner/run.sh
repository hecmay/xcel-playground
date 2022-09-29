mlir-opt gpu-dialect-all-reduce.mlir -gpu-kernel-outlining  \
    -pass-pipeline="gpu.module(strip-debuginfo,convert-gpu-to-nvvm,gpu-to-cubin)" \
    -gpu-to-llvm | mlir-translate -mlir-to-llvmir | opt -O3 -S | llc -O3 | as - -o test.o

export LLVM_INSTALL_DIR=/scratch/users/sx233/llvm-project/
export LD_LIBRARY_PATH=$LLVM_INSTALL_DIR/build/lib:$LD_LIBRARY_PATH
clang++ test.o -L$LLVM_INSTALL_DIR/build/lib \
    -o exec -lcuda -lmlir_cuda_runtime -lmlir_runner_utils -lmlir_c_runner_utils