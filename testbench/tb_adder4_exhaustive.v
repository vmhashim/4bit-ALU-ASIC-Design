
module tb_adder4_exhaustive;

    reg [3:0] A, B;
    reg Cin;

    wire [3:0] Sum;
    wire Cout;

    reg [4:0] expected;

    integer a, b, c;
    integer errors;

    adder4 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        errors = 0;

        for (a = 0; a < 16; a = a + 1) begin
            for (b = 0; b < 16; b = b + 1) begin
                for (c = 0; c < 2; c = c + 1) begin

                    A = a;
                    B = b;
                    Cin = c;

                    expected = a + b + c;

                    #1;

                    if ({Cout, Sum} !== expected) begin
                        errors = errors + 1;
                        $display("FAIL: A=%d B=%d Cin=%d",
                                 A, B, Cin);
                    end

                end
            end
        end

        if (errors == 0)
            $display("PASS: All 512 test cases passed!");
        else
            $display("FAIL: %d errors found", errors);

        $finish;
    end

endmodule
