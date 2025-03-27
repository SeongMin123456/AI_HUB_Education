`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 10:34:09
// Design Name: 
// Module Name: counter_test
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


module counter_test(
    input rst,
    input clk,
    output reg [6:0] qout
    );

reg mode = 0;

always @(negedge rst, posedge clk) begin
    if(rst == 0) begin
        mode <= 0;
        qout <= 0;
    end else begin
        case(mode)
            0 : begin
                qout <= qout + 1;
                if(qout >= 98)  mode <= 1'b1;
            end
            1 : begin
                qout <= qout - 1;
                if(qout <= 1)   mode <= 1'b0;
            end
        endcase
    end
end

endmodule
