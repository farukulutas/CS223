`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmet Faruk Ulutaþ
// 
// Create Date: 25.12.2020 01:36:06
// Design Name: 
// Module Name: controller_tb
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

module scp(input logic clk, reset,
output logic [15:0] pc,
input logic [15:0] instr,
output logic memwrite,
output logic [15:0] aluout, writedata,
input logic [15:0] readdata);
logic memtoreg, alusrc, regdst,
regwrite, jump, pcsrc, zero;
logic [2:0] alucontrol;

controller c(instr[11:26], instr[5:0], zero,
memtoreg, memwrite, pcsrc,
alusrc, regdst, regwrite, jump,
alucontrol);

datapath dp(clk, reset, memtoreg, pcsrc,
alusrc, regdst, regwrite, jump,
alucontrol,
zero, pc, instr,
aluout, writedata, readdata);
endmodule