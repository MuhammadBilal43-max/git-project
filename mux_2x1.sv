module mux_2x1# (
 Parameter WIDTH=2
)(
    input  logic  [WIDTH-1:0] a,   // Input A
    input  logic  [WIDTH-1:0] b,   // Input B
    input  logic  sel, // Select signal
    output logic  [WIDTH-1:0] y    // Output
)
    always_comb begin
        // Implemented with unique case
        unique case (sel)
           1'b0: y = b;
           1'b1: y = a;
        endcase
    end
endmodule

module mux_2x1_tb;

    // Parameter for data width
    parameter WIDTH = 1; // Change this to test different widths

    // Testbench signals
    logic [WIDTH-1:0] a;
    logic [WIDTH-1:0] b;
    logic             sel;
    logic [WIDTH-1:0] y;

    // Instantiate the DUT (Device Under Test)
    mux_2x1 #(.WIDTH(WIDTH)) dut (
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

I have added demux design
=======
// demux_1x2.sv
module demux_1x2 (
    input  logic din,   // Data input
    input  logic sel,   // Select signal
    output logic y0,    // Output 0
    output logic y1     // Output 1
);

    // Demux logic using assign
    assign y0 = (sel == 0) ? din : 1'b0;
    assign y1 = (sel == 1) ? din : 1'b0;

endmodule

