`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 15:01:10
// Design Name: 
// Module Name: hex2seg_tb
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


module hex2seg_tb();

reg CA;
reg [3:0] HEX;
wire [6:0] AN;

hex2seg uut(
    .hex(HEX),
    .CA(CA),
    .AN(AN)
    );

always #5 CA = ~CA;

integer i;
initial begin
    HEX <= 0;
    CA <= 0;
    #10;
    for(i = 0; i < 16; i = i + 1) begin
        HEX <= HEX + 1;
        #10;
    end
end

endmodule
