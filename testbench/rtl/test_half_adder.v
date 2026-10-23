
`timescale 1ns/1ps

module test_half_adder;

reg a, b;
wire sum, carry;

half_adder dut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

initial begin
    a = 0; b = 0; #10;
    $display("A=%b B=%b Sum=%b Carry=%b", a, b, sum, carry);

    a = 0; b = 1; #10;
    $display("A=%b B=%b Sum=%b Carry=%b", a, b, sum, carry);

    a = 1; b = 0; #10;
    $display("A=%b B=%b Sum=%b Carry=%b", a, b, sum, carry);

    a = 1; b = 1; #10;
    $display("A=%b B=%b Sum=%b Carry=%b", a, b, sum, carry);

    $finish;
end

endmodule
