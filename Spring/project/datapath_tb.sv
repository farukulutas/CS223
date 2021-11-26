`timescale 1ns / 1ps

module datapath_tb();

 logic [3:0]R_data;
 logic isExternal;
 logic [2:0]AddrSrc1;
 logic [2:0]AddrSrc2; 
 logic [2:0]AddrDest; 
 //input logic pushButn, 
 logic clk;
 logic[1:0]ALUSel;
 logic [3:0] Rf_data;
 
 datapath datap(R_data, isExternal, AddrSrc1, AddrSrc2, AddrDest, clk, ALUSel, Rf_data);

  always
     begin
        clk = 1; #5; clk = 0; #5;
     end

   initial begin
   isExternal = 1; 
   R_data= 4'b0001; AddrSrc1 = 3'b000; AddrSrc2 = 3'b001; AddrDest = 3'b010; ALUSel = 2'b01; #20;
   R_data= 4'b0010; AddrSrc1 = 3'b001; AddrSrc2 = 3'b010; AddrDest = 3'b011; ALUSel = 2'b01; #20;
   R_data= 4'b0100; AddrSrc1 = 3'b010; AddrSrc2 = 3'b011; AddrDest = 3'b100; ALUSel = 2'b01; #20;
   R_data= 4'b1000; AddrSrc1 = 3'b011; AddrSrc2 = 3'b100; AddrDest = 3'b101; ALUSel = 2'b01; #20;
   
   isExternal = 0;
   R_data= 4'b0001; AddrSrc1 = 3'b000; AddrSrc2 = 3'b001; AddrDest = 3'b010; ALUSel = 2'b01; #20;
   R_data= 4'b0010; AddrSrc1 = 3'b001; AddrSrc2 = 3'b010; AddrDest = 3'b011; ALUSel = 2'b01; #20;
   R_data= 4'b0100; AddrSrc1 = 3'b010; AddrSrc2 = 3'b011; AddrDest = 3'b100; ALUSel = 2'b01; #20;
   R_data= 4'b1000; AddrSrc1 = 3'b011; AddrSrc2 = 3'b100; AddrDest = 3'b101; ALUSel = 2'b01; #20;
   

end

endmodule
