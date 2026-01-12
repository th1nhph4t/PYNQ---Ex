set SynModuleInfo {
  {SRCNAME lc3 MODELNAME lc3 RTLNAME lc3 IS_TOP 1
    SUBMODULES {
      {MODELNAME lc3_reg_r_RAM_AUTO_1R1W RTLNAME lc3_reg_r_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lc3_memory_RAM_AUTO_1R1W RTLNAME lc3_memory_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME lc3_control_s_axi RTLNAME lc3_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
