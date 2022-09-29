#
# Copyright 2021 Xilinx, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Create a project
open_project -reset reduce_example

# Add design files
add_files reduce.cpp

# Add test bench & files
add_files -tb reduce_test.cpp -cflags "-std=gnu++14"

# Set the top-level function
set_top top

# ########################################################
# Create a solution
open_solution -reset solution1
# Define technology and clock rate
set_part  {xczu7ev-ffvc1156-2-e}
create_clock -period 5

# Source x_hls.tcl to determine which steps to execute
source x_hls.tcl
csim_design

if {$hls_exec == 1} {
    # Run Synthesis and Exit
    csynth_design
} elseif {$hls_exec == 2} {
    # Run Synthesis, RTL Simulation and Exit
    csynth_design
    cosim_design
} elseif {$hls_exec == 3} { 
    # Run Synthesis, RTL Simulation, RTL implementation and Exit
    csynth_design
    cosim_design
    export_design
} else {
    # Default is to exit after setup
    csynth_design
}

exit
