set moduleName mmm_accum2_Pipeline_ak
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
set C_modelName {mmm_accum2_Pipeline_ak}
set C_modelType { void 0 }
set C_modelArgList {
	{ accum_1_2_reload float 32 regular  }
	{ accum_0_2_reload float 32 regular  }
	{ select_ln68_1 int 9 regular  }
	{ trunc_ln75_1 int 1 regular  }
	{ A int 64 regular {array 32768 { 1 3 } 1 1 }  }
	{ zext_ln69 int 9 regular  }
	{ B int 64 regular {array 32768 { 1 3 } 1 1 }  }
	{ accum_1_4_out float 32 regular {pointer 1}  }
	{ accum_0_4_out float 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "accum_1_2_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "accum_0_2_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln68_1", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln75_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln69", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "B", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "accum_1_4_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_0_4_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ accum_1_2_reload sc_in sc_lv 32 signal 0 } 
	{ accum_0_2_reload sc_in sc_lv 32 signal 1 } 
	{ select_ln68_1 sc_in sc_lv 9 signal 2 } 
	{ trunc_ln75_1 sc_in sc_lv 1 signal 3 } 
	{ A_address0 sc_out sc_lv 15 signal 4 } 
	{ A_ce0 sc_out sc_logic 1 signal 4 } 
	{ A_q0 sc_in sc_lv 64 signal 4 } 
	{ zext_ln69 sc_in sc_lv 9 signal 5 } 
	{ B_address0 sc_out sc_lv 15 signal 6 } 
	{ B_ce0 sc_out sc_logic 1 signal 6 } 
	{ B_q0 sc_in sc_lv 64 signal 6 } 
	{ accum_1_4_out sc_out sc_lv 32 signal 7 } 
	{ accum_1_4_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ accum_0_4_out sc_out sc_lv 32 signal 8 } 
	{ accum_0_4_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ grp_fu_126_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_126_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_126_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_126_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_126_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_391_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_391_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_391_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_391_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "accum_1_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_1_2_reload", "role": "default" }} , 
 	{ "name": "accum_0_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_0_2_reload", "role": "default" }} , 
 	{ "name": "select_ln68_1", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "select_ln68_1", "role": "default" }} , 
 	{ "name": "trunc_ln75_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln75_1", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "zext_ln69", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln69", "role": "default" }} , 
 	{ "name": "B_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "B", "role": "address0" }} , 
 	{ "name": "B_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "ce0" }} , 
 	{ "name": "B_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "B", "role": "q0" }} , 
 	{ "name": "accum_1_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_1_4_out", "role": "default" }} , 
 	{ "name": "accum_1_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_1_4_out", "role": "ap_vld" }} , 
 	{ "name": "accum_0_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_0_4_out", "role": "default" }} , 
 	{ "name": "accum_0_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_0_4_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_126_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_126_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_126_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_126_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_126_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_126_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_126_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_126_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_126_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_126_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_391_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_391_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_391_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_391_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_391_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_391_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_391_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_391_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "mmm_accum2_Pipeline_ak",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2184", "EstimateLatencyMax" : "2184",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "accum_1_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_0_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "select_ln68_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln75_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln69", "Type" : "None", "Direction" : "I"},
			{"Name" : "B", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "accum_1_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_0_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "ak", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "17", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage6", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage6_subdone", "QuitState" : "ap_ST_fsm_pp0_stage6", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage6_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mmm_accum2_Pipeline_ak {
		accum_1_2_reload {Type I LastRead 0 FirstWrite -1}
		accum_0_2_reload {Type I LastRead 0 FirstWrite -1}
		select_ln68_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln75_1 {Type I LastRead 0 FirstWrite -1}
		A {Type I LastRead 0 FirstWrite -1}
		zext_ln69 {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}
		accum_1_4_out {Type O LastRead -1 FirstWrite 6}
		accum_0_4_out {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2184", "Max" : "2184"}
	, {"Name" : "Interval", "Min" : "2184", "Max" : "2184"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	accum_1_2_reload { ap_none {  { accum_1_2_reload in_data 0 32 } } }
	accum_0_2_reload { ap_none {  { accum_0_2_reload in_data 0 32 } } }
	select_ln68_1 { ap_none {  { select_ln68_1 in_data 0 9 } } }
	trunc_ln75_1 { ap_none {  { trunc_ln75_1 in_data 0 1 } } }
	A { ap_memory {  { A_address0 mem_address 1 15 }  { A_ce0 mem_ce 1 1 }  { A_q0 in_data 0 64 } } }
	zext_ln69 { ap_none {  { zext_ln69 in_data 0 9 } } }
	B { ap_memory {  { B_address0 mem_address 1 15 }  { B_ce0 mem_ce 1 1 }  { B_q0 in_data 0 64 } } }
	accum_1_4_out { ap_vld {  { accum_1_4_out out_data 1 32 }  { accum_1_4_out_ap_vld out_vld 1 1 } } }
	accum_0_4_out { ap_vld {  { accum_0_4_out out_data 1 32 }  { accum_0_4_out_ap_vld out_vld 1 1 } } }
}
