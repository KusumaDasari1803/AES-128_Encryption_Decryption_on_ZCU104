`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 01:25:07 PM
// Design Name: 
// Module Name: round
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


module round (
    input  wire [127:0] state_in,      
    input  wire [127:0] round_key,     
    input  wire         final_round,   
    output wire [127:0] state_out      
);

    wire [127:0] subbytes_out;
    wire [127:0] shiftrows_out;
    wire [127:0] mixcolumns_out;
    wire [127:0] final_mix_out;

    // SubBytes operation
    subbytes u_subbytes (
        .state_in(state_in),
        .state_out(subbytes_out)
    );

    // ShiftRows operation
    shiftrows u_shiftrows (
        .state_in(subbytes_out),
        .state_out(shiftrows_out)
    );

    // MixColumns operation (only for rounds 1 to 9)
    mixcolumns u_mixcolumns (
        .state_in(shiftrows_out),
        .state_out(mixcolumns_out)
    );

    // Round output selector
    assign final_mix_out = (final_round) ? shiftrows_out : mixcolumns_out;

    // AddRoundKey operation
    addroundkey u_addroundkey (
        .state_in(final_mix_out),
        .round_key(round_key),
        .state_out(state_out)
    );

endmodule

