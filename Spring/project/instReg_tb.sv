`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2021 03:04:07
// Design Name: 
// Module Name: instReg_tb
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


module instReg_tb(); 

logic clk; 

logic reset; 

logic [11:0] instr; 

logic [11:0] instrOut; 

  

instReg ireg(clk, reset, instr, instrOut); 

  

always 

    begin 

        clk <= 1; # 5; clk <= 0; # 5; 

    end 

  

initial 

  

    begin 

    reset = 1;  

        instr = 12'b000000010010; # 10; 

        instr = 12'b000110010010; # 10; 

        instr = 12'b001000010100; # 10; 

        instr = 12'b101010000001; # 10; 

        instr = 12'b110010000001; # 10;  

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

    reset = 0;  

        instr = 12'b000000010010; # 10; 

        instr = 12'b000110010010; # 10; 

        instr = 12'b001000010100; # 10; 

        instr = 12'b101010000001; # 10; 

        instr = 12'b110010000001; # 10;  

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 

        instr = 12'b000000000000; # 10; 
  

    end 

  

endmodule 