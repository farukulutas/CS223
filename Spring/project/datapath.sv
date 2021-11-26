`timescale 1ns / 1ps
module datapath(input logic [3:0]R_data, 
        input logic isExternal, 
        input logic [2:0]AddrSrc1,
        input logic [2:0]AddrSrc2, 
        input logic [2:0]AddrDest, 
        //input logic pushButn, 
        input logic clk, 
        input logic[1:0]ALUSel,
        output logic [3:0] result
        //output logic [6:0] seg, logic dp,
        //output [3:0] an
        );
    
    logic [3:0] out;
    logic [3:0] rdd1;
    logic [3:0] rdd2;
 //   logic  pulse;
//    logic [3:0]result;

    //assign pulseout = pulse;
    
 //debouncer d1(clk, pushButn, pulse);
 mux2to1_ m2(result, R_data, isExternal, out);
 RegisterFile r2(clk, pulse, AddrSrc1, AddrSrc2, AddrDest, out, rdd1, rdd2);
 ALU a2(rdd1, rdd2, ALUSel, result);
 //SevenSegmentDisplay s2(clk, rdd1, rdd2, 17, result, seg, dp, an );
 //assign Rf_data = result;
endmodule