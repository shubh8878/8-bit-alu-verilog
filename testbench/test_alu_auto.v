`timescale 1ns/1ps

module test_alu_auto;

reg [7:0] a, b;
reg [2:0] sel;
wire [7:0] result;
wire carry, borrow, zero, overflow;
integer errors;

alu_8bit dut (
    .a(a), .b(b), .sel(sel),
    .result(result), .carry(carry),
    .borrow(borrow), .zero(zero),
    .overflow(overflow)
);

task check;
    input [7:0] expected;
    input ec, eb, ez, eo;
    begin
        #1;
        if (result !== expected || carry !== ec ||
            borrow !== eb || zero !== ez || overflow !== eo) begin
            $display("FAIL: A=%d B=%d sel=%b result=%d",
                     a, b, sel, result);
            errors = errors + 1;
        end
        else
            $display("PASS: sel=%b result=%d zero=%b",
                     sel, result, zero);
    end
endtask

initial begin
    errors = 0;
    $dumpfile("alu.vcd");
    $dumpvars(0, test_alu_auto);

    a=5; b=3; sel=0; check(8,0,0,0,0);
    a=255; b=1; sel=0; check(0,1,0,1,0);
    a=127; b=1; sel=0; check(128,0,0,0,1);

    a=5; b=3; sel=1; check(2,0,0,0,0);
    a=3; b=5; sel=1; check(254,0,1,0,0);
    a=128; b=1; sel=1; check(127,0,0,0,1);

    a=5; b=3; sel=2; check(1,0,0,0,0);
    a=5; b=3; sel=3; check(7,0,0,0,0);
    a=5; b=3; sel=4; check(6,0,0,0,0);
    a=5; b=0; sel=5; check(250,0,0,0,0);
    a=5; b=3; sel=6; check(254,0,0,0,0);
    a=5; b=3; sel=7; check(248,0,0,0,0);
    a=0; b=0; sel=2; check(0,0,0,1,0);

    if (errors == 0)
        $display("ALL TESTS PASSED!");
    else
        $display("TESTS FAILED: %d errors", errors);

    $finish;
end

endmodule
