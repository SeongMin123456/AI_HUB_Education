`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 13:27:27
// Design Name: 
// Module Name: add_test
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


module add_test(
    input [7:0] a,
    input [7:0] b,
    output [7:0] y,
    output c
    );

wire [8:0] sum;

assign sum = a + b;

assign c = sum[8];
assign y = sum[7:0];

endmodule
