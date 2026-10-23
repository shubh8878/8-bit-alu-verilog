
`timescale 1ns/1ps

module test_alu_8bit;

reg [7:0] a, b;
reg [1:0] sel;
wire [7:0] result;
wire carry;

alu_8bit dut (
    .a(a),
    .b(b),
    .sel(sel),
    .result(result),
    .carry(carry)
);

initial begin
    a = 8'd5; b = 8'd3; sel = 2'b00; #10;
    $display("ADD: A=%d B=%d Result=%d Carry=%b", a, b, result, carry);

    a = 8'd5; b = 8'd3; sel = 2'b01; #10;
    $display("SUB: A=%d B=%d Result=%d Carry=%b", a, b, result, carry);

    a = 8'd5; b = 8'd3; sel = 2'b10; #10;
    $display("AND: A=%d B=%d Result=%d Carry=%b", a, b, result, carry);

    a = 8'd5; b = 8'd3; sel = 2'b11; #10;
    $display("OR : A=%d B=%d Result=%d Carry=%b", a, b, result, carry);

    $finish;
end

endmodule
