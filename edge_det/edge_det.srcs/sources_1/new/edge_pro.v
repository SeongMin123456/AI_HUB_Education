`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 12:00:42
// Design Name: 
// Module Name: edge_pro
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

module edge_pro(
    input rst,
    input clk,
    input din,
    output redge,
    output fedge
    );

reg d0, d1;

always @(negedge rst, posedge clk) begin
    if(rst == 0) begin
        d0 <= 0;
        d1 <= 0;
    end else begin
        d0 <= din;
        d1 <= d0;
    end
end

assign redge = d0 & ~d1;
assign fedge = d1 & ~d0;

endmodule
