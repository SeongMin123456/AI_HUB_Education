`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 16:00:23
// Design Name: 
// Module Name: pls_cnt_disp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module pls_cnt_disp(
    input rst,
    input clk,
    input sel,
    input pls,
    output [7:0] seg
    );

wire [7:0] CNTO;
wire [3:0] HEX = (sel) ? CNTO[7:4] : CNTO[3:0];

PulseCnt uut1(
    .rst(rst),
    .clk(clk),
    .pls(pls),
    .cnto(CNTO)
    );

wire [6:0] AN;

hex2seg_pro uut2(
    .hex(HEX),
    .AN(AN)
    );

assign seg [7:0] = {sel, AN};

endmodule
