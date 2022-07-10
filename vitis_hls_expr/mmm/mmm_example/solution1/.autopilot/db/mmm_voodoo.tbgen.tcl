set moduleName mmm_voodoo
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {mmm_voodoo}
set C_modelType { void 0 }
set C_modelArgList {
	{ C int 32 regular {array 65536 { 0 3 } 0 1 }  }
	{ A int 64 regular {array 32768 { 1 3 } 1 1 }  }
	{ B int 64 regular {array 32768 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "C", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "B", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ C_address0 sc_out sc_lv 16 signal 0 } 
	{ C_ce0 sc_out sc_logic 1 signal 0 } 
	{ C_we0 sc_out sc_logic 1 signal 0 } 
	{ C_d0 sc_out sc_lv 32 signal 0 } 
	{ A_address0 sc_out sc_lv 15 signal 1 } 
	{ A_ce0 sc_out sc_logic 1 signal 1 } 
	{ A_q0 sc_in sc_lv 64 signal 1 } 
	{ B_address0 sc_out sc_lv 15 signal 2 } 
	{ B_ce0 sc_out sc_logic 1 signal 2 } 
	{ B_q0 sc_in sc_lv 64 signal 2 } 
	{ grp_fu_70_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_70_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_70_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_70_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_70_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_74_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_74_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_74_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_74_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "C_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "C", "role": "address0" }} , 
 	{ "name": "C_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "ce0" }} , 
 	{ "name": "C_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "we0" }} , 
 	{ "name": "C_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "d0" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "B_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "B", "role": "address0" }} , 
 	{ "name": "B_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "ce0" }} , 
 	{ "name": "B_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "B", "role": "q0" }} , 
 	{ "name": "grp_fu_70_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_70_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_70_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_70_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_70_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_70_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_70_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_70_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_70_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_70_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_74_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_74_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_74_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_74_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_74_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_74_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_74_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_74_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "4"],
		"CDFG" : "mmm_voodoo",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12124161", "EstimateLatencyMax" : "12124161",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "C", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_mmm_voodoo_Pipeline_ak_fu_113", "Port" : "A", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "B", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_mmm_voodoo_Pipeline_ak_fu_113", "Port" : "B", "Inst_start_state" : "4", "Inst_end_state" : "5"}]}],
		"Loop" : [
			{"Name" : "ai_aj", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "24", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.accum_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mmm_voodoo_Pipeline_1_fu_108", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "mmm_voodoo_Pipeline_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "accum", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mmm_voodoo_Pipeline_1_fu_108.flow_control_loop_pipe_sequential_init_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mmm_voodoo_Pipeline_ak_fu_113", "Parent" : "0", "Child" : ["5", "6", "7"],
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
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mmm_voodoo_Pipeline_ak_fu_113.fadd_32ns_32ns_32_8_full_dsp_1_U49", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mmm_voodoo_Pipeline_ak_fu_113.fmul_32ns_32ns_32_5_max_dsp_1_U51", "Parent" : "4"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mmm_voodoo_Pipeline_ak_fu_113.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"}]}


set ArgLastReadFirstWriteLatency {
	mmm_voodoo {
		C {Type O LastRead -1 FirstWrite 23}
		A {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}}
	mmm_voodoo_Pipeline_1 {
		accum {Type O LastRead -1 FirstWrite 0}}
	mmm_voodoo_Pipeline_ak {
		select_ln88_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln95 {Type I LastRead 0 FirstWrite -1}
		A {Type I LastRead 0 FirstWrite -1}
		zext_ln89 {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}
		accum {Type IO LastRead 5 FirstWrite 23}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "12124161", "Max" : "12124161"}
	, {"Name" : "Interval", "Min" : "12124161", "Max" : "12124161"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	C { ap_memory {  { C_address0 mem_address 1 16 }  { C_ce0 mem_ce 1 1 }  { C_we0 mem_we 1 1 }  { C_d0 mem_din 1 32 } } }
	A { ap_memory {  { A_address0 mem_address 1 15 }  { A_ce0 mem_ce 1 1 }  { A_q0 mem_dout 0 64 } } }
	B { ap_memory {  { B_address0 mem_address 1 15 }  { B_ce0 mem_ce 1 1 }  { B_q0 mem_dout 0 64 } } }
}
