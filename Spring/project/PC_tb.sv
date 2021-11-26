`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2021 04:55:04
// Design Name: 
// Module Name: PC_tb
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

module PCTestBench();
logic clk;
logic reset;
logic increment;
logic set;
logic [2:0] address;
logic [11:0] instr;
logic [11:0] instrOut;
logic [2:0] addressOut;

PC PC(clk, reset, increment, set, address, instr, addressOut, instrOut);
    initial
    begin
        reset <= 1; # 22; reset <= 0;
    end

always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end



initial

    begin

    increment = 1; set = 0; address = 3'b000; # 10;
    increment = 1; set = 0;# 10;
    increment = 1; set = 0;# 10;
    increment = 0; set = 1;# 10;
    instr = 12'b111111111111; # 10;
    instr = 12'b111111111011; # 10;
    instr = 12'b111111111000; # 10;


end


endmodule