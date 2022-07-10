set moduleName mmm_accum2
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
set C_modelName {mmm_accum2}
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3"],
		"CDFG" : "mmm_accum2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "144769025", "EstimateLatencyMax" : "144769025",
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
					{"ID" : "3", "SubInstance" : "grp_mmm_accum2_Pipeline_ak_fu_111", "Port" : "A", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "B", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_mmm_accum2_Pipeline_ak_fu_111", "Port" : "B", "Inst_start_state" : "4", "Inst_end_state" : "5"}]}],
		"Loop" : [
			{"Name" : "ai_aj", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "22", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mmm_accum2_Pipeline_1_fu_103", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "mmm_accum2_Pipeline_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "accum_1_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_0_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_0_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mmm_accum2_Pipeline_1_fu_103.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_mmm_accum2_Pipeline_ak_fu_111", "Parent" : "0", "Child" : ["4"],
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
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_mmm_accum2_Pipeline_ak_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"}]}


set ArgLastReadFirstWriteLatency {
	mmm_accum2 {
		C {Type O LastRead -1 FirstWrite 21}
		A {Type I LastRead 0 FirstWrite -1}
		B {Type I LastRead 0 FirstWrite -1}}
	mmm_accum2_Pipeline_1 {
		accum_1_1 {Type I LastRead 0 FirstWrite -1}
		accum_0_1 {Type I LastRead 0 FirstWrite -1}
		accum_1_2_out {Type O LastRead -1 FirstWrite 1}
		accum_0_2_out {Type O LastRead -1 FirstWrite 1}}
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
	{"Name" : "Latency", "Min" : "144769025", "Max" : "144769025"}
	, {"Name" : "Interval", "Min" : "144769025", "Max" : "144769025"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	C { ap_memory {  { C_address0 mem_address 1 16 }  { C_ce0 mem_ce 1 1 }  { C_we0 mem_we 1 1 }  { C_d0 mem_din 1 32 } } }
	A { ap_memory {  { A_address0 mem_address 1 15 }  { A_ce0 mem_ce 1 1 }  { A_q0 mem_dout 0 64 } } }
	B { ap_memory {  { B_address0 mem_address 1 15 }  { B_ce0 mem_ce 1 1 }  { B_q0 mem_dout 0 64 } } }
}
