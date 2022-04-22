`default_nettype none
`timescale 1ps / 1ps

module mul #(
  parameter MSG_WIDTH_I  = 32,
  parameter MSG_WIDTH_O  = 32
)
(
  input  logic                    clk,
  input  logic                    reset,

  input  logic                    recv_val,
  output logic                    recv_rdy,
  input  logic  [MSG_WIDTH_I-1:0] recv_msg,

  output logic                    send_val,
  input  logic                    send_rdy,
  output logic [MSG_WIDTH_O-1:0]  send_msg
);
  logic [(MSG_WIDTH_I/2)-1:0] op0;
  logic [(MSG_WIDTH_I/2)-1:0] op1;

  assign op0 = recv_msg[MSG_WIDTH_I-1:(MSG_WIDTH_I/2)];
  assign op1 = recv_msg[(MSG_WIDTH_I/2)-1:0];

  always_ff @(posedge clk) begin
    recv_rdy <= (reset) ? 1'b0 : send_rdy;
    send_val <= (reset) ? 1'b0 : recv_val;
    send_msg <= (reset) ? 1'b0 : op0 * op1;
  end

endmodule : mul

`default_nettype wire

