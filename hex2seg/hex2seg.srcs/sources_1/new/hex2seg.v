`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 14:38:10
// Design Name: 
// Module Name: hex2seg
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

module hex2seg(
    input [3:0] hex,
    input CA,
    output reg [6:0] AN
    );

reg [3:0] digit10, digit1;
wire [3:0] DIGIT = CA ? digit10 : digit1;

always @(CA) begin
    if(hex >= 4'd10) begin
        digit10 <= 4'd1;
        digit1 <= hex - 4'd10;
    end else begin
        digit10 <= 4'd0;
        digit1 <= hex;
    end
end

always @(DIGIT) begin
    case(DIGIT)
        4'h0 : AN = 7'h3F;
        4'h1 : AN = 7'h06;
        4'h2 : AN = 7'h5B;
        4'h3 : AN = 7'h4F;
        4'h4 : AN = 7'h66;
        4'h5 : AN = 7'h6D;
        4'h6 : AN = 7'h7D;
        4'h7 : AN = 7'h27;
        4'h8 : AN = 7'h7F;
        4'h9 : AN = 7'h67;
//        4'ha : AN = 7'h5F;
//        4'hb : AN = 7'h7C;
//        4'hc : AN = 7'h58;
//        4'hd : AN = 7'h5E;
//        4'he : AN = 7'h7B;
//        4'hf : AN = 7'h71;
        default : AN = 7'h3F;
    endcase
end

endmodule
