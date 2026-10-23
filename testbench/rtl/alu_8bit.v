`timescale 1ns/1ps

module alu_8bit(
    input [7:0] a,
    input [7:0] b,
    input [2:0] sel,
    output reg [7:0] result,
    output reg carry,
    output reg borrow,
    output reg zero,
    output reg overflow
);

always @(*) begin
    result = 8'b0;
    carry = 1'b0;
    borrow = 1'b0;
    zero = 1'b0;
    overflow = 1'b0;

    case (sel)
        3'b000: begin
            {carry, result} = {1'b0, a} + {1'b0, b};
            overflow = (~(a[7] ^ b[7])) & (result[7] ^ a[7]);
        end

        3'b001: begin
            result = a - b;
            borrow = (a < b);
            overflow = (a[7] ^ b[7]) & (result[7] ^ a[7]);
        end

        3'b010: result = a & b;
        3'b011: result = a | b;
        3'b100: result = a ^ b;
        3'b101: result = ~a;
        3'b110: result = ~(a & b);
        3'b111: result = ~(a | b);
    endcase

    zero = (result == 8'b0);
end

endmodule
