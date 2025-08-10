`timescale 1ns / 1ps

module Decrypt (
    input  wire [127:0] ciphertext,
    input  wire [127:0] cipher_key,
    output wire [127:0] plaintext
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

    // Generate all round keys from cipher key
    key_expansion u_key_expansion (
        .cipher_key(cipher_key),
        .round_keys(round_keys)
    );

    // Initial AddRoundKey (Round 0 of decryption) uses last round key (K10)
    addroundkey u_addroundkey_initial (
        .state_in(ciphertext),
        .round_key(round_keys[127:0]), // K10
        .state_out(state_round0)
    );

    // Round 1 (K9)
    inv_round u_round1 (
        .state_in(state_round0),
        .round_key(round_keys[255:128]),
        .final_round(1'b0),
        .state_out(state_round1)
    );

    // Round 2 (K8)
    inv_round u_round2 (
        .state_in(state_round1),
        .round_key(round_keys[383:256]),
        .final_round(1'b0),
        .state_out(state_round2)
    );

    // Round 3 (K7)
    inv_round u_round3 (
        .state_in(state_round2),
        .round_key(round_keys[511:384]),
        .final_round(1'b0),
        .state_out(state_round3)
    );

    // Round 4 (K6)
    inv_round u_round4 (
        .state_in(state_round3),
        .round_key(round_keys[639:512]),
        .final_round(1'b0),
        .state_out(state_round4)
    );

    // Round 5 (K5)
    inv_round u_round5 (
        .state_in(state_round4),
        .round_key(round_keys[767:640]),
        .final_round(1'b0),
        .state_out(state_round5)
    );

    // Round 6 (K4)
    inv_round u_round6 (
        .state_in(state_round5),
        .round_key(round_keys[895:768]),
        .final_round(1'b0),
        .state_out(state_round6)
    );

    // Round 7 (K3)
    inv_round u_round7 (
        .state_in(state_round6),
        .round_key(round_keys[1023:896]),
        .final_round(1'b0),
        .state_out(state_round7)
    );

    // Round 8 (K2)
    inv_round u_round8 (
        .state_in(state_round7),
        .round_key(round_keys[1151:1024]),
        .final_round(1'b0),
        .state_out(state_round8)
    );

    // Round 9 (K1)
    inv_round u_round9 (
        .state_in(state_round8),
        .round_key(round_keys[1279:1152]),
        .final_round(1'b0),
        .state_out(state_round9)
    );

    // Final round (K0), no InvMixColumns
    inv_round u_round10 (
        .state_in(state_round9),
        .round_key(round_keys[1407:1280]), // K0
        .final_round(1'b1),
        .state_out(state_round10)
    );

    // Output
    assign plaintext = state_round10;

endmodule
