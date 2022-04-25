# https://xilinx.github.io/XRT/master/html/p2p.html

# enable P2P for U280 after warm reboot
sudo xbutil configure --device 0000:3d:00.1 --p2p enable
# check P2P status
xbutil examine --device 0000:3d:00.1
