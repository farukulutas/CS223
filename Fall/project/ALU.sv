`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2020 23:14:30
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(input logic [7:0] A, B,
           input logic [2:0] ALUcontrol,
           output logic [7:0] ALUresult, 
           output logic zero);
           
    assign zero = ( A == B );
    
    always_comb
    begin
        case(ALUcontrol)
            3'b000: begin
                ALUresult = B;
            end
            3'b001: begin
                ALUresult = B;
            end
            3'b010: begin
                ALUresult = A + B;
            end
            3'b101: begin
                ALUresult = A - B;
            end
            3'b111: begin
                ALUresult = 0;
            end
            default: begin
                ALUresult = 0;
            end
        endcase
    end

endmodule
