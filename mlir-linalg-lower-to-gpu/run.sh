mlir-opt matmul.mlir \
    --convert-linalg-to-parallel-loops \
    --test-gpu-greedy-parallel-loop-mapping \
    --convert-parallel-loops-to-gpu \
    --gpu-kernel-outlining \
    --lower-affine \
    --convert-scf-to-std \
    --canonicalize 
    # --pass-pipeline="gpu.module(strip-debuginfo,convert-gpu-to-nvvm,gpu-to-cubin)" \
    # --gpu-to-llvm 2>&1 >matmul-gpu-02.mlir.out
