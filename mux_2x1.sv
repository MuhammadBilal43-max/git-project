module mux_2x1 (
    input  logic a,
    input  logic b,
    input  logic sel,
    output logic y
);
    always_comb begin
        // Implemented with unique case
        unique case (sel)
            0: y = b;
            1: y = a;
        endcase
    end
endmodule
