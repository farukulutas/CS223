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


module controller_tb();
    logic [3:0] op;
    logic reset;
    logic zero;
    logic memToReg, memWrite;
    logic pcsrc, alusrc;
    logic regDst, regWrite;
    logic stop;
    
    controller dut (op, reset, zero, memToReg, memWrite, pcsrc, alusrc, regDst, regWrite, alucontrol, stop);

    // initialize test
    initial
        begin
            reset <= 1; # 22; reset <= 0;
        end
    
    initial begin
                    zero = 0;
            stop = 0;
        
        op = 3'b000;
        #10;
        op = 3'b001;
        #10;
        op = 3'b010;
        #10;
        op = 3'b101;
        #10;
        op = 3'b000;
        #10;
        op = 3'b001;
        #10;
        op = 3'b010;
        #10;
        op = 3'b101;
        #10;
        op = 3'b111;
        #10;
    end
    
endmodule
