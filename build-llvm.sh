function set_mlir {
    PyVer="$(python -c 'import platform; print(platform.python_version())')"
    MinimumPyVer="3.6.13"
     if [[ ! "$(printf '%s\n' "$MinimumPyVer" "$PyVer" | sort -V | head -n1)" = "$MinimumPyVer" ]]; then
            (
                echo "[+] python version shuold be greater than ${MinimumPyVer}"
                exit 0
            )
     fi

    # LLVM-14.0.0 with MLIR and python-binding
    export LLVM_BUILD_DIR=/scratch/users/sx233/llvm-project/build
    export HCL_DIALECT_DIR=/scratch/users/sx233/hcl-dialect-prototype/build

    export PYTHONPATH=$LLVM_BUILD_DIR/tools/mlir/python_packages/mlir_core:${PYTHONPATH}
    export LLVM_SYMBOLIZER_PATH=$LLVM_BUILD_DIR/bin/llvm-symbolizer
    echo "[+] using LLVM: $LLVM_BUILD_DIR"

    function make_hcl {
        pushd $HCL_DIALECT_DIR
        cmake -G "Unix Makefiles" .. \
            -DMLIR_DIR=$LLVM_BUILD_DIR/lib/cmake/mlir \
            -DLLVM_EXTERNAL_LIT=$LLVM_BUILD_DIR/bin/llvm-lit \
            -DPYTHON_BINDING=OFF \
            -DOPENSCOP=OFF
        make -j16
        popd
    }

    echo "[+] setup heterocl dialect python binding"
    export PYTHONPATH=$HCL_DIALECT_DIR/tools/hcl/python_packages/hcl_core:${PYTHONPATH}
    export PATH=$HCL_DIALECT_DIR/bin:/scratch/users/sx233/llvm-project/build/bin:$PATH
}

# python 3.6 and g++ 7 required
function build_llvm {
    # conda activate py36
    source /opt/rh/devtoolset-7/enable 
    export CUDA_PATH=/usr/local/cuda-11.3
    cd /scratch/users/sx233/llvm-project/build

    cmake -G "Unix Makefiles" ../llvm \
        -DLLVM_ENABLE_PROJECTS="mlir;clang" \
        -DLLVM_BUILD_EXAMPLES=ON \
        -DMLIR_ENABLE_CUDA_RUNNER=ON \
        -DLLVM_TARGETS_TO_BUILD="X86;NVPTX" \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_ENABLE_ASSERTIONS=ON \
        -DLLVM_INSTALL_UTILS=ON \
        -DMLIR_ENABLE_BINDINGS_PYTHON=ON \
        -DPython3_EXECUTABLE=`which python`    
    make -j`nproc`
}