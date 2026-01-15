module mux_2x1 (
    input  logic a,
    input  logic b,
    input  logic sel,
    output logic y
);
    always_comb begin
        // Implemented with unique case
        unique case (sel)
           1'b0: y = b;
           1'b1: y = a;
        endcase
    end
endmodule

module tb_mux_2x1;

    // Testbench signals
    logic a;
    logic b;
    logic sel;
    logic y;

    // Instantiate the DUT (Device Under Test)
    mux_2x1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    // Test procedure
    initial begin
        $display("Time\t a b sel | y");
        $monitor("%0t\t %b %b  %b | %b", $time, a, b, sel, y);

        // Test all input combinations
        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 1; b = 0; sel = 0; #10;
        a = 1; b = 1; sel = 0; #10;

        a = 0; b = 0; sel = 1; #10;
        a = 0; b = 1; sel = 1; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 1; b = 1; sel = 1; #10;

        $display("Test completed");
        $finish;
    end

endmodule

