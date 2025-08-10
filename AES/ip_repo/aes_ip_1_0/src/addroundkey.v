`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 10:26:41 AM
// Design Name: 
// Module Name: addroundkey
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


module addroundkey (
    input  wire [127:0] state_in,    // 128-bit input state matrix (4x4)
    input  wire [127:0] round_key,   // 128-bit round key matrix (4x4)
    output wire [127:0] state_out    // 128-bit output state matrix (4x4)
);

    // Each byte processed separately (Matrix form)

    assign state_out[127:120] = state_in[127:120] ^ round_key[127:120]; // Byte 0 (row 0, col 0)
    assign state_out[119:112] = state_in[119:112] ^ round_key[119:112]; // Byte 1 (row 1, col 0)
    assign state_out[111:104] = state_in[111:104] ^ round_key[111:104]; // Byte 2 (row 2, col 0)
    assign state_out[103:96]  = state_in[103:96]  ^ round_key[103:96];  // Byte 3 (row 3, col 0)

    assign state_out[95:88]   = state_in[95:88]   ^ round_key[95:88];   // Byte 4 (row 0, col 1)
    assign state_out[87:80]   = state_in[87:80]   ^ round_key[87:80];   // Byte 5 (row 1, col 1)
    assign state_out[79:72]   = state_in[79:72]   ^ round_key[79:72];   // Byte 6 (row 2, col 1)
    assign state_out[71:64]   = state_in[71:64]   ^ round_key[71:64];   // Byte 7 (row 3, col 1)

    assign state_out[63:56]   = state_in[63:56]   ^ round_key[63:56];   // Byte 8 (row 0, col 2)
    assign state_out[55:48]   = state_in[55:48]   ^ round_key[55:48];   // Byte 9 (row 1, col 2)
    assign state_out[47:40]   = state_in[47:40]   ^ round_key[47:40];   // Byte 10 (row 2, col 2)
    assign state_out[39:32]   = state_in[39:32]   ^ round_key[39:32];   // Byte 11 (row 3, col 2)

    assign state_out[31:24]   = state_in[31:24]   ^ round_key[31:24];   // Byte 12 (row 0, col 3)
    assign state_out[23:16]   = state_in[23:16]   ^ round_key[23:16];   // Byte 13 (row 1, col 3)
    assign state_out[15:8]    = state_in[15:8]    ^ round_key[15:8];    // Byte 14 (row 2, col 3)
    assign state_out[7:0]     = state_in[7:0]     ^ round_key[7:0];     // Byte 15 (row 3, col 3)

endmodule

