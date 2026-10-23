
`timescale 1ns/1ps

module test_subtractor_8bit;

reg [7:0] a, b;
wire [7:0] diff;
wire borrow;

subtractor_8bit dut (
    .a(a),
    .b(b),
    .diff(diff),
    .borrow(borrow)
);

initial begin
    a = 8'd10; b = 8'd3; #10;
    $display("A=%d B=%d Diff=%d Borrow=%b", a, b, diff, borrow);

    a = 8'd3; b = 8'd10; #10;
    $display("A=%d B=%d Diff=%d Borrow=%b", a, b, diff, borrow);

    a = 8'd20; b = 8'd20; #10;
    $display("A=%d B=%d Diff=%d Borrow=%b", a, b, diff, borrow);

    $finish;
end

endmodule
