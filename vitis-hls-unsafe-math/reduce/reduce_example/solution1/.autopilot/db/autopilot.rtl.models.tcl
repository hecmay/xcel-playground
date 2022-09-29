set SynModuleInfo {
  {SRCNAME reduce_basic_ii_is_3 MODELNAME reduce_basic_ii_is_3 RTLNAME top_reduce_basic_ii_is_3
    SUBMODULES {
      {MODELNAME top_flow_control_loop_pipe_sequential_init RTLNAME top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME reduce_accum2_ii_is_4_Pipeline_1 MODELNAME reduce_accum2_ii_is_4_Pipeline_1 RTLNAME top_reduce_accum2_ii_is_4_Pipeline_1}
  {SRCNAME reduce_accum2_ii_is_4_Pipeline_accum2 MODELNAME reduce_accum2_ii_is_4_Pipeline_accum2 RTLNAME top_reduce_accum2_ii_is_4_Pipeline_accum2}
  {SRCNAME reduce_accum2_ii_is_4 MODELNAME reduce_accum2_ii_is_4 RTLNAME top_reduce_accum2_ii_is_4}
  {SRCNAME reduce_accum4_ii_is_3_Pipeline_1 MODELNAME reduce_accum4_ii_is_3_Pipeline_1 RTLNAME top_reduce_accum4_ii_is_3_Pipeline_1}
  {SRCNAME reduce_accum4_ii_is_3_Pipeline_accum4 MODELNAME reduce_accum4_ii_is_3_Pipeline_accum4 RTLNAME top_reduce_accum4_ii_is_3_Pipeline_accum4
    SUBMODULES {
      {MODELNAME top_mux_42_32_1_1 RTLNAME top_mux_42_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME reduce_accum4_ii_is_3 MODELNAME reduce_accum4_ii_is_3 RTLNAME top_reduce_accum4_ii_is_3}
  {SRCNAME reduce_accum8_ii_is_1_Pipeline_1 MODELNAME reduce_accum8_ii_is_1_Pipeline_1 RTLNAME top_reduce_accum8_ii_is_1_Pipeline_1}
  {SRCNAME reduce_accum8_ii_is_1_Pipeline_accum8 MODELNAME reduce_accum8_ii_is_1_Pipeline_accum8 RTLNAME top_reduce_accum8_ii_is_1_Pipeline_accum8}
  {SRCNAME reduce_accum8_ii_is_1 MODELNAME reduce_accum8_ii_is_1 RTLNAME top_reduce_accum8_ii_is_1
    SUBMODULES {
      {MODELNAME top_reduce_accum8_ii_is_1_accum_RAM_AUTO_1R1W RTLNAME top_reduce_accum8_ii_is_1_accum_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME top MODELNAME top RTLNAME top IS_TOP 1
    SUBMODULES {
      {MODELNAME top_fadd_32ns_32ns_32_8_full_dsp_1 RTLNAME top_fadd_32ns_32ns_32_8_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 7 ALLOW_PRAGMA 1}
    }
  }
}
