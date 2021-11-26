`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmet Faruk Ulutaþ
// 
// Create Date: 25.12.2020 01:02:52
// Design Name: 
// Module Name: regMem_tb
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


module dataMemory_tb();

logic clk, reset, writeEnable;
logic [3:0] writeAddress, readAddress1, readAddress2;
logic [7:0] writeData;
logic [7:0] readData1, readData2;

// instantiate device to be tested
dataMemory dut (clk, reset, writeEnable, writeAddress, readAddress1, readAddress2, writeData, readData1, readData2);

// initialize test
initial
    begin
        reset <= 1; # 22; reset <= 0;
    end

// generate clock to sequence tests
always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end

// check results
initial begin
 writeEnable = 1;
 writeAddress = 4'b0000; writeData = 8'b00010001;
 readAddress1 = 4'b0000; readAddress2 = 4'b0000;
 #10;
 writeAddress = 4'b0001; writeData = 8'b00010011;
 readAddress1 = 4'b0000; readAddress2 = 4'b0001;
 #10;
 writeAddress = 4'b0010; writeData = 8'b00010111;
 readAddress1 = 4'b0001; readAddress2 = 4'b0010;
 #10;
 writeAddress = 4'b0011; writeData = 8'b01110001;
 readAddress1 = 4'b0001; readAddress2 = 4'b0011;
 #10;
 writeAddress = 4'b0100; writeData = 8'b00011101;
 readAddress1 = 4'b0010; readAddress2 = 4'b0100;
 #10;
 writeAddress = 4'b0101; writeData = 8'b11110001;
 readAddress1 = 4'b0011; readAddress2 = 4'b0101;
 #10;
 writeAddress = 4'b0110; writeData = 8'b00010011;
 readAddress1 = 4'b0101; readAddress2 = 4'b0110;
 #10;
 writeAddress = 4'b0111; writeData = 8'b01110001;
 readAddress1 = 4'b0110; readAddress2 = 4'b0111;
 #10;
 writeAddress = 4'b1000; writeData = 8'b00000001;
 readAddress1 = 4'b0111; readAddress2 = 4'b1000;
 #10;
 writeAddress = 4'b1001; writeData = 8'b00000011;
 readAddress1 = 4'b1000; readAddress2 = 4'b1001;
 #10;
 writeAddress = 4'b1010; writeData = 8'b10010001;
 readAddress1 = 4'b1001; readAddress2 = 4'b1010;
 #10;
 writeAddress = 4'b1011; writeData = 8'b11010001;
 readAddress1 = 4'b1010; readAddress2 = 4'b1011;
 #10;
 writeAddress = 4'b1100; writeData = 8'b00011111;
 readAddress1 = 4'b1011; readAddress2 = 4'b1100;
 #10;
 writeAddress = 4'b1101; writeData = 8'b00011001;
 readAddress1 = 4'b1011; readAddress2 = 4'b1101;
 #10;
 writeAddress = 4'b1110; writeData = 8'b00110001;
 readAddress1 = 4'b1101; readAddress2 = 4'b1110;
 #10;
 writeAddress = 4'b1111; writeData = 8'b00110011;
 readAddress1 = 4'b1111; readAddress2 = 4'b1111;
 #10;
 end
endmodule