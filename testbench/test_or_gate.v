
`timescale 1ns/1ps

module test_or_gate;

reg a, b;
wire y;

or_gate dut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    a = 0; b = 0; #10;
    $display("A=%b B=%b Y=%b", a, b, y);

    a = 0; b = 1; #10;
    $display("A=%b B=%b Y=%b", a, b, y);

    a = 1; b = 0; #10;
    $display("A=%b B=%b Y=%b", a, b, y);

    a = 1; b = 1; #10;
    $display("A=%b B=%b Y=%b", a, b, y);

    $finish;
end

endmodule
