`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2021 02:21:49
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


module controller_tb();
    
    logic [11:0] instruction;
    logic [1:0] ALUop;
    logic D_rd;
    logic D_wd;
    logic [3:0] D_addr;
    logic isExternal;
    logic RF_we;
    logic [2:0] RF_waddr;
    logic [2:0] RF_raddr;
    logic [2:0] RF_raddr2;
    
    controller dut( instruction, ALUop, D_rd, D_wd, D_addr, isExternal, RF_we, RF_waddr, RF_raddr, RF_raddr2);
    
    initial begin        
        instruction = 12'b000_00_001_0010; //same
        #10;
        instruction = 12'b000_11_001_0010; //same
        #10;
        instruction = 12'b001_00_001_0100;
        #10;
        instruction = 12'b101_010_000_001;
        #10;
        instruction = 12'b110_010_000_001;
        #10;
    end
    
endmodule
