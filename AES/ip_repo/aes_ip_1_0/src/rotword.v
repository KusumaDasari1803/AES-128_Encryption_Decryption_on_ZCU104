`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 07:51:15 AM
// Design Name: 
// Module Name: rotword
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


module rotword (
    input  [31:0] in_word,
    output [31:0] out_word 
);

    assign out_word = {in_word[23:0], in_word[31:24]}; // Rotate left by 8 bits (1 byte)

endmodule

