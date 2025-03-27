`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 11:47:44
// Design Name: 
// Module Name: edge_det
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

module edge_det(
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

assign redge = (d0 & ~d1) ? 1 : 0;
assign fedge = (~d0 & d1) ? 1 : 0;

//always @(negedge rst, posedge clk) begin
//    if(rst == 0) begin
//        redge <= 0;
//        fedge <= 0;
//    end else begin
//        if(d0 & ~d1)        redge <= 1'b1;
//        else if(~d0 & d1)   fedge <= 1'b1;
//        else begin
//            redge <= 0;
//            fedge <= 0;
//        end
//    end
//end

endmodule
