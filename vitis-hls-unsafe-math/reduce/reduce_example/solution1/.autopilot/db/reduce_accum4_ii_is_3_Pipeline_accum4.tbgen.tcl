set moduleName reduce_accum4_ii_is_3_Pipeline_accum4
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
set C_modelName {reduce_accum4_ii_is_3_Pipeline_accum4}
set C_modelType { void 0 }
set C_modelArgList {
	{ accum_3_0_reload float 32 regular  }
	{ accum_2_0_reload float 32 regular  }
	{ accum_1_0_reload float 32 regular  }
	{ accum_0_0_reload float 32 regular  }
	{ accum_load_1145_reload float 32 regular  }
	{ accum_load_1041_reload float 32 regular  }
	{ accum_load_937_reload float 32 regular  }
	{ accum_load33_reload float 32 regular  }
	{ A int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ accum_load_11_out float 32 regular {pointer 1}  }
	{ accum_load_10_out float 32 regular {pointer 1}  }
	{ accum_load_9_out float 32 regular {pointer 1}  }
	{ accum_load_out float 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "accum_3_0_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "accum_2_0_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "accum_1_0_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "accum_0_0_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "accum_load_1145_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "accum_load_1041_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "accum_load_937_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "accum_load33_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "accum_load_11_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_load_10_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_load_9_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_load_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 30
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ accum_3_0_reload sc_in sc_lv 32 signal 0 } 
	{ accum_2_0_reload sc_in sc_lv 32 signal 1 } 
	{ accum_1_0_reload sc_in sc_lv 32 signal 2 } 
	{ accum_0_0_reload sc_in sc_lv 32 signal 3 } 
	{ accum_load_1145_reload sc_in sc_lv 32 signal 4 } 
	{ accum_load_1041_reload sc_in sc_lv 32 signal 5 } 
	{ accum_load_937_reload sc_in sc_lv 32 signal 6 } 
	{ accum_load33_reload sc_in sc_lv 32 signal 7 } 
	{ A_address0 sc_out sc_lv 10 signal 8 } 
	{ A_ce0 sc_out sc_logic 1 signal 8 } 
	{ A_q0 sc_in sc_lv 32 signal 8 } 
	{ accum_load_11_out sc_out sc_lv 32 signal 9 } 
	{ accum_load_11_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ accum_load_10_out sc_out sc_lv 32 signal 10 } 
	{ accum_load_10_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ accum_load_9_out sc_out sc_lv 32 signal 11 } 
	{ accum_load_9_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ accum_load_out sc_out sc_lv 32 signal 12 } 
	{ accum_load_out_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ grp_fu_96_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_96_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_96_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_96_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_96_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "accum_3_0_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_3_0_reload", "role": "default" }} , 
 	{ "name": "accum_2_0_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_2_0_reload", "role": "default" }} , 
 	{ "name": "accum_1_0_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_1_0_reload", "role": "default" }} , 
 	{ "name": "accum_0_0_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_0_0_reload", "role": "default" }} , 
 	{ "name": "accum_load_1145_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_1145_reload", "role": "default" }} , 
 	{ "name": "accum_load_1041_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_1041_reload", "role": "default" }} , 
 	{ "name": "accum_load_937_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_937_reload", "role": "default" }} , 
 	{ "name": "accum_load33_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load33_reload", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "accum_load_11_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_11_out", "role": "default" }} , 
 	{ "name": "accum_load_11_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_load_11_out", "role": "ap_vld" }} , 
 	{ "name": "accum_load_10_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_10_out", "role": "default" }} , 
 	{ "name": "accum_load_10_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_load_10_out", "role": "ap_vld" }} , 
 	{ "name": "accum_load_9_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_9_out", "role": "default" }} , 
 	{ "name": "accum_load_9_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_load_9_out", "role": "ap_vld" }} , 
 	{ "name": "accum_load_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_out", "role": "default" }} , 
 	{ "name": "accum_load_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_load_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_96_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_96_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_96_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_96_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_96_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_96_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_96_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_96_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_96_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_96_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "reduce_accum4_ii_is_3_Pipeline_accum4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9219", "EstimateLatencyMax" : "9219",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "accum_3_0_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_2_0_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_1_0_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_0_0_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_load_1145_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_load_1041_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_load_937_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_load33_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "accum_load_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_load_10_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_load_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_load_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "accum4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_42_32_1_1_U22", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	reduce_accum4_ii_is_3_Pipeline_accum4 {
		accum_3_0_reload {Type I LastRead 0 FirstWrite -1}
		accum_2_0_reload {Type I LastRead 0 FirstWrite -1}
		accum_1_0_reload {Type I LastRead 0 FirstWrite -1}
		accum_0_0_reload {Type I LastRead 0 FirstWrite -1}
		accum_load_1145_reload {Type I LastRead 0 FirstWrite -1}
		accum_load_1041_reload {Type I LastRead 0 FirstWrite -1}
		accum_load_937_reload {Type I LastRead 0 FirstWrite -1}
		accum_load33_reload {Type I LastRead 0 FirstWrite -1}
		A {Type I LastRead 0 FirstWrite -1}
		accum_load_11_out {Type O LastRead -1 FirstWrite 1}
		accum_load_10_out {Type O LastRead -1 FirstWrite 1}
		accum_load_9_out {Type O LastRead -1 FirstWrite 1}
		accum_load_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "9219", "Max" : "9219"}
	, {"Name" : "Interval", "Min" : "9219", "Max" : "9219"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	accum_3_0_reload { ap_none {  { accum_3_0_reload in_data 0 32 } } }
	accum_2_0_reload { ap_none {  { accum_2_0_reload in_data 0 32 } } }
	accum_1_0_reload { ap_none {  { accum_1_0_reload in_data 0 32 } } }
	accum_0_0_reload { ap_none {  { accum_0_0_reload in_data 0 32 } } }
	accum_load_1145_reload { ap_none {  { accum_load_1145_reload in_data 0 32 } } }
	accum_load_1041_reload { ap_none {  { accum_load_1041_reload in_data 0 32 } } }
	accum_load_937_reload { ap_none {  { accum_load_937_reload in_data 0 32 } } }
	accum_load33_reload { ap_none {  { accum_load33_reload in_data 0 32 } } }
	A { ap_memory {  { A_address0 mem_address 1 10 }  { A_ce0 mem_ce 1 1 }  { A_q0 mem_dout 0 32 } } }
	accum_load_11_out { ap_vld {  { accum_load_11_out out_data 1 32 }  { accum_load_11_out_ap_vld out_vld 1 1 } } }
	accum_load_10_out { ap_vld {  { accum_load_10_out out_data 1 32 }  { accum_load_10_out_ap_vld out_vld 1 1 } } }
	accum_load_9_out { ap_vld {  { accum_load_9_out out_data 1 32 }  { accum_load_9_out_ap_vld out_vld 1 1 } } }
	accum_load_out { ap_vld {  { accum_load_out out_data 1 32 }  { accum_load_out_ap_vld out_vld 1 1 } } }
}
