// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Version: 2021.2
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module top_reduce_accum4_ii_is_3_Pipeline_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        accum_3_0_out,
        accum_3_0_out_ap_vld,
        accum_2_0_out,
        accum_2_0_out_ap_vld,
        accum_1_0_out,
        accum_1_0_out_ap_vld,
        accum_0_0_out,
        accum_0_0_out_ap_vld,
        accum_load_1145_out,
        accum_load_1145_out_ap_vld,
        accum_load_1041_out,
        accum_load_1041_out_ap_vld,
        accum_load_937_out,
        accum_load_937_out_ap_vld,
        accum_load33_out,
        accum_load33_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] accum_3_0_out;
output   accum_3_0_out_ap_vld;
output  [31:0] accum_2_0_out;
output   accum_2_0_out_ap_vld;
output  [31:0] accum_1_0_out;
output   accum_1_0_out_ap_vld;
output  [31:0] accum_0_0_out;
output   accum_0_0_out_ap_vld;
output  [31:0] accum_load_1145_out;
output   accum_load_1145_out_ap_vld;
output  [31:0] accum_load_1041_out;
output   accum_load_1041_out_ap_vld;
output  [31:0] accum_load_937_out;
output   accum_load_937_out_ap_vld;
output  [31:0] accum_load33_out;
output   accum_load33_out_ap_vld;

reg ap_idle;
reg accum_3_0_out_ap_vld;
reg accum_2_0_out_ap_vld;
reg accum_1_0_out_ap_vld;
reg accum_0_0_out_ap_vld;
reg accum_load_1145_out_ap_vld;
reg accum_load_1041_out_ap_vld;
reg accum_load_937_out_ap_vld;
reg accum_load33_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] exitcond24_fu_146_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [2:0] empty_fu_46;
wire   [2:0] empty_14_fu_152_p2;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_p_load;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

top_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        if ((exitcond24_fu_146_p2 == 1'd0)) begin
            empty_fu_46 <= empty_14_fu_152_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            empty_fu_46 <= 3'd0;
        end
    end
end

always @ (*) begin
    if (((exitcond24_fu_146_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        accum_0_0_out_ap_vld = 1'b1;
    end else begin
        accum_0_0_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond24_fu_146_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        accum_1_0_out_ap_vld = 1'b1;
    end else begin
        accum_1_0_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond24_fu_146_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        accum_2_0_out_ap_vld = 1'b1;
    end else begin
        accum_2_0_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond24_fu_146_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        accum_3_0_out_ap_vld = 1'b1;
    end else begin
        accum_3_0_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond24_fu_146_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        accum_load33_out_ap_vld = 1'b1;
    end else begin
        accum_load33_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond24_fu_146_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        accum_load_1041_out_ap_vld = 1'b1;
    end else begin
        accum_load_1041_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond24_fu_146_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        accum_load_1145_out_ap_vld = 1'b1;
    end else begin
        accum_load_1145_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond24_fu_146_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        accum_load_937_out_ap_vld = 1'b1;
    end else begin
        accum_load_937_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond24_fu_146_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_p_load = 3'd0;
    end else begin
        ap_sig_allocacmp_p_load = empty_fu_46;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign accum_0_0_out = 32'd0;

assign accum_1_0_out = 32'd0;

assign accum_2_0_out = 32'd0;

assign accum_3_0_out = 32'd0;

assign accum_load33_out = 32'd0;

assign accum_load_1041_out = 32'd0;

assign accum_load_1145_out = 32'd0;

assign accum_load_937_out = 32'd0;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign empty_14_fu_152_p2 = (ap_sig_allocacmp_p_load + 3'd1);

assign exitcond24_fu_146_p2 = ((ap_sig_allocacmp_p_load == 3'd4) ? 1'b1 : 1'b0);

endmodule //top_reduce_accum4_ii_is_3_Pipeline_1
