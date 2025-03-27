`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 11:52:29
// Design Name: 
// Module Name: edge_det_tb
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


module edge_det_tb();

reg RST, CLK, DIN;
wire redge, fedge;

edge_det uut(
    .rst(RST),
    .clk(CLK),
    .din(DIN),
    .redge(redge),
    .fedge(fedge)
    );

always #2 CLK = ~CLK;

initial begin
    RST <= 0;
    CLK <= 0;
    DIN <= 0;
    #10;
    RST <= 1;
    DIN <= 1;
    #20;
    DIN <= 0;
    #20;
    DIN <= 1;
    #30;
    RST <= 0;
end

endmodule
