`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2025 07:24:34 AM
// Design Name: 
// Module Name: inv_subbytes
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


module inv_subbytes (
    input  wire [127:0] state_in,      // 128-bit input state (4x4 matrix)
    output wire [127:0] state_out      // 128-bit output after Inverse S-box substitution
);

    // Each byte processed through inverse S-box separately
    wire [7:0] inv_sbox_out0;
    wire [7:0] inv_sbox_out1;
    wire [7:0] inv_sbox_out2;
    wire [7:0] inv_sbox_out3;
    wire [7:0] inv_sbox_out4;
    wire [7:0] inv_sbox_out5;
    wire [7:0] inv_sbox_out6;
    wire [7:0] inv_sbox_out7;
    wire [7:0] inv_sbox_out8;
    wire [7:0] inv_sbox_out9;
    wire [7:0] inv_sbox_out10;
    wire [7:0] inv_sbox_out11;
    wire [7:0] inv_sbox_out12;
    wire [7:0] inv_sbox_out13;
    wire [7:0] inv_sbox_out14;
    wire [7:0] inv_sbox_out15; // 16 inverse S-box outputs

    // Instantiate Inverse S-box for each byte
    inv_sbox sb0  (.in(state_in[127:120]), .out(inv_sbox_out0));  // Byte 0 (Row0 Col0)
    inv_sbox sb1  (.in(state_in[119:112]), .out(inv_sbox_out1));  // Byte 1 (Row1 Col0)
    inv_sbox sb2  (.in(state_in[111:104]), .out(inv_sbox_out2));  // Byte 2 (Row2 Col0)
    inv_sbox sb3  (.in(state_in[103:96]),  .out(inv_sbox_out3));  // Byte 3 (Row3 Col0)

    inv_sbox sb4  (.in(state_in[95:88]),   .out(inv_sbox_out4));  // Byte 4 (Row0 Col1)
    inv_sbox sb5  (.in(state_in[87:80]),   .out(inv_sbox_out5));  // Byte 5 (Row1 Col1)
    inv_sbox sb6  (.in(state_in[79:72]),   .out(inv_sbox_out6));  // Byte 6 (Row2 Col1)
    inv_sbox sb7  (.in(state_in[71:64]),   .out(inv_sbox_out7));  // Byte 7 (Row3 Col1)

    inv_sbox sb8  (.in(state_in[63:56]),   .out(inv_sbox_out8));  // Byte 8 (Row0 Col2)
    inv_sbox sb9  (.in(state_in[55:48]),   .out(inv_sbox_out9));  // Byte 9 (Row1 Col2)
    inv_sbox sb10 (.in(state_in[47:40]),   .out(inv_sbox_out10)); // Byte 10 (Row2 Col2)
    inv_sbox sb11 (.in(state_in[39:32]),   .out(inv_sbox_out11)); // Byte 11 (Row3 Col2)

    inv_sbox sb12 (.in(state_in[31:24]),   .out(inv_sbox_out12)); // Byte 12 (Row0 Col3)
    inv_sbox sb13 (.in(state_in[23:16]),   .out(inv_sbox_out13)); // Byte 13 (Row1 Col3)
    inv_sbox sb14 (.in(state_in[15:8]),    .out(inv_sbox_out14)); // Byte 14 (Row2 Col3)
    inv_sbox sb15 (.in(state_in[7:0]),     .out(inv_sbox_out15)); // Byte 15 (Row3 Col3)

    // Combine outputs into the 128-bit output state
    assign state_out = { inv_sbox_out0,  inv_sbox_out1,  inv_sbox_out2,  inv_sbox_out3,
                         inv_sbox_out4,  inv_sbox_out5,  inv_sbox_out6,  inv_sbox_out7,
                         inv_sbox_out8,  inv_sbox_out9,  inv_sbox_out10, inv_sbox_out11,
                         inv_sbox_out12, inv_sbox_out13, inv_sbox_out14, inv_sbox_out15 };

endmodule

