set moduleName reduce_accum4_ii_is_3
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
set C_modelName {reduce_accum4_ii_is_3}
set C_modelType { float 32 }
set C_modelArgList {
	{ A int 32 regular {array 1024 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_address0 sc_out sc_lv 10 signal 0 } 
	{ A_ce0 sc_out sc_logic 1 signal 0 } 
	{ A_q0 sc_in sc_lv 32 signal 0 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
	{ grp_fu_101_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_101_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_101_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_101_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_101_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }} , 
 	{ "name": "grp_fu_101_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_101_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_101_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_101_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_101_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_101_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_101_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_101_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_101_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_101_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3"],
		"CDFG" : "reduce_accum4_ii_is_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9252", "EstimateLatencyMax" : "9252",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_reduce_accum4_ii_is_3_Pipeline_accum4_fu_78", "Port" : "A", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_Pipeline_1_fu_66", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "reduce_accum4_ii_is_3_Pipeline_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "accum_3_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_2_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_1_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_0_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_load_1145_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_load_1041_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_load_937_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_load33_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_Pipeline_1_fu_66.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_Pipeline_accum4_fu_78", "Parent" : "0", "Child" : ["4", "5"],
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
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_Pipeline_accum4_fu_78.mux_42_32_1_1_U22", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_Pipeline_accum4_fu_78.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"}]}


set ArgLastReadFirstWriteLatency {
	reduce_accum4_ii_is_3 {
		A {Type I LastRead 0 FirstWrite -1}}
	reduce_accum4_ii_is_3_Pipeline_1 {
		accum_3_0_out {Type O LastRead -1 FirstWrite 0}
		accum_2_0_out {Type O LastRead -1 FirstWrite 0}
		accum_1_0_out {Type O LastRead -1 FirstWrite 0}
		accum_0_0_out {Type O LastRead -1 FirstWrite 0}
		accum_load_1145_out {Type O LastRead -1 FirstWrite 0}
		accum_load_1041_out {Type O LastRead -1 FirstWrite 0}
		accum_load_937_out {Type O LastRead -1 FirstWrite 0}
		accum_load33_out {Type O LastRead -1 FirstWrite 0}}
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
	{"Name" : "Latency", "Min" : "9252", "Max" : "9252"}
	, {"Name" : "Interval", "Min" : "9252", "Max" : "9252"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	A { ap_memory {  { A_address0 mem_address 1 10 }  { A_ce0 mem_ce 1 1 }  { A_q0 mem_dout 0 32 } } }
}
