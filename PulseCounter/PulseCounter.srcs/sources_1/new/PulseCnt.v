`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 12:10:26
// Design Name: 
// Module Name: PulseCnt
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


module PulseCnt(
    input rst,
    input clk,
    input pls,
    output reg [6:0] cnto
    );

reg pl0, pl1;

// rising edge counter
always @(negedge rst, posedge clk) begin
    if(rst == 0) begin
        pl0 <= 0;
        pl1 <= 0;
    end else begin
        pl0 <= pls;
        pl1 <= pl0;
        if(pl0 & ~pl1) begin
            if(cnto < 99)   cnto <= cnto + 1;
            else            cnto <= 0;
        end
    end
end

endmodule
