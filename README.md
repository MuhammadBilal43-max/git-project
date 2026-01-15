# SystemVerilog Multiplexer (MUX) Using Assign Statement

## 📌 Overview
This repository contains simple and synthesizable **SystemVerilog multiplexer (MUX)** implementations using **continuous assignment (`assign`)** statements.  
These designs demonstrate how to implement combinational multiplexers without using procedural blocks like `always`.

---

## 📂 Included Modules

### 1️⃣ 2:1 Multiplexer
Selects between two single-bit inputs based on a select signal.

```systemverilog
module mux2x1 (
    input  logic a,
    input  logic b,
    input  logic sel,
    output logic y
);
    assign y = sel ? b : a;
endmodule
