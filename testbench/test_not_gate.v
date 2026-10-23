
`timescale 1ns/1ps

module test_not_gate;

reg a;
wire y;

not_gate dut (
    .a(a),
    .y(y)
);

initial begin
    a = 0; #10;
    $display("A=%b Y=%b", a, y);

    a = 1; #10;
    $display("A=%b Y=%b", a, y);

    $finish;
end

endmodule
