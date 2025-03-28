`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/03/27 16:00:23
// Design Name: 
// Module Name: pls_cnt_disp
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

module pls_cnt_disp(
    input rst,
    input clk,
    input BTN,
    output [7:0] seg_us,
    output [7:0] seg_s
    );

reg cnt_en;
reg btn_pl0, btn_pl1;
always @(posedge rst, posedge clk) begin
    if(rst) cnt_en <= 0;
    else begin
        btn_pl0 <= BTN;
        btn_pl1 <= btn_pl0;
        if(btn_pl0 & ~btn_pl1) begin
            cnt_en <= ~cnt_en;
        end
    end
end

wire [7:0] CNTO_US, CNTO_S;
wire PLS_1K;
wire USEC_PLS;
wire [6:0] US_AN;
wire [3:0] US_HIGH_N, US_LOW_N;
wire [3:0] US_BCD = (PLS_1K) ? US_HIGH_N : US_LOW_N;
assign seg_us = {PLS_1K, US_AN};

wire [6:0] S_AN;
wire [3:0] S_HIGH_N, S_LOW_N;
wire [3:0] S_BCD = (PLS_1K) ? S_HIGH_N : S_LOW_N;
assign seg_s = {PLS_1K, S_AN};

PLS_1khz uut1(
    .clk(clk),
    .pls_1k(PLS_1K)
    );

PLS_M uut2(
    .rst(rst),
    .clk(clk),
    .pls_1k(PLS_1K),
    .cnt_en(cnt_en),
    .pls(USEC_PLS)
    );

PulseCnt uut3(
    .rst(rst),
    .clk(clk),
    .pls(USEC_PLS),
    .cnto_usec(CNTO_US),
    .cnto_sec(CNTO_S)
    );

bcd2seg_pro uut4(
    .bcd(US_BCD),
    .AN(US_AN)
    );

hex2bcd uut5(
    .cnto(CNTO_US),
    .high_n(US_HIGH_N),
    .low_n(US_LOW_N)
    );

bcd2seg_pro uut6(
    .bcd(S_BCD),
    .AN(S_AN)
    );

hex2bcd uut7(
    .cnto(CNTO_S),
    .high_n(S_HIGH_N),
    .low_n(S_LOW_N)
    );

endmodule
