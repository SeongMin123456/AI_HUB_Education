`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 11:18:45
// Design Name: 
// Module Name: counter_pro
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


module counter_pro(
    input rst,
    input clk,
    output reg [6:0] qout
    );

reg updn = 0;

always @(negedge rst, posedge clk) begin
    if(rst == 0) qout <= 0;
    else if(updn == 1)  qout <= qout - 1;
    else if(updn == 0)  qout <= qout + 1;
end

always @(negedge rst, posedge clk) begin
    if(rst == 0) updn <= 0;
    else if(qout >= 98) updn <= 1'b1;
    else if(qout <= 1)  updn <= 1'b0;
end

endmodule
