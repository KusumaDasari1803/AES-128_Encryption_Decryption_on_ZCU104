`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 10:15:55 AM
// Design Name: 
// Module Name: subword
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


module subword (
    input  wire [31:0] in_word,
    output wire [31:0] out_word
);

    wire [7:0] sbox_out0, sbox_out1, sbox_out2, sbox_out3;

    sbox s0 (.in(in_word[31:24]), .out(sbox_out3));
    sbox s1 (.in(in_word[23:16]), .out(sbox_out2));
    sbox s2 (.in(in_word[15:8]),  .out(sbox_out1));
    sbox s3 (.in(in_word[7:0]),   .out(sbox_out0));

    assign out_word = {sbox_out3, sbox_out2, sbox_out1, sbox_out0};
endmodule
