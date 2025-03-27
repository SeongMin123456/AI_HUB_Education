`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 12:14:47
// Design Name: 
// Module Name: PulseCnt_tb
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


module PulseCnt_tb();

reg RST, CLK, PLS;
wire [6:0] cnto;

PulseCnt uut(
    .rst(RST),
    .clk(CLK),
    .pls(PLS),
    .cnto(cnto)
    );

always #2 CLK = ~CLK;

integer i;
initial begin
    RST <= 0;
    CLK <= 0;
    PLS <= 0;
    #10;
    RST <= 1;
    for(i = 0; i < 3000; i = i + 1) begin
        PLS <= 1;
        #8;
        PLS <= 0;
        #8;
    end
end

endmodule
