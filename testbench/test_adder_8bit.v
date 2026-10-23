
`timescale 1ns/1ps

module test_adder_8bit;

reg [7:0] a, b;
wire [7:0] sum;
wire carry;

adder_8bit dut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

initial begin
    a = 8'd5; b = 8'd3; #10;
    $display("A=%d B=%d Sum=%d Carry=%b", a, b, sum, carry);

    a = 8'd255; b = 8'd1; #10;
    $display("A=%d B=%d Sum=%d Carry=%b", a, b, sum, carry);

    a = 8'd10; b = 8'd20; #10;
    $display("A=%d B=%d Sum=%d Carry=%b", a, b, sum, carry);

    $finish;
end

endmodule
