`timescale 1ns / 1ps

module Encrypt (
    input  wire [127:0] plaintext,
    input  wire [127:0] cipher_key,
    output wire [127:0] ciphertext
);

    wire [1407:0] round_keys;
    wire [127:0] state_round0;
    wire [127:0] state_round1;
    wire [127:0] state_round2;
    wire [127:0] state_round3;
    wire [127:0] state_round4;
    wire [127:0] state_round5;
    wire [127:0] state_round6;
    wire [127:0] state_round7;
    wire [127:0] state_round8;
    wire [127:0] state_round9;
    wire [127:0] state_round10;

    // Key expansion
    key_expansion u_key_expansion (
        .cipher_key(cipher_key),
        .round_keys(round_keys)
    );

    // Initial AddRoundKey (Round 0)
    addroundkey u_addroundkey_initial (
        .state_in(plaintext),
        .round_key(round_keys[1407:1280]),
        .state_out(state_round0)
    );

    // Round 1
    round u_round1 (
        .state_in(state_round0),
        .round_key(round_keys[1279:1152]),
        .final_round(1'b0),
        .state_out(state_round1)
    );

    // Round 2
    round u_round2 (
        .state_in(state_round1),
        .round_key(round_keys[1151:1024]),
        .final_round(1'b0),
        .state_out(state_round2)
    );

    // Round 3
    round u_round3 (
        .state_in(state_round2),
        .round_key(round_keys[1023:896]),
        .final_round(1'b0),
        .state_out(state_round3)
    );

    // Round 4
    round u_round4 (
        .state_in(state_round3),
        .round_key(round_keys[895:768]),
        .final_round(1'b0),
        .state_out(state_round4)
    );

    // Round 5
    round u_round5 (
        .state_in(state_round4),
        .round_key(round_keys[767:640]),
        .final_round(1'b0),
        .state_out(state_round5)
    );

    // Round 6
    round u_round6 (
        .state_in(state_round5),
        .round_key(round_keys[639:512]),
        .final_round(1'b0),
        .state_out(state_round6)
    );

    // Round 7
    round u_round7 (
        .state_in(state_round6),
        .round_key(round_keys[511:384]),
        .final_round(1'b0),
        .state_out(state_round7)
    );

    // Round 8
    round u_round8 (
        .state_in(state_round7),
        .round_key(round_keys[383:256]),
        .final_round(1'b0),
        .state_out(state_round8)
    );

    // Round 9
    round u_round9 (
        .state_in(state_round8),
        .round_key(round_keys[255:128]),
        .final_round(1'b0),
        .state_out(state_round9)
    );

    // Final Round 10 (no MixColumns)
    round u_round10 (
        .state_in(state_round9),
        .round_key(round_keys[127:0]),
        .final_round(1'b1),
        .state_out(ciphertext)
    );

endmodule
