`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2021 02:59:49
// Design Name: 
// Module Name: instrMem_tb
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


module instrMem_tb(); 

logic [2:0] address; 

logic [11:0] instruction; 

  

instrMem im(address, instruction); 

  

initial 

  

    begin 

    address = 3'b000; #10; 

    address = 3'b001; #10; 

    address = 3'b010; #10; 

    address = 3'b011; #10; 

    end 

  

endmodule 
