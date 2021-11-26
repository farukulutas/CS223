`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2021 23:04:25
// Design Name: 
// Module Name: PC
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


module PC(
    input logic clk,
    input logic reset,
    input logic increment,
    input logic set,
    input logic [2:0] address,	
    input logic [11:0] instr,
    output logic [2:0] addrOut,
    output logic [11:0] instrOut
    );
    
    always @ (posedge clk) begin
        if ( ~reset ) begin
            addrOut <= 3'b000;
        end
        else if (set) begin
            instrOut = instr;
        end
        else if ( increment) begin
            addrOut <= address + 1;
        end
    end
endmodule
