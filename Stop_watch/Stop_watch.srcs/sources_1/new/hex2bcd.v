`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/28 14:10:46
// Design Name: 
// Module Name: hex2bcd
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

module hex2bcd(
    input [7:0] cnto,
    output reg [3:0] high_n,
    output reg [3:0] low_n
    );

always @(cnto) begin
    if(cnto >= 90)  begin
        high_n <= 9;
        low_n <= cnto - 90;
    end else if(cnto >= 80) begin
        high_n <= 8;
        low_n <= cnto - 80;
    end else if(cnto >= 70) begin
        high_n <= 7;
        low_n <= cnto - 70;
    end else if(cnto >= 60) begin
        high_n <= 6;
        low_n <= cnto - 60;
    end else if(cnto >= 50) begin
        high_n <= 5;
        low_n <= cnto - 50;
    end else if(cnto >= 40) begin
        high_n <= 4;
        low_n <= cnto - 40;
    end else if(cnto >= 30) begin
        high_n <= 3;
        low_n <= cnto - 30;
    end else if(cnto >= 20) begin
        high_n <= 2;
        low_n <= cnto - 20;
    end else if(cnto >= 10) begin
        high_n <= 1;
        low_n <= cnto - 10;
    end else if(cnto < 10) begin
        high_n <= 0;
        low_n <= cnto;
    end else begin
        high_n <= 0;
        low_n <= 0;
    end
end

endmodule
