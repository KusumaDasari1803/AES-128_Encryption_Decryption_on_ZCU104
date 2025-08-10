`timescale 1ns / 1ps
module key_expansion (


    input  wire [127:0] cipher_key,    // Initial 128-bit key
    output wire [1407:0] round_keys   // 11 round keys (11*128 = 1408 bits)
);

    wire [31:0] w0;
    wire [31:0] w1;
    wire [31:0] w2;
    wire [31:0] w3;
    wire [31:0] w4;
    wire [31:0] w5;
    wire [31:0] w6;
    wire [31:0] w7;
    wire [31:0] w8;
    wire [31:0] w9;
    wire [31:0] w10;
    wire [31:0] w11;
    wire [31:0] w12;
    wire [31:0] w13;
    wire [31:0] w14;
    wire [31:0] w15;
    wire [31:0] w16;
    wire [31:0] w17;
    wire [31:0] w18;
    wire [31:0] w19;
    wire [31:0] w20;
    wire [31:0] w21;
    wire [31:0] w22;
    wire [31:0] w23;
    wire [31:0] w24;
    wire [31:0] w25;
    wire [31:0] w26;
    wire [31:0] w27;
    wire [31:0] w28;
    wire [31:0] w29;
    wire [31:0] w30;
    wire [31:0] w31;
    wire [31:0] w32;
    wire [31:0] w33;
    wire [31:0] w34;
    wire [31:0] w35;
    wire [31:0] w36;
    wire [31:0] w37;
    wire [31:0] w38;
    wire [31:0] w39;
    wire [31:0] w40;
    wire [31:0] w41;
    wire [31:0] w42;
    wire [31:0] w43;
    
    wire [31:0] rotword_out1;
    wire [31:0] rotword_out2;
    wire [31:0] rotword_out3;
    wire [31:0] rotword_out4;
    wire [31:0] rotword_out5;
    wire [31:0] rotword_out6;
    wire [31:0] rotword_out7;
    wire [31:0] rotword_out8;
    wire [31:0] rotword_out9;
    wire [31:0] rotword_out10;
    wire [31:0] subword_out1;
    wire [31:0] subword_out2;
    wire [31:0] subword_out3;
    wire [31:0] subword_out4;
    wire [31:0] subword_out5;
    wire [31:0] subword_out6;
    wire [31:0] subword_out7;
    wire [31:0] subword_out8;
    wire [31:0] subword_out9;
    wire [31:0] subword_out10;
    wire [31:0] rcon_out1;
    wire [31:0] rcon_out2;
    wire [31:0] rcon_out3;
    wire [31:0] rcon_out4;
    wire [31:0] rcon_out5;
    wire [31:0] rcon_out6;
    wire [31:0] rcon_out7;
    wire [31:0] rcon_out8;
    wire [31:0] rcon_out9;
    wire [31:0] rcon_out10;

    // Assign initial key to w[0] to w[3]
    assign w0 = cipher_key[127:96];
    assign w1 = cipher_key[95:64];
    assign w2 = cipher_key[63:32];
    assign w3 = cipher_key[31:0];

    // Round 1
    rotword rot0 (.in_word(w3), .out_word(rotword_out1));
    subword sub0 (.in_word(rotword_out1), .out_word(subword_out1));
    rcon rc0 (.round(4'h1), .rcon_word(rcon_out1));
    assign w4 = w0 ^ subword_out1 ^ rcon_out1;
    assign w5 = w1 ^ w4;
    assign w6 = w2 ^ w5;
    assign w7 = w3 ^ w6;

    // Round 2
    rotword rot1 (.in_word(w7), .out_word(rotword_out2));
    subword sub1 (.in_word(rotword_out2), .out_word(subword_out2));
    rcon rc1 (.round(4'h2), .rcon_word(rcon_out2));
    assign w8  = w4 ^ subword_out2 ^ rcon_out2;
    assign w9  = w5 ^ w8;
    assign w10 = w6 ^ w9;
    assign w11 = w7 ^ w10;

    // Round 3
    rotword rot2 (.in_word(w11), .out_word(rotword_out3));
    subword sub2 (.in_word(rotword_out3), .out_word(subword_out3));
    rcon rc2 (.round(4'h3), .rcon_word(rcon_out3));
    assign w12 = w8 ^ subword_out3 ^ rcon_out3;
    assign w13 = w9 ^ w12;
    assign w14 = w10 ^ w13;
    assign w15 = w11 ^ w14;

    // Round 4
    rotword rot3 (.in_word(w15), .out_word(rotword_out4));
    subword sub3 (.in_word(rotword_out4), .out_word(subword_out4));
    rcon rc3 (.round(4'h4), .rcon_word(rcon_out4));
    assign w16 = w12 ^ subword_out4 ^ rcon_out4;
    assign w17 = w13 ^ w16;
    assign w18 = w14 ^ w17;
    assign w19 = w15 ^ w18;

    // Round 5
    rotword rot4 (.in_word(w19), .out_word(rotword_out5));
    subword sub4 (.in_word(rotword_out5), .out_word(subword_out5));
    rcon rc4 (.round(4'h5), .rcon_word(rcon_out5));
    assign w20 = w16 ^ subword_out5 ^ rcon_out5;
    assign w21 = w17 ^ w20;
    assign w22 = w18 ^ w21;
    assign w23 = w19 ^ w22;

    // Round 6
    rotword rot5 (.in_word(w23), .out_word(rotword_out6));
    subword sub5 (.in_word(rotword_out6), .out_word(subword_out6));
    rcon rc5 (.round(4'h6), .rcon_word(rcon_out6));
    assign w24 = w20 ^ subword_out6 ^ rcon_out6;
    assign w25 = w21 ^ w24;
    assign w26 = w22 ^ w25;
    assign w27 = w23 ^ w26;

    // Round 7
    rotword rot6 (.in_word(w27), .out_word(rotword_out7));
    subword sub6 (.in_word(rotword_out7), .out_word(subword_out7));
    rcon rc6 (.round(4'h7), .rcon_word(rcon_out7));
    assign w28 = w24 ^ subword_out7 ^ rcon_out7;
    assign w29 = w25 ^ w28;
    assign w30 = w26 ^ w29;
    assign w31 = w27 ^ w30;

    // Round 8
    rotword rot7 (.in_word(w31), .out_word(rotword_out8));
    subword sub7 (.in_word(rotword_out8), .out_word(subword_out8));
    rcon rc7 (.round(4'h8), .rcon_word(rcon_out8));
    assign w32 = w28 ^ subword_out8 ^ rcon_out8;
    assign w33 = w29 ^ w32;
    assign w34 = w30 ^ w33;
    assign w35 = w31 ^ w34;

    // Round 9
    rotword rot8 (.in_word(w35), .out_word(rotword_out9));
    subword sub8 (.in_word(rotword_out9), .out_word(subword_out9));
    rcon rc8 (.round(4'h9), .rcon_word(rcon_out9));
    assign w36 = w32 ^ subword_out9 ^ rcon_out9;
    assign w37 = w33 ^ w36;
    assign w38 = w34 ^ w37;
    assign w39 = w35 ^ w38;

    // Round 10
    rotword rot9 (.in_word(w39), .out_word(rotword_out10));
    subword sub9 (.in_word(rotword_out10), .out_word(subword_out10));
    rcon rc9 (.round(4'hA), .rcon_word(rcon_out10));
    assign w40 = w36 ^ subword_out10 ^ rcon_out10;
    assign w41 = w37 ^ w40;
    assign w42 = w38 ^ w41;
    assign w43 = w39 ^ w42;

    // Output packing
    assign round_keys = {w0, w1, w2, w3,
                         w4, w5, w6, w7,
                         w8, w9, w10, w11,
                         w12, w13, w14, w15,
                         w16, w17, w18, w19,
                         w20, w21, w22, w23,
                         w24, w25, w26, w27,
                         w28, w29, w30, w31,
                         w32, w33, w34, w35,
                         w36, w37, w38, w39,
                         w40, w41, w42, w43};
endmodule
