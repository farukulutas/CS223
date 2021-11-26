`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2021 02:02:34
// Design Name: 
// Module Name: dataMem_tb
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


module dataMem_tb();
    
logic clk, D_wr, D_rd;
logic [3:0] D_addr;
logic [3:0] W_data;
logic [3:0] R_data;

// instantiate device to be tested
dataMem dut (clk, D_wr, D_rd, D_addr, W_data, R_data );

// generate clock to sequence tests
always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end

// check results
initial begin
 D_wr = 1; D_rd = 0;
 W_data = 4'b0000; D_addr = 4'b0000;
 #10;
 W_data = 4'b0010; D_addr = 4'b0001;
 #10;
 W_data = 4'b0100; D_addr = 4'b0010;
 #10;
 W_data = 4'b0110; D_addr = 4'b0011;
 #10;
 W_data = 4'b1000; D_addr = 4'b0100;
 #10;
 W_data = 4'b1010; D_addr = 4'b0101;
 #10;
 W_data = 4'b1100; D_addr = 4'b0110;
 #10;
 W_data = 4'b1110; D_addr = 4'b0111;
 #10;
 D_wr = 0; D_rd = 1;
 W_data = 4'b0000; D_addr = 4'b0000;
 #10;
 W_data = 4'b0010; D_addr = 4'b0001;
 #10;
 W_data = 4'b0100; D_addr = 4'b0010;
 #10;
 W_data = 4'b0110; D_addr = 4'b0011;
 #10;
 W_data = 4'b1000; D_addr = 4'b0100;
 #10;
 W_data = 4'b1010; D_addr = 4'b0101;
 #10;
 W_data = 4'b1100; D_addr = 4'b0110;
 #10;
 W_data = 4'b1110; D_addr = 4'b0111;
 #10;
 end
endmodule
