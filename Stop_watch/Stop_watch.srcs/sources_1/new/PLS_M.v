`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/28 15:02:32
// Design Name: 
// Module Name: PLS_M
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

module PLS_M(
    input rst,
    input clk,
    input pls_1k,
    input cnt_en,
    output reg pls
    );
// 100Hz pulse counter
reg [2:0] cnt;
reg pl0, pl1;

always @(posedge rst, posedge clk) begin
    if(rst == 1) begin
        pls <= 0;
        cnt <= 0;
    end else if(!cnt_en) begin
        cnt <= cnt;
        pls <= pls;
    end else begin
        pl0 <= pls_1k;
        pl1 <= pl0;
        if(pl0 & ~pl1) begin
            if(cnt < 4) begin
                cnt <= cnt + 1;
            end else begin
                pls <= ~pls;
                cnt <= 0;
            end
        end
    end
end

endmodule
