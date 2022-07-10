set moduleName reduce_accum4_ii_is_3_Pipeline_1
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
set C_modelName {reduce_accum4_ii_is_3_Pipeline_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ accum_3_0_out float 32 regular {pointer 1}  }
	{ accum_2_0_out float 32 regular {pointer 1}  }
	{ accum_1_0_out float 32 regular {pointer 1}  }
	{ accum_0_0_out float 32 regular {pointer 1}  }
	{ accum_load_1145_out float 32 regular {pointer 1}  }
	{ accum_load_1041_out float 32 regular {pointer 1}  }
	{ accum_load_937_out float 32 regular {pointer 1}  }
	{ accum_load33_out float 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "accum_3_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_2_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_1_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_0_0_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_load_1145_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_load_1041_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_load_937_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "accum_load33_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ accum_3_0_out sc_out sc_lv 32 signal 0 } 
	{ accum_3_0_out_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ accum_2_0_out sc_out sc_lv 32 signal 1 } 
	{ accum_2_0_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ accum_1_0_out sc_out sc_lv 32 signal 2 } 
	{ accum_1_0_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ accum_0_0_out sc_out sc_lv 32 signal 3 } 
	{ accum_0_0_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ accum_load_1145_out sc_out sc_lv 32 signal 4 } 
	{ accum_load_1145_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ accum_load_1041_out sc_out sc_lv 32 signal 5 } 
	{ accum_load_1041_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ accum_load_937_out sc_out sc_lv 32 signal 6 } 
	{ accum_load_937_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ accum_load33_out sc_out sc_lv 32 signal 7 } 
	{ accum_load33_out_ap_vld sc_out sc_logic 1 outvld 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "accum_3_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_3_0_out", "role": "default" }} , 
 	{ "name": "accum_3_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_3_0_out", "role": "ap_vld" }} , 
 	{ "name": "accum_2_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_2_0_out", "role": "default" }} , 
 	{ "name": "accum_2_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_2_0_out", "role": "ap_vld" }} , 
 	{ "name": "accum_1_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_1_0_out", "role": "default" }} , 
 	{ "name": "accum_1_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_1_0_out", "role": "ap_vld" }} , 
 	{ "name": "accum_0_0_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_0_0_out", "role": "default" }} , 
 	{ "name": "accum_0_0_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_0_0_out", "role": "ap_vld" }} , 
 	{ "name": "accum_load_1145_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_1145_out", "role": "default" }} , 
 	{ "name": "accum_load_1145_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_load_1145_out", "role": "ap_vld" }} , 
 	{ "name": "accum_load_1041_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_1041_out", "role": "default" }} , 
 	{ "name": "accum_load_1041_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_load_1041_out", "role": "ap_vld" }} , 
 	{ "name": "accum_load_937_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load_937_out", "role": "default" }} , 
 	{ "name": "accum_load_937_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_load_937_out", "role": "ap_vld" }} , 
 	{ "name": "accum_load33_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "accum_load33_out", "role": "default" }} , 
 	{ "name": "accum_load33_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "accum_load33_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	reduce_accum4_ii_is_3_Pipeline_1 {
		accum_3_0_out {Type O LastRead -1 FirstWrite 0}
		accum_2_0_out {Type O LastRead -1 FirstWrite 0}
		accum_1_0_out {Type O LastRead -1 FirstWrite 0}
		accum_0_0_out {Type O LastRead -1 FirstWrite 0}
		accum_load_1145_out {Type O LastRead -1 FirstWrite 0}
		accum_load_1041_out {Type O LastRead -1 FirstWrite 0}
		accum_load_937_out {Type O LastRead -1 FirstWrite 0}
		accum_load33_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "6", "Max" : "6"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	accum_3_0_out { ap_vld {  { accum_3_0_out out_data 1 32 }  { accum_3_0_out_ap_vld out_vld 1 1 } } }
	accum_2_0_out { ap_vld {  { accum_2_0_out out_data 1 32 }  { accum_2_0_out_ap_vld out_vld 1 1 } } }
	accum_1_0_out { ap_vld {  { accum_1_0_out out_data 1 32 }  { accum_1_0_out_ap_vld out_vld 1 1 } } }
	accum_0_0_out { ap_vld {  { accum_0_0_out out_data 1 32 }  { accum_0_0_out_ap_vld out_vld 1 1 } } }
	accum_load_1145_out { ap_vld {  { accum_load_1145_out out_data 1 32 }  { accum_load_1145_out_ap_vld out_vld 1 1 } } }
	accum_load_1041_out { ap_vld {  { accum_load_1041_out out_data 1 32 }  { accum_load_1041_out_ap_vld out_vld 1 1 } } }
	accum_load_937_out { ap_vld {  { accum_load_937_out out_data 1 32 }  { accum_load_937_out_ap_vld out_vld 1 1 } } }
	accum_load33_out { ap_vld {  { accum_load33_out out_data 1 32 }  { accum_load33_out_ap_vld out_vld 1 1 } } }
}
