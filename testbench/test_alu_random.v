`timescale 1ns/1ps

module test_alu_random;

reg [7:0] a, b;
reg [2:0] sel;
wire [7:0] result;
wire carry, borrow, zero, overflow;

reg [8:0] expected_sum;
reg [7:0] expected_result;
integer i, errors;

alu_8bit dut (
    .a(a), .b(b), .sel(sel),
    .result(result), .carry(carry),
    .borrow(borrow), .zero(zero),
    .overflow(overflow)
);

initial begin
    errors = 0;

    for (i = 0; i < 100; i = i + 1) begin
        a = $random;
        b = $random;
        sel = $random;
        #1;

        case (sel)
            3'b000: begin
                expected_sum = {1'b0, a} + {1'b0, b};
                expected_result = expected_sum[7:0];
                if (result !== expected_result ||
                    carry !== expected_sum[8] ||
                    borrow !== 0 ||
                    zero !== (expected_result == 0) ||
                    overflow !== ((~(a[7] ^ b[7])) &
                                  (expected_result[7] ^ a[7])))
                    errors = errors + 1;
            end

            3'b001: begin
                expected_result = a - b;
                if (result !== expected_result ||
                    borrow !== (a < b) ||
                    carry !== 0 ||
                    zero !== (expected_result == 0) ||
                    overflow !== ((a[7] ^ b[7]) &
                                  (expected_result[7] ^ a[7])))
                    errors = errors + 1;
            end

            3'b010: expected_result = a & b;
            3'b011: expected_result = a | b;
            3'b100: expected_result = a ^ b;
            3'b101: expected_result = ~a;
            3'b110: expected_result = ~(a & b);
            3'b111: expected_result = ~(a | b);
        endcase

        if (sel >= 3'b010) begin
            if (result !== expected_result ||
                carry !== 0 || borrow !== 0 ||
                zero !== (expected_result == 0) ||
                overflow !== 0)
                errors = errors + 1;
        end
    end

    if (errors == 0)
        $display("RANDOM TESTS PASSED: 100 cases");
    else
        $display("RANDOM TESTS FAILED: %d errors", errors);

    $finish;
end

endmodule
