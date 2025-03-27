`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 10:46:49
// Design Name: 
// Module Name: counter_tb
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


module counter_tb();

reg RST, CLK;
wire [6:0] qout;

counter_pro uut(
    .rst(RST),
    .clk(CLK),
    .qout(qout)
    );

always #2   CLK = ~ CLK;

initial begin
    RST <= 0;
    CLK <= 0;
    #10;
    RST <= 1'b1;
    #3000;
    RST <= 0;
end

endmodule
