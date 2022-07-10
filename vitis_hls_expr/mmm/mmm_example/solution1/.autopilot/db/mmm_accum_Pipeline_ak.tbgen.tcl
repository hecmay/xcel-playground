set moduleName mmm_accum_Pipeline_ak
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
set C_modelName {mmm_accum_Pipeline_ak}
set C_modelType { void 0 }
set C_modelArgList {
	{ select_ln48_1 int 9 regular  }
	{ trunc_ln55 int 1 regular  }
	{ A int 64 regular {array 32768 { 1 3 } 1 1 }  }
	{ zext_ln49 int 9 regular  }
	{ B int 64 regular {array 32768 { 1 3 } 1 1 }  }
	{ accum_out float 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "select_ln48_1", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln55", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln49", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "B", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "accum_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ select_ln48_1 sc_in sc_lv 9 signal 0 } 
	{ trunc_ln55 sc_in sc_lv 1 signal 1 } 
	{ A_address0 sc_out sc_lv 15 signal 2 } 
	{ A_ce0 sc_out sc_logic 1 signal 2 } 
	{ A_q0 sc_in sc_lv 64 signal 2 } 
	{ zext_ln49 sc_in sc_lv 9 signal 3 } 
	{ B_address0 sc_out sc_lv 15 signal 4 } 
	{ B_ce0 sc_out sc_logic 1 signal 4 } 
	{ B_q0 sc_in sc_lv 64 signal 4 } 
	{ accum_out sc_out sc_lv 32 signal 5 } 
	{ accum_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ grp_fu_93_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_93_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_93_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_93_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_93_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_282_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_282_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_282_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_282_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "select_ln48_1", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "select_ln48_1", "role": "default" }} , 
 	{ "name": "trunc_ln55", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln55", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "zext_ln49", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln49", "role": "default" }} , 
 	{ "name": "B_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "B", "role": "address0" }} , 
 	{ "name": "B_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "ce0" }} , 
 	{ "name": "B_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "B", "role": "q0" }} , 
 	{ "name": "accum_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_out", "role": "default" }} , 
 	{ "name": "accum_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_93_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_93_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_93_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_93_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_93_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_93_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_93_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_93_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_93_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_93_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_282_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_282_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_282_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_282_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_282_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_282_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_282_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_282_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "mmm_accum_Pipeline_ak",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2057", "EstimateLatencyMax" : "2057",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "select_ln48_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln55", "Type" : "None", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "zext_ln49", "Type" : "None", "Direction" : "I"},
			{"Name" : "B", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "accum_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "ak", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "16", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage7", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage7_subdone", "QuitState" : "ap_ST_fsm_pp0_stage7", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage7_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mmm_accum_Pipeline_ak {
		select_ln48_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln55 {Type I LastRead 0 FirstWrite -1}
		A {Type I LastRead 0 FirstWrite -1}
		zext_ln49 {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}
		accum_out {Type O LastRead -1 FirstWrite 7}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2057", "Max" : "2057"}
	, {"Name" : "Interval", "Min" : "2057", "Max" : "2057"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	select_ln48_1 { ap_none {  { select_ln48_1 in_data 0 9 } } }
	trunc_ln55 { ap_none {  { trunc_ln55 in_data 0 1 } } }
	A { ap_memory {  { A_address0 mem_address 1 15 }  { A_ce0 mem_ce 1 1 }  { A_q0 in_data 0 64 } } }
	zext_ln49 { ap_none {  { zext_ln49 in_data 0 9 } } }
	B { ap_memory {  { B_address0 mem_address 1 15 }  { B_ce0 mem_ce 1 1 }  { B_q0 in_data 0 64 } } }
	accum_out { ap_vld {  { accum_out out_data 1 32 }  { accum_out_ap_vld out_vld 1 1 } } }
}
