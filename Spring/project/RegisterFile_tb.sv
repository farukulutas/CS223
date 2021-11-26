`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2021 03:51:54
// Design Name: 
// Module Name: RegisterFile_tb
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

module RegisterFile_tb();
 logic clk;
 logic writeEnable;
 logic [2:0] writeAddress;
 logic [2:0] readAddress1;
 logic [2:0] readAddress2;
 logic [3:0] writeData;
 logic [3:0] readData1;
 logic [3:0] readData2;
 
 RegisterFile rf(clk, writeEnable, writeAddress, readAddress1, readAddress2, writeData, readData1, readData2);
 
  always
    begin
        clk = 1; #5; clk = 0; #5;
    end
 
    initial begin
 
    writeEnable = 1;
    writeAddress = 3'b000; readAddress1 = 3'b001; readAddress2 = 3'b010; 
    writeData = 4'b1000; #10;
    writeAddress = 3'b001; readAddress1 = 3'b010; readAddress2 = 3'b011; 
    writeData = 4'b1100; #10;
    writeAddress = 3'b010; readAddress1 = 3'b011; readAddress2 = 3'b100; 
    writeData = 4'b1110; #10;
    
    writeEnable = 0;
    writeAddress = 3'b000; readAddress1 = 3'b000; readAddress2 = 3'b000; 
    writeData = 4'b1000; #10;
    writeAddress = 3'b001; readAddress1 = 3'b001; readAddress2 = 3'b001; 
    writeData = 4'b1100; #10;
    writeAddress = 3'b010; readAddress1 = 3'b010; readAddress2 = 3'b010; 
    writeData = 4'b1110; #10;
    
    end
endmodule
