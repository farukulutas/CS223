`timescale 1ns / 1ps

module instReg(
    input logic clk,
    input logic reset,
    input logic [11:0] instr,
    output logic [11:0] instrOut
    );
    
    always @ (posedge clk) begin
        if ( reset ) begin
            instrOut <= 0;
        end
        else begin
            instrOut <= instr;
        end
    end
endmodule