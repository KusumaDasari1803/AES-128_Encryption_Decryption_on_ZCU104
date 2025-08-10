`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2025 07:45:51 AM
// Design Name: 
// Module Name: inv_round
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


module inv_round (
    input  wire [127:0] state_in,       // Input state
    input  wire [127:0] round_key,      // Round key
    input  wire         final_round,    // High for final round (skip MixColumns)
    output wire [127:0] state_out       // Output state
);

    wire [127:0] inv_shiftrows_out;
    wire [127:0] inv_subbytes_out;
    wire [127:0] addroundkey_out;
    wire [127:0] inv_mixcolumns_out;

    // Step 1: Inverse ShiftRows
    inv_shiftrows u_inv_shiftrows (
        .state_in(state_in),
        .state_out(inv_shiftrows_out)
    );

    // Step 2: Inverse SubBytes
    inv_subbytes u_inv_subbytes (
        .state_in(inv_shiftrows_out),
        .state_out(inv_subbytes_out)
    );

    // Step 3: AddRoundKey
    addroundkey u_addroundkey (
        .state_in(inv_subbytes_out),
        .round_key(round_key),
        .state_out(addroundkey_out)
    );

    // Step 4: Inverse MixColumns (skipped in final round)
    inv_mixcolumns u_inv_mixcolumns (
        .state_in(addroundkey_out),
        .state_out(inv_mixcolumns_out)
    );

    // Select final output
    assign state_out = (final_round) ? addroundkey_out : inv_mixcolumns_out;

endmodule


