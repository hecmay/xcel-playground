#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_local_block", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_local_deadlock", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("A_address0", 10, hls_out, 0, "ap_memory", "mem_address", 1),
	Port_Property("A_ce0", 1, hls_out, 0, "ap_memory", "mem_ce", 1),
	Port_Property("A_q0", 32, hls_in, 0, "ap_memory", "mem_dout", 1),
	Port_Property("B", 32, hls_out, 1, "ap_vld", "out_data", 1),
	Port_Property("B_ap_vld", 1, hls_out, 1, "ap_vld", "out_vld", 1),
};
const char* HLS_Design_Meta::dut_name = "top";
