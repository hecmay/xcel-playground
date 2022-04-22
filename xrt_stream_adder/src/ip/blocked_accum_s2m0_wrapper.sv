`default_nettype none
`timescale 1ps / 1ps

module blocked_accum_s2m0_wrapper #(
  parameter integer C_OUT0_TDATA_WIDTH = 32,
  parameter integer C_IN0_TDATA_WIDTH = 32
)
(
  input wire                               ap_clk,
  input wire                               ap_rst_n,


  output wire                              out0_tvalid,
  input  wire                              out0_tready,
  output wire [C_OUT0_TDATA_WIDTH-1:0]      out0_tdata,
  output wire [C_OUT0_TDATA_WIDTH/8-1:0]    out0_tkeep,
  output wire                              out0_tlast,

  input wire                               in0_tvalid,
  output wire                              in0_tready,
  input wire                               in0_tlast,
  input wire  [C_IN0_TDATA_WIDTH-1:0]      in0_tdata,
  input wire  [(C_IN0_TDATA_WIDTH/8)-1:0]  in0_tkeep
);

assign out0_tkeep = {(C_OUT0_TDATA_WIDTH/8){1'b1}};
assign out0_tlast = 1'b1;

// Insert kernel here
blocked_accum_blocked_accum inst_blocked_accum
(
  .clk       ( ap_clk            ),
  .reset     ( ~ap_rst_n         ),
  .strm_in_V_TVALID  ( in0_tvalid        ),
  .strm_in_V_TREADY  ( in0_tready        ),
  .strm_in_V_TDATA   ( in0_tdata         ),
  .strm_out_V_TVALID  ( out0_tvalid       ),
  .strm_out_V_TREADY  ( out0_tready       ),
  .strm_out_V_TDATA  ( out0_tdata        )
);

endmodule : blocked_accum_s2m0_wrapper

