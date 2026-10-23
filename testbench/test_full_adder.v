
`timescale 1ns/1ps

module test_full_adder;

reg a, b, cin;
wire sum, carry;

full_adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
);

initial begin
    a=0; b=0; cin=0; #10;
    $display("%b %b %b | Sum=%b Carry=%b",a,b,cin,sum,carry);

    a=0; b=0; cin=1; #10;
    $display("%b %b %b | Sum=%b Carry=%b",a,b,cin,sum,carry);

    a=0; b=1; cin=0; #10;
    $display("%b %b %b | Sum=%b Carry=%b",a,b,cin,sum,carry);

    a=0; b=1; cin=1; #10;
    $display("%b %b %b | Sum=%b Carry=%b",a,b,cin,sum,carry);

    a=1; b=0; cin=0; #10;
    $display("%b %b %b | Sum=%b Carry=%b",a,b,cin,sum,carry);

    a=1; b=0; cin=1; #10;
    $display("%b %b %b | Sum=%b Carry=%b",a,b,cin,sum,carry);

    a=1; b=1; cin=0; #10;
    $display("%b %b %b | Sum=%b Carry=%b",a,b,cin,sum,carry);

    a=1; b=1; cin=1; #10;
    $display("%b %b %b | Sum=%b Carry=%b",a,b,cin,sum,carry);

    $finish;
end

endmodule
