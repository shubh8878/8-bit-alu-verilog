
`timescale 1ns/1ps

module test_alu_auto;

reg [7:0] a, b;
reg [1:0] sel;
wire [7:0] result;
wire carry;

integer errors;

alu_8bit dut (
    .a(a),
    .b(b),
    .sel(sel),
    .result(result),
    .carry(carry)
);

task check;
    input [7:0] expected;
    begin
        #1;
        if (result !== expected) begin
            $display("FAIL: A=%d B=%d sel=%b got=%d expected=%d",
                     a, b, sel, result, expected);
            errors = errors + 1;
        end
        else begin
            $display("PASS: A=%d B=%d sel=%b result=%d",
                     a, b, sel, result);
        end
    end
endtask

initial begin
    errors = 0;

    a = 5; b = 3; sel = 2'b00; check(8);
    a = 255; b = 1; sel = 2'b00; check(0);

    a = 5; b = 3; sel = 2'b01; check(2);
    a = 3; b = 5; sel = 2'b01; check(254);

    a = 5; b = 3; sel = 2'b10; check(1);
    a = 5; b = 3; sel = 2'b11; check(7);

    if (errors == 0)
        $display("ALL TESTS PASSED!");
    else
        $display("TESTS FAILED: %d errors", errors);

    $finish;
end

endmodule
