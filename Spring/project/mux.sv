`timescale 1ns / 1ps
module mux2to1_( input logic [3:0] d0, [3:0] d1, s, output logic [3:0] 
y);
 assign y = s ? d1 : d0; 
endmodule