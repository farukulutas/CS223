`timescale 1ns / 1ps

module ALU(
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [1:0] Sel,
    output logic [3:0] Res);
    
    always_comb begin
        case (Sel)
            2'b01: Res = a + b;
            2'b10: Res = a - b;
        endcase
    end
endmodule