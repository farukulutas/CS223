`timescale 1ns / 1ps

module RegisterFile(
 input logic clk,
 input logic writeEnable,
 input logic [2:0] writeAddress,
 input logic [2:0] readAddress1,
 input logic [2:0] readAddress2,
 input logic [3:0] writeData,
 output logic [3:0] readData1,
 output logic [3:0] readData2);
 
 logic [3:0] rf[7:0];
 
 always_ff @ (posedge clk)
 if (writeEnable)
 rf[writeAddress] <= writeData; 
 assign readData1 = rf[readAddress1];
 assign readData2 = rf[readAddress2];
endmodule