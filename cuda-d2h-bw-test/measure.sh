P2P_D2H() {
    ./bandwidthTest --memory=pinned --mode=range --start=$1 --end=$1 --increment=10 --dtoh
}

P2P_D2D_SAME() {
    ./bandwidthTest --device=all --mode=range --start=$1 --end=$1 --increment=10 --dtod
}

P2P_D2D_DIFF() {
    ./bandwidthTest --device=0,2 --mode=range --start=$1 --end=$1 --increment=10 --dtod
}

TEST() {
    echo "====\n"
    P2P_D2D_SAME 16384
    echo "====\n"
    P2P_D2D_SAME 32768
    echo "====\n"
    P2P_D2D_SAME 65536
    echo "====\n"
    P2P_D2D_SAME 131072
    echo "====\n"
    P2P_D2D_SAME 262144
    echo "====\n"
    P2P_D2D_SAME 524288
    echo "====\n"
    P2P_D2D_SAME 1048576
    echo "====\n"
    P2P_D2D_SAME 2097152
    echo "====\n"
    P2P_D2D_SAME 4194304
    echo "====\n"
    P2P_D2D_SAME 8388608
    echo "====\n"
    P2P_D2D_SAME 16777216
    echo "====\n"
    P2P_D2D_SAME 33554432 # 32MB
}
