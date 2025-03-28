`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/28 11:37:22
// Design Name: 
// Module Name: PLS_1khz
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


module PLS_1khz(
    input clk,
    output reg pls_1k
    );

//parameter FREQ = 40_000_000;
//parameter Target_f = 1000;

parameter TP_1k = 20000;
reg [14:0] cnt = 0;

always @(posedge clk) begin
    if(cnt >= TP_1k - 1) begin
        pls_1k <= ~pls_1k;
        cnt <= 0;
    end else begin
        cnt <= cnt + 1;
    end          
end

endmodule
