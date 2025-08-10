`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 12:15:37 PM
// Design Name: 
// Module Name: mixcolumns
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


module mixcolumns (
    input  wire [127:0] state_in,  // 128-bit flat input (16 bytes)
    output wire [127:0] state_out  // 128-bit flat output
);

    wire [7:0] s0;
    wire [7:0] s1;
    wire [7:0] s2;
    wire [7:0] s3;
    wire [7:0] s4;
    wire [7:0] s5;
    wire [7:0] s6;
    wire [7:0] s7;
    wire [7:0] s8;
    wire [7:0] s9;
    wire [7:0] s10;
    wire [7:0] s11;
    wire [7:0] s12;
    wire [7:0] s13;
    wire [7:0] s14;
    wire [7:0] s15;       // Input state bytes
    wire [7:0] mixed0;   // Output state bytes
    wire [7:0] mixed1;
    wire [7:0] mixed2;
    wire [7:0] mixed3;
    wire [7:0] mixed4;
    wire [7:0] mixed5;
    wire [7:0] mixed6;
    wire [7:0] mixed7;
    wire [7:0] mixed8;
    wire [7:0] mixed9;
    wire [7:0] mixed10;
    wire [7:0] mixed11;
    wire [7:0] mixed12;
    wire [7:0] mixed13;
    wire [7:0] mixed14;
    wire [7:0] mixed15;
    wire [7:0] col00;
    wire [7:0] col01;
    wire [7:0] col02;
    wire [7:0] col03;
    wire [7:0] col10;
    wire [7:0] col11;
    wire [7:0] col12;
    wire [7:0] col13;
    wire [7:0] col20;
    wire [7:0] col21;
    wire [7:0] col22;
    wire [7:0] col23;
    wire [7:0] col30;
    wire [7:0] col31;
    wire [7:0] col32;
    wire [7:0] col33;
    wire [7:0] col40;
    wire [7:0] col41;
    wire [7:0] col42;
    wire [7:0] col43;
    wire [7:0] col50;
    wire [7:0] col51;
    wire [7:0] col52;
    wire [7:0] col53;
    wire [7:0] col60;
    wire [7:0] col61;
    wire [7:0] col62;
    wire [7:0] col63;
    wire [7:0] col70;
    wire [7:0] col71;
    wire [7:0] col72;
    wire [7:0] col73;
    wire [7:0] col80;
    wire [7:0] col81;
    wire [7:0] col82;
    wire [7:0] col83;
    wire [7:0] col90;
    wire [7:0] col91;
    wire [7:0] col92;
    wire [7:0] col93;
    wire [7:0] cola0;
    wire [7:0] cola1;
    wire [7:0] cola2;
    wire [7:0] cola3;
    wire [7:0] colb0;
    wire [7:0] colb1;
    wire [7:0] colb2;
    wire [7:0] colb3;
    wire [7:0] colc0;
    wire [7:0] colc1;
    wire [7:0] colc2;
    wire [7:0] colc3;
    wire [7:0] cold0;
    wire [7:0] cold1;
    wire [7:0] cold2;
    wire [7:0] cold3;
    wire [7:0] cole0;
    wire [7:0] cole1;
    wire [7:0] cole2;
    wire [7:0] cole3;
    wire [7:0] colf0;
    wire [7:0] colf1;
    wire [7:0] colf2;
    wire [7:0] colf3;// Temp storage for GF results

    // Assign flat input to 4x4 matrix style
    assign {s0, s1, s2, s3, 
        s4, s5, s6, s7, 
        s8, s9, s10, s11, 
        s12, s13, s14, s15} = state_in;
  gf_multiplier m00 (.a(s0),  .b(8'h02), .result(col00));
  gf_multiplier m01 (.a(s1),  .b(8'h03), .result(col01));
  gf_multiplier m02 (.a(s2),  .b(8'h01), .result(col02));
  gf_multiplier m03 (.a(s3),  .b(8'h01), .result(col03));
  assign mixed0  = col00 ^ col01 ^ col02 ^ col03;

  gf_multiplier m04 (.a(s4),  .b(8'h02), .result(col10));
  gf_multiplier m05 (.a(s5),  .b(8'h03), .result(col11));
  gf_multiplier m06 (.a(s6),  .b(8'h01), .result(col12));
  gf_multiplier m07 (.a(s7),  .b(8'h01), .result(col13));
  assign mixed4  = col10 ^ col11 ^ col12 ^ col13;

  gf_multiplier m08 (.a(s8),  .b(8'h02), .result(col20));
  gf_multiplier m09 (.a(s9),  .b(8'h03), .result(col21));
  gf_multiplier m10 (.a(s10), .b(8'h01), .result(col22));
  gf_multiplier m11 (.a(s11), .b(8'h01), .result(col23));
  assign mixed8  = col20 ^ col21 ^ col22 ^ col23;

  gf_multiplier m12 (.a(s12),  .b(8'h02), .result(col30));
  gf_multiplier m13 (.a(s13),  .b(8'h03), .result(col31));
  gf_multiplier m14 (.a(s14),  .b(8'h01), .result(col32));
  gf_multiplier m15 (.a(s15),  .b(8'h01), .result(col33));
  assign mixed12 = col30 ^ col31 ^ col32 ^ col33;

  gf_multiplier m16 (.a(s0),  .b(8'h01), .result(col40));
  gf_multiplier m17 (.a(s1),  .b(8'h02), .result(col41));
  gf_multiplier m18 (.a(s2),  .b(8'h03), .result(col42));
  gf_multiplier m19 (.a(s3),  .b(8'h01), .result(col43));
  assign mixed1  = col40 ^ col41 ^ col42 ^ col43;

  gf_multiplier m20 (.a(s4),  .b(8'h01), .result(col50));
  gf_multiplier m21 (.a(s5),  .b(8'h02), .result(col51));
  gf_multiplier m22 (.a(s6),  .b(8'h03), .result(col52));
  gf_multiplier m23 (.a(s7),  .b(8'h01), .result(col53));
  assign mixed5 = col50 ^ col51 ^ col52 ^ col53;

  gf_multiplier m24 (.a(s8),  .b(8'h01), .result(col60));
  gf_multiplier m25 (.a(s9),  .b(8'h02), .result(col61));
  gf_multiplier m26 (.a(s10), .b(8'h03), .result(col62));
  gf_multiplier m27 (.a(s11), .b(8'h01), .result(col63));
  assign mixed9  = col60 ^ col61 ^ col62 ^ col63;

  gf_multiplier m28 (.a(s12),  .b(8'h01), .result(col70));
  gf_multiplier m29 (.a(s13),  .b(8'h02), .result(col71));
  gf_multiplier m30 (.a(s14),  .b(8'h03), .result(col72));
  gf_multiplier m31 (.a(s15),  .b(8'h01), .result(col73));
  assign mixed13 = col70 ^ col71 ^ col72 ^ col73;

  gf_multiplier m32 (.a(s0),  .b(8'h01), .result(col80));
  gf_multiplier m33 (.a(s1),  .b(8'h01), .result(col81));
  gf_multiplier m34 (.a(s2),  .b(8'h02), .result(col82));
  gf_multiplier m35 (.a(s3),  .b(8'h03), .result(col83));
  assign mixed2  = col80 ^ col81 ^ col82 ^ col83;

  gf_multiplier m36 (.a(s4),  .b(8'h01), .result(col90));
  gf_multiplier m37 (.a(s5),  .b(8'h01), .result(col91));
  gf_multiplier m38 (.a(s6),  .b(8'h02), .result(col92));
  gf_multiplier m39 (.a(s7),  .b(8'h03), .result(col93));
  assign mixed6  = col90 ^ col91 ^ col92 ^ col93;

  gf_multiplier m40 (.a(s8),  .b(8'h01), .result(cola0));
  gf_multiplier m41 (.a(s9),  .b(8'h01), .result(cola1));
  gf_multiplier m42 (.a(s10), .b(8'h02), .result(cola2));
  gf_multiplier m43 (.a(s11), .b(8'h03), .result(cola3));
  assign mixed10 = cola0 ^ cola1 ^ cola2 ^ cola3;

  gf_multiplier m44 (.a(s12),  .b(8'h01), .result(colb0));
  gf_multiplier m45 (.a(s13),  .b(8'h01), .result(colb1));
  gf_multiplier m46 (.a(s14),  .b(8'h02), .result(colb2));
  gf_multiplier m47 (.a(s15),  .b(8'h03), .result(colb3));
  assign mixed14 = colb0 ^ colb1 ^ colb2 ^ colb3;

  gf_multiplier m48 (.a(s0),  .b(8'h03), .result(colc0));
  gf_multiplier m49 (.a(s1),  .b(8'h01), .result(colc1));
  gf_multiplier m50 (.a(s2),  .b(8'h01), .result(colc2));
  gf_multiplier m51 (.a(s3),  .b(8'h02), .result(colc3));
  assign mixed3  = colc0 ^ colc1 ^ colc2 ^ colc3;

  gf_multiplier m52 (.a(s4),  .b(8'h03), .result(cold0));
  gf_multiplier m53 (.a(s5),  .b(8'h01), .result(cold1));
  gf_multiplier m54 (.a(s6),  .b(8'h01), .result(cold2));
  gf_multiplier m55 (.a(s7),  .b(8'h02), .result(cold3));
  assign mixed7  = cold0 ^ cold1 ^ cold2 ^ cold3;

  gf_multiplier m56 (.a(s8),  .b(8'h03), .result(cole0));
  gf_multiplier m57 (.a(s9),  .b(8'h01), .result(cole1));
  gf_multiplier m58 (.a(s10), .b(8'h01), .result(cole2));
  gf_multiplier m59 (.a(s11), .b(8'h02), .result(cole3));
  assign mixed11 = cole0 ^ cole1 ^ cole2 ^ cole3;

  gf_multiplier m60 (.a(s12),  .b(8'h03), .result(colf0));
  gf_multiplier m61 (.a(s13),  .b(8'h01), .result(colf1));
  gf_multiplier m62 (.a(s14),  .b(8'h01), .result(colf2));
  gf_multiplier m63 (.a(s15),  .b(8'h02), .result(colf3));
  assign mixed15 = colf0 ^ colf1 ^ colf2 ^ colf3;

assign state_out = {mixed0, mixed1, mixed2, mixed3, 
                    mixed4, mixed5, mixed6, mixed7, 
                    mixed8, mixed9, mixed10, mixed11, 
                    mixed12, mixed13, mixed14, mixed15};


endmodule