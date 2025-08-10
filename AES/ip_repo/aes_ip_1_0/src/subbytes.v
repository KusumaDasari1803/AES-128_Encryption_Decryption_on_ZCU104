`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 10:35:22 AM
// Design Name: 
// Module Name: subbytes
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


module subbytes (
    input  wire [127:0] state_in,     // 128-bit state input (4x4 matrix)
    output wire [127:0] state_out     // 128-bit state output after S-box substitution
);

    // Each byte processed through S-box separately
    wire [7:0] sbox_out0;
    wire [7:0] sbox_out1;
    wire [7:0] sbox_out2;
    wire [7:0] sbox_out3;
    wire [7:0] sbox_out4;
    wire [7:0] sbox_out5;
    wire [7:0] sbox_out6;
    wire [7:0] sbox_out7;
    wire [7:0] sbox_out8;
    wire [7:0] sbox_out9;
    wire [7:0] sbox_out10;
    wire [7:0] sbox_out11;
    wire [7:0] sbox_out12;
    wire [7:0] sbox_out13;
    wire [7:0] sbox_out14;
    wire [7:0] sbox_out15; // 16 S-box outputs

    // Instantiate S-box for each byte
    sbox sb0 (.in(state_in[127:120]), .out(sbox_out0));  // Byte 0 (Row0 Col0)
    sbox sb1 (.in(state_in[119:112]), .out(sbox_out1));  // Byte 1 (Row1 Col0)
    sbox sb2 (.in(state_in[111:104]), .out(sbox_out2));  // Byte 2 (Row2 Col0)
    sbox sb3 (.in(state_in[103:96]),  .out(sbox_out3));  // Byte 3 (Row3 Col0)

    sbox sb4 (.in(state_in[95:88]),   .out(sbox_out4));  // Byte 4 (Row0 Col1)
    sbox sb5 (.in(state_in[87:80]),   .out(sbox_out5));  // Byte 5 (Row1 Col1)
    sbox sb6 (.in(state_in[79:72]),   .out(sbox_out6));  // Byte 6 (Row2 Col1)
    sbox sb7 (.in(state_in[71:64]),   .out(sbox_out7));  // Byte 7 (Row3 Col1)

    sbox sb8 (.in(state_in[63:56]),   .out(sbox_out8));  // Byte 8 (Row0 Col2)
    sbox sb9 (.in(state_in[55:48]),   .out(sbox_out9));  // Byte 9 (Row1 Col2)
    sbox sb10(.in(state_in[47:40]),   .out(sbox_out10)); // Byte 10 (Row2 Col2)
    sbox sb11(.in(state_in[39:32]),   .out(sbox_out11)); // Byte 11 (Row3 Col2)

    sbox sb12(.in(state_in[31:24]),   .out(sbox_out12)); // Byte 12 (Row0 Col3)
    sbox sb13(.in(state_in[23:16]),   .out(sbox_out13)); // Byte 13 (Row1 Col3)
    sbox sb14(.in(state_in[15:8]),    .out(sbox_out14)); // Byte 14 (Row2 Col3)
    sbox sb15(.in(state_in[7:0]),     .out(sbox_out15)); // Byte 15 (Row3 Col3)

    // Combine S-box outputs into the output state
    assign state_out = { sbox_out0,  sbox_out1,  sbox_out2,  sbox_out3,
                         sbox_out4,  sbox_out5,  sbox_out6,  sbox_out7,
                         sbox_out8,  sbox_out9,  sbox_out10, sbox_out11,
                         sbox_out12, sbox_out13, sbox_out14, sbox_out15 };

endmodule

