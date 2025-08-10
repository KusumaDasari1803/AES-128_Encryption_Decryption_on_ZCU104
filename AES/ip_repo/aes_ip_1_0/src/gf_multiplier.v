`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 10:57:07 AM
// Design Name: 
// Module Name: gf_multiplier
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


module gf_multiplier (
    input  wire [7:0] a,
    input  wire [7:0] b,
    output wire [7:0] result
);
    reg [7:0] temp_a;
    reg [7:0] temp_b;
    reg [7:0] temp_result;
    reg [3:0] i;  // 0 to 7 is sufficient

    always @(*) begin
        temp_a = a;
        temp_b = b;
        temp_result = 8'b0;

        for (i = 0; i < 8; i = i + 1) begin
            if (temp_b[0]) begin
                temp_result = temp_result ^ temp_a;
            end
            if (temp_a[7]) begin
                temp_a = (temp_a << 1) ^ 8'h1b;
            end else begin
                temp_a = temp_a << 1;
            end
            temp_b = temp_b >> 1;
        end
    end

    assign result = temp_result;
endmodule
