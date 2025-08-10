`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 08:05:10 AM
// Design Name: 
// Module Name: rcon
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


module rcon(
    input  [3:0] round,       // Round number: 1 to 10
    output reg [31:0] rcon_word // 32-bit Rcon value
);

    always @(*) begin
        case (round)
            4'd1:  rcon_word = 32'h01000000;
            4'd2:  rcon_word = 32'h02000000;
            4'd3:  rcon_word = 32'h04000000;
            4'd4:  rcon_word = 32'h08000000;
            4'd5:  rcon_word = 32'h10000000;
            4'd6:  rcon_word = 32'h20000000;
            4'd7:  rcon_word = 32'h40000000;
            4'd8:  rcon_word = 32'h80000000;
            4'd9:  rcon_word = 32'h1B000000;
            4'd10: rcon_word = 32'h36000000;
            default: rcon_word = 32'h00000000;
        endcase
    end

endmodule

