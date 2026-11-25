
module tb_adder4;

    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    adder4 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("simulation/adder4.vcd");
        $dumpvars(0, tb_adder4);

        A = 4'b0101; B = 4'b0011; Cin = 0;
        #10;
        $display("A=%b B=%b Cin=%b Sum=%b Cout=%b",
                  A, B, Cin, Sum, Cout);

        A = 4'b1111; B = 4'b0001; Cin = 0;
        #10;
        $display("A=%b B=%b Cin=%b Sum=%b Cout=%b",
                  A, B, Cin, Sum, Cout);

        A = 4'b1010; B = 4'b0101; Cin = 0;
        #10;
        $display("A=%b B=%b Cin=%b Sum=%b Cout=%b",
                  A, B, Cin, Sum, Cout);

        $finish;
    end

endmodule
