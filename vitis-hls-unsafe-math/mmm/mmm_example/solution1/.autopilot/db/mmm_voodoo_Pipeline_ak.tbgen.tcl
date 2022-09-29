set moduleName mmm_voodoo_Pipeline_ak
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mmm_voodoo_Pipeline_ak}
set C_modelType { void 0 }
set C_modelArgList {
	{ select_ln88_1 int 9 regular  }
	{ trunc_ln95 int 1 regular  }
	{ A int 64 regular {array 32768 { 1 3 } 1 1 }  }
	{ zext_ln89 int 9 regular  }
	{ B int 64 regular {array 32768 { 1 3 } 1 1 }  }
	{ accum float 32 regular {array 8 { 0 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "select_ln88_1", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln95", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln89", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "B", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "accum", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ select_ln88_1 sc_in sc_lv 9 signal 0 } 
	{ trunc_ln95 sc_in sc_lv 1 signal 1 } 
	{ A_address0 sc_out sc_lv 15 signal 2 } 
	{ A_ce0 sc_out sc_logic 1 signal 2 } 
	{ A_q0 sc_in sc_lv 64 signal 2 } 
	{ zext_ln89 sc_in sc_lv 9 signal 3 } 
	{ B_address0 sc_out sc_lv 15 signal 4 } 
	{ B_ce0 sc_out sc_logic 1 signal 4 } 
	{ B_q0 sc_in sc_lv 64 signal 4 } 
	{ accum_address0 sc_out sc_lv 3 signal 5 } 
	{ accum_ce0 sc_out sc_logic 1 signal 5 } 
	{ accum_we0 sc_out sc_logic 1 signal 5 } 
	{ accum_d0 sc_out sc_lv 32 signal 5 } 
	{ accum_address1 sc_out sc_lv 3 signal 5 } 
	{ accum_ce1 sc_out sc_logic 1 signal 5 } 
	{ accum_q1 sc_in sc_lv 32 signal 5 } 
	{ grp_fu_125_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_125_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_125_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_125_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_125_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_322_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_322_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_322_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_322_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "select_ln88_1", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "select_ln88_1", "role": "default" }} , 
 	{ "name": "trunc_ln95", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln95", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "zext_ln89", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln89", "role": "default" }} , 
 	{ "name": "B_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "B", "role": "address0" }} , 
 	{ "name": "B_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "ce0" }} , 
 	{ "name": "B_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "B", "role": "q0" }} , 
 	{ "name": "accum_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "accum", "role": "address0" }} , 
 	{ "name": "accum_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accum", "role": "ce0" }} , 
 	{ "name": "accum_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accum", "role": "we0" }} , 
 	{ "name": "accum_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum", "role": "d0" }} , 
 	{ "name": "accum_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "accum", "role": "address1" }} , 
 	{ "name": "accum_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "accum", "role": "ce1" }} , 
 	{ "name": "accum_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum", "role": "q1" }} , 
 	{ "name": "grp_fu_125_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_125_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_125_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_125_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_125_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_125_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_125_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_125_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_125_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_125_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_322_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_322_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_322_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_322_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_322_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_322_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_322_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_322_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "mmm_voodoo_Pipeline_ak",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "152", "EstimateLatencyMax" : "152",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "select_ln88_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln95", "Type" : "None", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln89", "Type" : "None", "Direction" : "I"},
			{"Name" : "B", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "accum", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "ak", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter23", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter23", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_8_full_dsp_1_U49", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_5_max_dsp_1_U51", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mmm_voodoo_Pipeline_ak {
		select_ln88_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln95 {Type I LastRead 0 FirstWrite -1}
		A {Type I LastRead 0 FirstWrite -1}
		zext_ln89 {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}
		accum {Type IO LastRead 5 FirstWrite 23}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "152", "Max" : "152"}
	, {"Name" : "Interval", "Min" : "152", "Max" : "152"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	select_ln88_1 { ap_none {  { select_ln88_1 in_data 0 9 } } }
	trunc_ln95 { ap_none {  { trunc_ln95 in_data 0 1 } } }
	A { ap_memory {  { A_address0 mem_address 1 15 }  { A_ce0 mem_ce 1 1 }  { A_q0 in_data 0 64 } } }
	zext_ln89 { ap_none {  { zext_ln89 in_data 0 9 } } }
	B { ap_memory {  { B_address0 mem_address 1 15 }  { B_ce0 mem_ce 1 1 }  { B_q0 in_data 0 64 } } }
	accum { ap_memory {  { accum_address0 mem_address 1 3 }  { accum_ce0 mem_ce 1 1 }  { accum_we0 mem_we 1 1 }  { accum_d0 mem_din 1 32 }  { accum_address1 MemPortADDR2 1 3 }  { accum_ce1 MemPortCE2 1 1 }  { accum_q1 MemPortDOUT2 0 32 } } }
}
