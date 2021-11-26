`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmet Faruk Ulutaþ
// 
// Create Date: 24.12.2020 12:16:41
// Design Name: 
// Module Name: datapath
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


module datapath(input logic clk, reset,
    input logic memWrite, branch,
    input logic add, memToReg,
    input logic regWrite, jump,
//    input logic [2:0] alucontrol,
//    output logic zero,
    output logic [15:0] pc,
    input logic [15:0] instr,
    output logic [15:0] aluout, writedata,
    input logic [15:0] readdata);
        
logic [4:0] writereg;
logic [15:0] pcnext, pcnextbr, pcplus4, pcbranch;
logic [15:0] result;

// next PC logic
flopr #(16) pcreg(clk, reset, pcnext, pc);
adder pcadd1(pc, 16'b100, pcplus4);
mux2 #(16) pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
mux2 #(16) pcmux(pcnextbr, {pcplus4[31:28],
instr[25:0], 2'b00}, jump, pcnext);

// register file logic
regfile rf(clk, regwrite, instr[25:21], instr[20:16],
writereg, result, srca, writedata);
mux2 #(5) wrmux(instr[20:16], instr[15:11],
regdst, writereg);
mux2 #(16) resmux(aluout, readdata, memtoreg, result);
signext se(instr[15:0], signimm);

// ALU logic
mux2 #(16) srcbmux(writedata, signimm, alusrc, srcb);
alu alu(srca, srcb, alucontrol, aluout, zero);

endmodule