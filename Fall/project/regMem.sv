`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmet Faruk Ulutaþ
// 
// Create Date: 24.12.2020 23:25:06
// Design Name: 
// Module Name: regMem
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


module regMem(input logic clk, reset, writeEnable,
                  input logic [3:0] writeAddress, readAddress1, readAddress2,
                  input logic [7:0] writeData,
                  output logic [7:0] readData1, readData2);
    
    logic [7:0] mem[15:0];

    assign readData1 = mem[readAddress1];
    assign readData2 = mem[readAddress2];

    always_ff @(posedge clk, posedge reset)
    begin
        if (writeEnable) mem[writeAddress] = writeData;
        if (reset) begin
            for(int i = 0; i <= 15; i++) begin
                mem[i] = 0;
            end
        end
    end
        
endmodule
