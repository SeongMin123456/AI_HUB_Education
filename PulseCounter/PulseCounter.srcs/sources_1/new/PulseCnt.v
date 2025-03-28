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
    output reg [7:0] cnto_usec,
    output reg [7:0] cnto_sec
    );

reg pl0, pl1;

// rising edge counter
always @(posedge rst, posedge clk) begin
    if(rst == 1) begin
        pl0 <= 0;
        pl1 <= 0;
        cnto_usec <= 0;
        cnto_sec <= 0;
    end else begin
        pl0 <= pls;
        pl1 <= pl0;
        if(pl0 & ~pl1) begin
            if(cnto_usec < 99)   cnto_usec <= cnto_usec + 1;
            else begin
                cnto_usec <= 0;
                if(cnto_sec < 59)   cnto_sec <= cnto_sec + 1;
                else                cnto_sec <= 0;
            end
        end
    end
end

endmodule
