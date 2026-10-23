`timescale 1ns/1ps

module alu_8bit(
    input [7:0] a,
    input [7:0] b,
    input [1:0] sel,
    output reg [7:0] result,
    output reg carry
);

always @(*) begin
    carry = 0;

    case (sel)
        2'b00: {carry, result} = a + b;
        2'b01: result = a - b;
        2'b10: result = a & b;
        2'b11: result = a | b;
    endcase
end

endmodule
