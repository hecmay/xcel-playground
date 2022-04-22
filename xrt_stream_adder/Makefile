# SW variables
ifndef XILINX_XRT
$(error environment variable XILINX_XRT is not set. Please ensure the Xilinx runtime is installed and properly sourced)
endif
OUT_FILES := blocked_accum_s2m0
SRC_DIRS := src
DEVICE := xilinx:u250:qdma:201920.1
VITIS_PLATFORM_VLNV := $(DEVICE)
VITIS_PLATFORM := $(subst :,_,$(VITIS_PLATFORM_VLNV))
VITIS_PLATFORM := $(subst .,_,$(VITIS_PLATFORM))
SRCS := $(shell find $(SRC_DIRS) -name *.cpp -or -name *.c -or -name *.s)
OBJS := $(addsuffix .o,$(basename $(SRCS)))
DEPS := $(OBJS:.o=.d)
LDLIBS := -lxilinxopencl -lpthread -lrt -lstdc++
LOADLIBES := -L$(XILINX_XRT)/lib
INC_DIRS := $(shell find $(SRC_DIRS) -type d) $(XILINX_XRT)/include
INC_FLAGS := $(addprefix -I,$(INC_DIRS))
CPPFLAGS ?= $(INC_FLAGS) -MMD -MP -std=gnu++11 -g -Wall -DVITIS_PLATFORM=$(VITIS_PLATFORM)

# HW variables
CXX := g++
VIVADO := /opt/xilinx/Xilinx_Vivado_vitis_2019.2/Vivado/2019.2/bin/vivado
VPP := /opt/xilinx/Xilinx_Vivado_vitis_2019.2/Vitis/2019.2/bin/v++
TARGET := hw
KERNEL := blocked_accum_s2m0
PLATFORM := xilinx_u250_qdma_201920_1
XPMF := /opt/xilinx/platforms/$(PLATFORM)/$(PLATFORM).xpfm
BUILD_DIR := ./xclbin
BINARY_CONTAINER_OBJ := $(BUILD_DIR)/$(KERNEL).$(TARGET).xo
BINARY_CONTAINER := $(BUILD_DIR)/$(KERNEL).$(TARGET).xclbin
SRC_SCRIPT := scripts/gen_xo.tcl

# SW compilation
$(OUT_FILES): $(OBJS)
	$(CXX) $(LDFLAGS) $(OBJS) -o $@ $(LOADLIBES) $(LDLIBS)
  -include $(DEPS)

# HW compilation
.PHONY:xclbin
xclbin: $(OUT_FILES)
	@echo xclbin compilation...
	rm -rf $(BUILD_DIR)
	rm -f *.json
	if ! [ -d $(BUILD_DIR) ]; then \
		mkdir -p $(BUILD_DIR); \
	fi;
	# Run the gen_xo.tcl script
	$(VIVADO) -mode batch -source $(SRC_SCRIPT) -tclargs $(BINARY_CONTAINER_OBJ) $(KERNEL) $(TARGET) $(XPMF) $(PLATFORM)
	# Use v++ to compile the .xo generated with the above command to an FPGA bitstream
	$(VPP) -t $(TARGET) --platform $(PLATFORM) --save-temps -lo $(BINARY_CONTAINER) $(BINARY_CONTAINER_OBJ)
	# Run emconfigutil to make the emconfig.json appear in this directory
	emconfigutil --platform $(PLATFORM) --od .

.PHONY: clean
clean:
	$(RM) $(OUT_FILES) $(OBJS) $(DEPS)
	rm -f $(OUT_FILES)
	rm -rf tmp_kernel_pack_$(KERNEL)_$(TARGET)_$(PLATFORM)
	rm -rf packaged_kernel_$(KERNEL)_$(TARGET)_$(PLATFORM)
	rm -rf $(BUILD_DIR)
	rm -rf _x
	rm -rf .run/
	rm -rf .Xil/
	rm -f vivado.*
	rm -f *.json
	rm -f *.log
	rm -f *.jou

