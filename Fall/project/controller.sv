`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmet Faruk Ulutaþ
// 
// Create Date: 24.12.2020 12:14:18
// Design Name: 
// Module Name: controller
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


module controller(input logic [3:0] op,
                     input logic reset,
                     input logic zero,
                     output logic memToReg, memWrite,
                     output logic pcsrc, alusrc,
                     output logic regDst, regWrite,
                     output logic [2:0] alucontrol, stop);

    logic [2:0] aluop;
    logic branch; 
    logic stop; 
    
   // initial begin
   //   stop = 0;
   // end
    
    always_comb 
    begin
        if(reset) begin
            regWrite <= 0;
            memWrite <= 0;
        end
        
        case(op[3:1])
            3'b000: begin
                if(op[0] == 0) 
                begin
                    branch = 0;
                    memToReg = 0;
                    memWrite = 1;
                    alusrc = 0;
                    regDst = 1; 
                    regWrite = 0;
                    alucontrol = 3'b000;
                end
                else if(op[0] == 1) 
                begin
                    branch = 0;
                    memToReg = 0;
                    memWrite = 1;
                    alusrc = 1;
                    regDst = 0; 
                    regWrite = 0;
                    alucontrol = 3'b000;
                end
            end
            3'b001: begin
                if(op[0] == 0) 
                begin
                    branch = 0;
                    memToReg = 1;
                    memWrite = 0;
                    alusrc = 0;
                    regDst = 1; 
                    regWrite = 1;
                    alucontrol = 3'b001;
                end
                else if(op[0] == 1) 
                begin
                    branch = 0;
                    memToReg = 0;
                    memWrite = 0;
                    alusrc = 1;
                    regDst = 0; 
                    regWrite = 1;
                    alucontrol = 3'b001;
                end
            end
            3'b010: begin
                branch = 0;
                memToReg = 0;
                memWrite = 0;
                alusrc = 0;
                regDst = 0; 
                regWrite = 1;
                alucontrol = 3'b010;
            end
            3'b101: begin
                branch = 1;
                memToReg = 0;
                memWrite = 0;
                alusrc = 0;
                regDst = 0; 
                regWrite = 0;
                alucontrol = 3'b101;
            end
            3'b111: begin
                stop = 1;
            end
            default: begin
                memToReg = 0;
                memWrite = 0;
                alusrc = 0;
                regDst = 0; 
                regWrite = 0;
                alucontrol = 3'b100;
            end
        endcase
    end

    assign pcsrc = branch & zero;

endmodule