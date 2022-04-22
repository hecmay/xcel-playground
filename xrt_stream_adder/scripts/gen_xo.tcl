# /*******************************************************************************
# Copyright (c) 2019, Xilinx, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
#
# 3. Neither the name of the copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software
# without specific prior written permission.
#
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
# OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# *******************************************************************************/
if { $::argc != 5 } {
    puts "ERROR: Program \"$::argv0\" requires 5 arguments!\n"
    puts "Usage: $::argv0 <xoname> <krnl_name> <target> <xpfm_path> <device>\n"
    exit
}

# Input arguments for .xo file path, kernel name, emu target, fpga device
set xo_pathname  [lindex $::argv 0]
set krnl_name [lindex $::argv 1]
set target    [lindex $::argv 2]
set xpfm_path [lindex $::argv 3]
set device    [lindex $::argv 4]

set suffix "${krnl_name}_${target}_${device}"

set pinfo [file join [pwd] "pinfo.json"]
exec $::env(XILINX_VITIS)/bin/platforminfo -j $pinfo -p ${xpfm_path}

if {[file exists "blocked_accum_s2m0_ex"]} {
    file delete -force "blocked_accum_s2m0_ex"
}
if {[file exists "project_1"]} {
    file delete -force "project_1"
}

set fid [open $pinfo r]
set bpart "part"
while { ! [eof $fid] } {
    gets $fid line
    if { [regexp {([^:[:space:]]+): (.*),$} $line match left right] } {
	regsub -all {\"} $left {} left
	regsub -all {\"} $right {} right
	if { $left eq $bpart } {
	    set partname $right
 	    puts "partname = $partname\n"
	    break
        }
    }
}
close $fid

# set up paths to the source IP and the Xilinx project, created in the next step
set path_to_hdl "./src/ip"
set path_to_packaged "./packaged_kernel_${suffix}"
set path_to_tmp_project "./tmp_kernel_pack_${suffix}"

# Create a xilinx project, which will allow us to set up the kernel such that
# .xo compiliation will be correct
create_project -force kernel_pack $path_to_tmp_project

# Add the existing Verilog IP to the Xilinx project
add_files -norecurse [glob $path_to_hdl/*.v $path_to_hdl/*.sv];
# Indicate to the .xo compiler that the files we just brought in should be compiled
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1


# --------------------------------------------
# Start: RTL Kernel Packaging of Sources
#

# Source the package_kernel.tcl script so we can use the package_project command.
source -notrace ./scripts/package_kernel.tcl
# Packaging project - sets
package_project ${path_to_packaged} xilinx.com user blocked_accum_s2m0
package_xo  -xo_path ${xo_pathname} -kernel_name blocked_accum_s2m0 -ip_directory ./packaged_kernel_${suffix} -kernel_xml ./src/xml/kernel.xml
# Complete: RTL Kernel Packaging of Sources
# --------------------------------------------

#set xo_path [file join [pwd] ${xo_pathname}]
#if {[file exists "blocked_accum_s2m0_ex/imports/blocked_accum_s2m0.xo"]} {
#    file copy blocked_accum_s2m0_ex/imports/blocked_accum_s2m0.xo ${xo_path}
#} else {
#    puts "ERROR: blocked_accum_s2m0_ex/imports/blocked_accum_s2m0.xo does not exist!\n"
#    exit 1
#}
