set moduleName top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {top}
set C_modelType { void 0 }
set C_modelArgList {
	{ A int 32 regular {array 1024 { 1 3 } 1 1 }  }
	{ B int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "B", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_local_deadlock sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_address0 sc_out sc_lv 10 signal 0 } 
	{ A_ce0 sc_out sc_logic 1 signal 0 } 
	{ A_q0 sc_in sc_lv 32 signal 0 } 
	{ B sc_out sc_lv 32 signal 1 } 
	{ B_ap_vld sc_out sc_logic 1 outvld 1 } 
}
set NewPortList {[ 
	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_local_deadlock", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_deadlock", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "q0" }} , 
 	{ "name": "B", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "default" }} , 
 	{ "name": "B_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "B", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "8", "14", "20", "21"],
		"CDFG" : "top",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "28843", "EstimateLatencyMax" : "28843",
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
					{"ID" : "3", "SubInstance" : "grp_reduce_accum2_ii_is_4_fu_47", "Port" : "A", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "1", "SubInstance" : "grp_reduce_basic_ii_is_3_fu_41", "Port" : "A", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "8", "SubInstance" : "grp_reduce_accum4_ii_is_3_fu_53", "Port" : "A", "Inst_start_state" : "16", "Inst_end_state" : "17"},
					{"ID" : "14", "SubInstance" : "grp_reduce_accum8_ii_is_1_fu_59", "Port" : "A", "Inst_start_state" : "24", "Inst_end_state" : "25"}]},
			{"Name" : "B", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reduce_basic_ii_is_3_fu_41", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "reduce_basic_ii_is_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8196", "EstimateLatencyMax" : "8196",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "basic", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "8", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_basic_ii_is_3_fu_41.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum2_ii_is_4_fu_47", "Parent" : "0", "Child" : ["4", "6"],
		"CDFG" : "reduce_accum2_ii_is_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "9234", "EstimateLatencyMax" : "9234",
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
					{"ID" : "6", "SubInstance" : "grp_reduce_accum2_ii_is_4_Pipeline_accum2_fu_40", "Port" : "A", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum2_ii_is_4_fu_47.grp_reduce_accum2_ii_is_4_Pipeline_1_fu_34", "Parent" : "3", "Child" : ["5"],
		"CDFG" : "reduce_accum2_ii_is_4_Pipeline_1",
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
			{"Name" : "accum_1_0_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_0_0_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "NotSupport"}]},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum2_ii_is_4_fu_47.grp_reduce_accum2_ii_is_4_Pipeline_1_fu_34.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum2_ii_is_4_fu_47.grp_reduce_accum2_ii_is_4_Pipeline_accum2_fu_40", "Parent" : "3", "Child" : ["7"],
		"CDFG" : "reduce_accum2_ii_is_4_Pipeline_accum2",
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
			{"Name" : "accum_1_0_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "accum_0_0_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "accum_1_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "accum_0_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "accum2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum2_ii_is_4_fu_47.grp_reduce_accum2_ii_is_4_Pipeline_accum2_fu_40.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_fu_53", "Parent" : "0", "Child" : ["9", "11"],
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
					{"ID" : "11", "SubInstance" : "grp_reduce_accum4_ii_is_3_Pipeline_accum4_fu_78", "Port" : "A", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_fu_53.grp_reduce_accum4_ii_is_3_Pipeline_1_fu_66", "Parent" : "8", "Child" : ["10"],
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
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_fu_53.grp_reduce_accum4_ii_is_3_Pipeline_1_fu_66.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_fu_53.grp_reduce_accum4_ii_is_3_Pipeline_accum4_fu_78", "Parent" : "8", "Child" : ["12", "13"],
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
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_fu_53.grp_reduce_accum4_ii_is_3_Pipeline_accum4_fu_78.mux_42_32_1_1_U22", "Parent" : "11"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum4_ii_is_3_fu_53.grp_reduce_accum4_ii_is_3_Pipeline_accum4_fu_78.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum8_ii_is_1_fu_59", "Parent" : "0", "Child" : ["15", "16", "18"],
		"CDFG" : "reduce_accum8_ii_is_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2129", "EstimateLatencyMax" : "2129",
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
					{"ID" : "18", "SubInstance" : "grp_reduce_accum8_ii_is_1_Pipeline_accum8_fu_115", "Port" : "A", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum8_ii_is_1_fu_59.accum_U", "Parent" : "14"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum8_ii_is_1_fu_59.grp_reduce_accum8_ii_is_1_Pipeline_1_fu_109", "Parent" : "14", "Child" : ["17"],
		"CDFG" : "reduce_accum8_ii_is_1_Pipeline_1",
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
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum8_ii_is_1_fu_59.grp_reduce_accum8_ii_is_1_Pipeline_1_fu_109.flow_control_loop_pipe_sequential_init_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum8_ii_is_1_fu_59.grp_reduce_accum8_ii_is_1_Pipeline_accum8_fu_115", "Parent" : "14", "Child" : ["19"],
		"CDFG" : "reduce_accum8_ii_is_1_Pipeline_accum8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2058", "EstimateLatencyMax" : "2058",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "A", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "accum", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "accum8", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_reduce_accum8_ii_is_1_fu_59.grp_reduce_accum8_ii_is_1_Pipeline_accum8_fu_115.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_8_full_dsp_1_U46", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_8_full_dsp_1_U47", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	top {
		A {Type I LastRead 0 FirstWrite -1}
		B {Type O LastRead -1 FirstWrite 32}}
	reduce_basic_ii_is_3 {
		A {Type I LastRead 0 FirstWrite -1}}
	reduce_accum2_ii_is_4 {
		A {Type I LastRead 0 FirstWrite -1}}
	reduce_accum2_ii_is_4_Pipeline_1 {
		accum_1_0_out {Type O LastRead -1 FirstWrite 0}
		accum_0_0_out {Type O LastRead -1 FirstWrite 0}}
	reduce_accum2_ii_is_4_Pipeline_accum2 {
		accum_1_0_reload {Type I LastRead 0 FirstWrite -1}
		accum_0_0_reload {Type I LastRead 0 FirstWrite -1}
		A {Type I LastRead 0 FirstWrite -1}
		accum_1_2_out {Type O LastRead -1 FirstWrite 1}
		accum_0_2_out {Type O LastRead -1 FirstWrite 1}}
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
		accum_load_out {Type O LastRead -1 FirstWrite 1}}
	reduce_accum8_ii_is_1 {
		A {Type I LastRead 0 FirstWrite -1}}
	reduce_accum8_ii_is_1_Pipeline_1 {
		accum {Type O LastRead -1 FirstWrite 0}}
	reduce_accum8_ii_is_1_Pipeline_accum8 {
		A {Type I LastRead 0 FirstWrite -1}
		accum {Type IO LastRead 0 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "28843", "Max" : "28843"}
	, {"Name" : "Interval", "Min" : "28844", "Max" : "28844"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	A { ap_memory {  { A_address0 mem_address 1 10 }  { A_ce0 mem_ce 1 1 }  { A_q0 mem_dout 0 32 } } }
	B { ap_vld {  { B out_data 1 32 }  { B_ap_vld out_vld 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
