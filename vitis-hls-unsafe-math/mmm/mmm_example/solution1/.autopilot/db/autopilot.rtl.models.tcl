set SynModuleInfo {
  {SRCNAME mmm_basic_Pipeline_ak MODELNAME mmm_basic_Pipeline_ak RTLNAME top_mmm_basic_Pipeline_ak
    SUBMODULES {
      {MODELNAME top_flow_control_loop_pipe_sequential_init RTLNAME top_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME top_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME mmm_basic MODELNAME mmm_basic RTLNAME top_mmm_basic}
  {SRCNAME mmm_accum2_Pipeline_1 MODELNAME mmm_accum2_Pipeline_1 RTLNAME top_mmm_accum2_Pipeline_1}
  {SRCNAME mmm_accum2_Pipeline_ak MODELNAME mmm_accum2_Pipeline_ak RTLNAME top_mmm_accum2_Pipeline_ak}
  {SRCNAME mmm_accum2 MODELNAME mmm_accum2 RTLNAME top_mmm_accum2}
  {SRCNAME mmm_accum_Pipeline_ak MODELNAME mmm_accum_Pipeline_ak RTLNAME top_mmm_accum_Pipeline_ak}
  {SRCNAME mmm_accum MODELNAME mmm_accum RTLNAME top_mmm_accum}
  {SRCNAME mmm_voodoo_Pipeline_1 MODELNAME mmm_voodoo_Pipeline_1 RTLNAME top_mmm_voodoo_Pipeline_1}
  {SRCNAME mmm_voodoo_Pipeline_ak MODELNAME mmm_voodoo_Pipeline_ak RTLNAME top_mmm_voodoo_Pipeline_ak}
  {SRCNAME mmm_voodoo MODELNAME mmm_voodoo RTLNAME top_mmm_voodoo
    SUBMODULES {
      {MODELNAME top_mmm_voodoo_accum_RAM_AUTO_1R1W RTLNAME top_mmm_voodoo_accum_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME top MODELNAME top RTLNAME top IS_TOP 1
    SUBMODULES {
      {MODELNAME top_fadd_32ns_32ns_32_8_full_dsp_1 RTLNAME top_fadd_32ns_32ns_32_8_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 7 ALLOW_PRAGMA 1}
      {MODELNAME top_fmul_32ns_32ns_32_5_max_dsp_1 RTLNAME top_fmul_32ns_32ns_32_5_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 4 ALLOW_PRAGMA 1}
    }
  }
}
