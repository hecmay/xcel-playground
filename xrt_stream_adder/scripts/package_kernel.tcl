# This is a generated file. Use and modify at your own risk.
################################################################################

set kernel_name    "blocked_accum_s2m0"
set kernel_vendor  "mycompany.com"
set kernel_library "kernel"

##############################################################################

proc edit_core {core} {
  ::ipx::associate_bus_interfaces -busif "in0" -clock "ap_clk" $core
  ::ipx::associate_bus_interfaces -busif "out0" -clock "ap_clk" $core
  ::ipx::associate_bus_interfaces -busif "s_axi_control" -clock "ap_clk" $core

  # Specify the freq_hz parameter 
  set clkbif      [::ipx::get_bus_interfaces -of $core "ap_clk"]
  set clkbifparam [::ipx::add_bus_parameter -quiet "FREQ_HZ" $clkbif]
  # Set desired frequency                   
  set_property value 250000000 $clkbifparam
  # set value_resolve_type 'user' if the frequency can vary. 
  set_property value_resolve_type user $clkbifparam
  # set value_resolve_type 'immediate' if the frequency cannot change. 
  # set_property value_resolve_type immediate $clkbifparam
  set mem_map    [::ipx::add_memory_map -quiet "s_axi_control" $core]
  set addr_block [::ipx::add_address_block -quiet "reg0" $mem_map]

  set reg      [::ipx::add_register "NO_CTRL" $addr_block]
  set_property description    "No control signals (reserved)"    $reg
  set_property address_offset 0x000 $reg
  set_property size           32    $reg
  set_property slave_memory_map_ref "s_axi_control" [::ipx::get_bus_interfaces -of $core "s_axi_control"]

  set_property xpm_libraries {XPM_CDC XPM_MEMORY XPM_FIFO} $core
  set_property sdx_kernel true $core
  set_property sdx_kernel_type rtl $core
}

##############################################################################

proc package_project {path_to_packaged kernel_vendor kernel_library kernel_name} {
  set core [::ipx::package_project -root_dir $path_to_packaged -vendor $kernel_vendor -library $kernel_library -taxonomy "/KernelIP" -import_files -set_current false ]
  foreach user_parameter [list C_S_AXI_CONTROL_ADDR_WIDTH C_S_AXI_CONTROL_DATA_WIDTH C_IN0_TDATA_WIDTH C_OUT0_TDATA_WIDTH] {
    ::ipx::remove_user_parameter $user_parameter $core
  }
  ::ipx::create_xgui_files $core
  set_property supported_families { } $core
  set_property auto_family_support_level level_2 $core
  
  edit_core $core
  ::ipx::update_checksums $core
  ::ipx::check_integrity -kernel $core
  ::ipx::save_core $core
  ::ipx::unload_core $core
  unset core
}

##############################################################################


