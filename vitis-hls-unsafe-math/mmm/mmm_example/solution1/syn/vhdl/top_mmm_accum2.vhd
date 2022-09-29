-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_mmm_accum2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    C_address0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    C_ce0 : OUT STD_LOGIC;
    C_we0 : OUT STD_LOGIC;
    C_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    A_address0 : OUT STD_LOGIC_VECTOR (14 downto 0);
    A_ce0 : OUT STD_LOGIC;
    A_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
    B_address0 : OUT STD_LOGIC_VECTOR (14 downto 0);
    B_ce0 : OUT STD_LOGIC;
    B_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
    grp_fu_70_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_70_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_70_p_opcode : OUT STD_LOGIC_VECTOR (1 downto 0);
    grp_fu_70_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_70_p_ce : OUT STD_LOGIC;
    grp_fu_74_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_74_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_74_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
    grp_fu_74_p_ce : OUT STD_LOGIC );
end;


architecture behav of top_mmm_accum2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (21 downto 0) := "0000000001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (21 downto 0) := "0000000010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (21 downto 0) := "0000000100000000000000";
    constant ap_ST_fsm_state16 : STD_LOGIC_VECTOR (21 downto 0) := "0000001000000000000000";
    constant ap_ST_fsm_state17 : STD_LOGIC_VECTOR (21 downto 0) := "0000010000000000000000";
    constant ap_ST_fsm_state18 : STD_LOGIC_VECTOR (21 downto 0) := "0000100000000000000000";
    constant ap_ST_fsm_state19 : STD_LOGIC_VECTOR (21 downto 0) := "0001000000000000000000";
    constant ap_ST_fsm_state20 : STD_LOGIC_VECTOR (21 downto 0) := "0010000000000000000000";
    constant ap_ST_fsm_state21 : STD_LOGIC_VECTOR (21 downto 0) := "0100000000000000000000";
    constant ap_ST_fsm_state22 : STD_LOGIC_VECTOR (21 downto 0) := "1000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_15 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010101";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv17_0 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000000";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv17_10000 : STD_LOGIC_VECTOR (16 downto 0) := "10000000000000000";
    constant ap_const_lv17_1 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000001";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv9_100 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal reg_131 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state13 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state13 : signal is "none";
    signal ap_CS_fsm_state21 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state21 : signal is "none";
    signal select_ln68_fu_197_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal select_ln68_reg_359 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal select_ln68_1_fu_206_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal select_ln68_1_reg_364 : STD_LOGIC_VECTOR (8 downto 0);
    signal trunc_ln75_fu_227_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln75_reg_369 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln72_fu_236_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln72_reg_374 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_mmm_accum2_Pipeline_1_fu_103_ap_start : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_1_fu_103_ap_done : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_1_fu_103_ap_idle : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_1_fu_103_ap_ready : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_1_fu_103_accum_1_2_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mmm_accum2_Pipeline_1_fu_103_accum_1_2_out_ap_vld : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_1_fu_103_accum_0_2_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mmm_accum2_Pipeline_1_fu_103_accum_0_2_out_ap_vld : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_ap_start : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_ap_done : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_ap_idle : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_ap_ready : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_A_address0 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_mmm_accum2_Pipeline_ak_fu_111_A_ce0 : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_B_address0 : STD_LOGIC_VECTOR (14 downto 0);
    signal grp_mmm_accum2_Pipeline_ak_fu_111_B_ce0 : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_accum_1_4_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mmm_accum2_Pipeline_ak_fu_111_accum_1_4_out_ap_vld : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_accum_0_4_out : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mmm_accum2_Pipeline_ak_fu_111_accum_0_4_out_ap_vld : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_din0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_din1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_opcode : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_ce : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_din0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_din1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_ce : STD_LOGIC;
    signal grp_mmm_accum2_Pipeline_1_fu_103_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln68_fu_154_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_mmm_accum2_Pipeline_ak_fu_111_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal zext_ln72_1_fu_284_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state22 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state22 : signal is "none";
    signal j_fu_54 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln69_fu_250_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal accum_0_1_fu_58 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal accum_1_1_fu_62 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_66 : STD_LOGIC_VECTOR (8 downto 0);
    signal indvar_flatten_fu_70 : STD_LOGIC_VECTOR (16 downto 0);
    signal add_ln68_1_fu_160_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal grp_fu_126_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_126_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state14 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state14 : signal is "none";
    signal icmp_ln69_fu_191_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln68_fu_185_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal trunc_ln72_fu_215_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_12_cast_fu_219_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln72_fu_232_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_126_ce : STD_LOGIC;
    signal grp_fu_391_ce : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ST_fsm_state14_blk : STD_LOGIC;
    signal ap_ST_fsm_state15_blk : STD_LOGIC;
    signal ap_ST_fsm_state16_blk : STD_LOGIC;
    signal ap_ST_fsm_state17_blk : STD_LOGIC;
    signal ap_ST_fsm_state18_blk : STD_LOGIC;
    signal ap_ST_fsm_state19_blk : STD_LOGIC;
    signal ap_ST_fsm_state20_blk : STD_LOGIC;
    signal ap_ST_fsm_state21_blk : STD_LOGIC;
    signal ap_ST_fsm_state22_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component top_mmm_accum2_Pipeline_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        accum_1_1 : IN STD_LOGIC_VECTOR (31 downto 0);
        accum_0_1 : IN STD_LOGIC_VECTOR (31 downto 0);
        accum_1_2_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        accum_1_2_out_ap_vld : OUT STD_LOGIC;
        accum_0_2_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        accum_0_2_out_ap_vld : OUT STD_LOGIC );
    end component;


    component top_mmm_accum2_Pipeline_ak IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        accum_1_2_reload : IN STD_LOGIC_VECTOR (31 downto 0);
        accum_0_2_reload : IN STD_LOGIC_VECTOR (31 downto 0);
        select_ln68_1 : IN STD_LOGIC_VECTOR (8 downto 0);
        trunc_ln75_1 : IN STD_LOGIC_VECTOR (0 downto 0);
        A_address0 : OUT STD_LOGIC_VECTOR (14 downto 0);
        A_ce0 : OUT STD_LOGIC;
        A_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
        zext_ln69 : IN STD_LOGIC_VECTOR (8 downto 0);
        B_address0 : OUT STD_LOGIC_VECTOR (14 downto 0);
        B_ce0 : OUT STD_LOGIC;
        B_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
        accum_1_4_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        accum_1_4_out_ap_vld : OUT STD_LOGIC;
        accum_0_4_out : OUT STD_LOGIC_VECTOR (31 downto 0);
        accum_0_4_out_ap_vld : OUT STD_LOGIC;
        grp_fu_126_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_126_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_126_p_opcode : OUT STD_LOGIC_VECTOR (1 downto 0);
        grp_fu_126_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_126_p_ce : OUT STD_LOGIC;
        grp_fu_391_p_din0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_391_p_din1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_391_p_dout0 : IN STD_LOGIC_VECTOR (31 downto 0);
        grp_fu_391_p_ce : OUT STD_LOGIC );
    end component;


    component top_fadd_32ns_32ns_32_8_full_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component top_fmul_32ns_32ns_32_5_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    grp_mmm_accum2_Pipeline_1_fu_103 : component top_mmm_accum2_Pipeline_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_mmm_accum2_Pipeline_1_fu_103_ap_start,
        ap_done => grp_mmm_accum2_Pipeline_1_fu_103_ap_done,
        ap_idle => grp_mmm_accum2_Pipeline_1_fu_103_ap_idle,
        ap_ready => grp_mmm_accum2_Pipeline_1_fu_103_ap_ready,
        accum_1_1 => accum_1_1_fu_62,
        accum_0_1 => accum_0_1_fu_58,
        accum_1_2_out => grp_mmm_accum2_Pipeline_1_fu_103_accum_1_2_out,
        accum_1_2_out_ap_vld => grp_mmm_accum2_Pipeline_1_fu_103_accum_1_2_out_ap_vld,
        accum_0_2_out => grp_mmm_accum2_Pipeline_1_fu_103_accum_0_2_out,
        accum_0_2_out_ap_vld => grp_mmm_accum2_Pipeline_1_fu_103_accum_0_2_out_ap_vld);

    grp_mmm_accum2_Pipeline_ak_fu_111 : component top_mmm_accum2_Pipeline_ak
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_mmm_accum2_Pipeline_ak_fu_111_ap_start,
        ap_done => grp_mmm_accum2_Pipeline_ak_fu_111_ap_done,
        ap_idle => grp_mmm_accum2_Pipeline_ak_fu_111_ap_idle,
        ap_ready => grp_mmm_accum2_Pipeline_ak_fu_111_ap_ready,
        accum_1_2_reload => grp_mmm_accum2_Pipeline_1_fu_103_accum_1_2_out,
        accum_0_2_reload => grp_mmm_accum2_Pipeline_1_fu_103_accum_0_2_out,
        select_ln68_1 => select_ln68_1_reg_364,
        trunc_ln75_1 => trunc_ln75_reg_369,
        A_address0 => grp_mmm_accum2_Pipeline_ak_fu_111_A_address0,
        A_ce0 => grp_mmm_accum2_Pipeline_ak_fu_111_A_ce0,
        A_q0 => A_q0,
        zext_ln69 => select_ln68_reg_359,
        B_address0 => grp_mmm_accum2_Pipeline_ak_fu_111_B_address0,
        B_ce0 => grp_mmm_accum2_Pipeline_ak_fu_111_B_ce0,
        B_q0 => B_q0,
        accum_1_4_out => grp_mmm_accum2_Pipeline_ak_fu_111_accum_1_4_out,
        accum_1_4_out_ap_vld => grp_mmm_accum2_Pipeline_ak_fu_111_accum_1_4_out_ap_vld,
        accum_0_4_out => grp_mmm_accum2_Pipeline_ak_fu_111_accum_0_4_out,
        accum_0_4_out_ap_vld => grp_mmm_accum2_Pipeline_ak_fu_111_accum_0_4_out_ap_vld,
        grp_fu_126_p_din0 => grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_din0,
        grp_fu_126_p_din1 => grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_din1,
        grp_fu_126_p_opcode => grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_opcode,
        grp_fu_126_p_dout0 => grp_fu_70_p_dout0,
        grp_fu_126_p_ce => grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_ce,
        grp_fu_391_p_din0 => grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_din0,
        grp_fu_391_p_din1 => grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_din1,
        grp_fu_391_p_dout0 => grp_fu_74_p_dout0,
        grp_fu_391_p_ce => grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_ce);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_mmm_accum2_Pipeline_1_fu_103_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_mmm_accum2_Pipeline_1_fu_103_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln68_fu_154_p2 = ap_const_lv1_0))) then 
                    grp_mmm_accum2_Pipeline_1_fu_103_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_mmm_accum2_Pipeline_1_fu_103_ap_ready = ap_const_logic_1)) then 
                    grp_mmm_accum2_Pipeline_1_fu_103_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_mmm_accum2_Pipeline_ak_fu_111_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_mmm_accum2_Pipeline_ak_fu_111_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    grp_mmm_accum2_Pipeline_ak_fu_111_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_mmm_accum2_Pipeline_ak_fu_111_ap_ready = ap_const_logic_1)) then 
                    grp_mmm_accum2_Pipeline_ak_fu_111_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_fu_66_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_fu_66 <= ap_const_lv9_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                i_fu_66 <= select_ln68_1_fu_206_p3;
            end if; 
        end if;
    end process;

    indvar_flatten_fu_70_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                indvar_flatten_fu_70 <= ap_const_lv17_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln68_fu_154_p2 = ap_const_lv1_0))) then 
                indvar_flatten_fu_70 <= add_ln68_1_fu_160_p2;
            end if; 
        end if;
    end process;

    j_fu_54_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                j_fu_54 <= ap_const_lv9_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                j_fu_54 <= add_ln69_fu_250_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
                accum_0_1_fu_58 <= grp_mmm_accum2_Pipeline_ak_fu_111_accum_0_4_out;
                accum_1_1_fu_62 <= grp_mmm_accum2_Pipeline_ak_fu_111_accum_1_4_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                add_ln72_reg_374 <= add_ln72_fu_236_p2;
                select_ln68_1_reg_364 <= select_ln68_1_fu_206_p3;
                select_ln68_reg_359 <= select_ln68_fu_197_p3;
                trunc_ln75_reg_369 <= trunc_ln75_fu_227_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state21) or (ap_const_logic_1 = ap_CS_fsm_state13))) then
                reg_131 <= grp_fu_70_p_dout0;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_mmm_accum2_Pipeline_1_fu_103_ap_done, grp_mmm_accum2_Pipeline_ak_fu_111_ap_done, ap_CS_fsm_state2, icmp_ln68_fu_154_p2, ap_CS_fsm_state3, ap_CS_fsm_state5)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln68_fu_154_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((grp_mmm_accum2_Pipeline_1_fu_103_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state5) and (grp_mmm_accum2_Pipeline_ak_fu_111_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state11;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state12;
            when ap_ST_fsm_state12 => 
                ap_NS_fsm <= ap_ST_fsm_state13;
            when ap_ST_fsm_state13 => 
                ap_NS_fsm <= ap_ST_fsm_state14;
            when ap_ST_fsm_state14 => 
                ap_NS_fsm <= ap_ST_fsm_state15;
            when ap_ST_fsm_state15 => 
                ap_NS_fsm <= ap_ST_fsm_state16;
            when ap_ST_fsm_state16 => 
                ap_NS_fsm <= ap_ST_fsm_state17;
            when ap_ST_fsm_state17 => 
                ap_NS_fsm <= ap_ST_fsm_state18;
            when ap_ST_fsm_state18 => 
                ap_NS_fsm <= ap_ST_fsm_state19;
            when ap_ST_fsm_state19 => 
                ap_NS_fsm <= ap_ST_fsm_state20;
            when ap_ST_fsm_state20 => 
                ap_NS_fsm <= ap_ST_fsm_state21;
            when ap_ST_fsm_state21 => 
                ap_NS_fsm <= ap_ST_fsm_state22;
            when ap_ST_fsm_state22 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXXXXXXXXX";
        end case;
    end process;
    A_address0 <= grp_mmm_accum2_Pipeline_ak_fu_111_A_address0;
    A_ce0 <= grp_mmm_accum2_Pipeline_ak_fu_111_A_ce0;
    B_address0 <= grp_mmm_accum2_Pipeline_ak_fu_111_B_address0;
    B_ce0 <= grp_mmm_accum2_Pipeline_ak_fu_111_B_ce0;
    C_address0 <= zext_ln72_1_fu_284_p1(16 - 1 downto 0);

    C_ce0_assign_proc : process(ap_CS_fsm_state22)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state22)) then 
            C_ce0 <= ap_const_logic_1;
        else 
            C_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    C_d0 <= reg_131;

    C_we0_assign_proc : process(ap_CS_fsm_state22)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state22)) then 
            C_we0 <= ap_const_logic_1;
        else 
            C_we0 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln68_1_fu_160_p2 <= std_logic_vector(unsigned(indvar_flatten_fu_70) + unsigned(ap_const_lv17_1));
    add_ln68_fu_185_p2 <= std_logic_vector(unsigned(i_fu_66) + unsigned(ap_const_lv9_1));
    add_ln69_fu_250_p2 <= std_logic_vector(unsigned(select_ln68_fu_197_p3) + unsigned(ap_const_lv9_1));
    add_ln72_fu_236_p2 <= std_logic_vector(unsigned(tmp_12_cast_fu_219_p3) + unsigned(zext_ln72_fu_232_p1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state13 <= ap_CS_fsm(12);
    ap_CS_fsm_state14 <= ap_CS_fsm(13);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state21 <= ap_CS_fsm(20);
    ap_CS_fsm_state22 <= ap_CS_fsm(21);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;
    ap_ST_fsm_state11_blk <= ap_const_logic_0;
    ap_ST_fsm_state12_blk <= ap_const_logic_0;
    ap_ST_fsm_state13_blk <= ap_const_logic_0;
    ap_ST_fsm_state14_blk <= ap_const_logic_0;
    ap_ST_fsm_state15_blk <= ap_const_logic_0;
    ap_ST_fsm_state16_blk <= ap_const_logic_0;
    ap_ST_fsm_state17_blk <= ap_const_logic_0;
    ap_ST_fsm_state18_blk <= ap_const_logic_0;
    ap_ST_fsm_state19_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state20_blk <= ap_const_logic_0;
    ap_ST_fsm_state21_blk <= ap_const_logic_0;
    ap_ST_fsm_state22_blk <= ap_const_logic_0;
    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_mmm_accum2_Pipeline_1_fu_103_ap_done)
    begin
        if ((grp_mmm_accum2_Pipeline_1_fu_103_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(grp_mmm_accum2_Pipeline_ak_fu_111_ap_done)
    begin
        if ((grp_mmm_accum2_Pipeline_ak_fu_111_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln68_fu_154_p2)
    begin
        if ((((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln68_fu_154_p2 = ap_const_lv1_1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln68_fu_154_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln68_fu_154_p2 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_126_ce_assign_proc : process(grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_ce, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_fu_126_ce <= grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_ce;
        else 
            grp_fu_126_ce <= ap_const_logic_1;
        end if; 
    end process;


    grp_fu_126_p0_assign_proc : process(reg_131, grp_mmm_accum2_Pipeline_ak_fu_111_accum_0_4_out, grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_din0, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state14)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_fu_126_p0 <= grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_din0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state14)) then 
            grp_fu_126_p0 <= reg_131;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            grp_fu_126_p0 <= grp_mmm_accum2_Pipeline_ak_fu_111_accum_0_4_out;
        else 
            grp_fu_126_p0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_126_p1_assign_proc : process(grp_mmm_accum2_Pipeline_ak_fu_111_accum_1_4_out, grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_din1, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state14)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_fu_126_p1 <= grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_126_p_din1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state14)) then 
            grp_fu_126_p1 <= ap_const_lv32_0;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            grp_fu_126_p1 <= grp_mmm_accum2_Pipeline_ak_fu_111_accum_1_4_out;
        else 
            grp_fu_126_p1 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    grp_fu_391_ce_assign_proc : process(grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_ce, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            grp_fu_391_ce <= grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_ce;
        else 
            grp_fu_391_ce <= ap_const_logic_1;
        end if; 
    end process;

    grp_fu_70_p_ce <= grp_fu_126_ce;
    grp_fu_70_p_din0 <= grp_fu_126_p0;
    grp_fu_70_p_din1 <= grp_fu_126_p1;
    grp_fu_70_p_opcode <= ap_const_lv2_0;
    grp_fu_74_p_ce <= grp_fu_391_ce;
    grp_fu_74_p_din0 <= grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_din0;
    grp_fu_74_p_din1 <= grp_mmm_accum2_Pipeline_ak_fu_111_grp_fu_391_p_din1;
    grp_mmm_accum2_Pipeline_1_fu_103_ap_start <= grp_mmm_accum2_Pipeline_1_fu_103_ap_start_reg;
    grp_mmm_accum2_Pipeline_ak_fu_111_ap_start <= grp_mmm_accum2_Pipeline_ak_fu_111_ap_start_reg;
    icmp_ln68_fu_154_p2 <= "1" when (indvar_flatten_fu_70 = ap_const_lv17_10000) else "0";
    icmp_ln69_fu_191_p2 <= "1" when (j_fu_54 = ap_const_lv9_100) else "0";
    select_ln68_1_fu_206_p3 <= 
        add_ln68_fu_185_p2 when (icmp_ln69_fu_191_p2(0) = '1') else 
        i_fu_66;
    select_ln68_fu_197_p3 <= 
        ap_const_lv9_0 when (icmp_ln69_fu_191_p2(0) = '1') else 
        j_fu_54;
    tmp_12_cast_fu_219_p3 <= (trunc_ln72_fu_215_p1 & ap_const_lv8_0);
    trunc_ln72_fu_215_p1 <= select_ln68_1_fu_206_p3(8 - 1 downto 0);
    trunc_ln75_fu_227_p1 <= select_ln68_1_fu_206_p3(1 - 1 downto 0);
    zext_ln72_1_fu_284_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln72_reg_374),64));
    zext_ln72_fu_232_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln68_fu_197_p3),16));
end behav;