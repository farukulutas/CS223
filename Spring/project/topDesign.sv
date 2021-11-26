`timescale 1ns / 1ps

module topDesign(
    input logic clk,
    input logic leftButton,
    input logic rightButton,
    input logic [11:0] instr,
    output logic [6:0] seg,
    output logic dp,
    output logic [3:0] an
    );  
    
    logic [1:0] ALUop;
    logic D_rd, D_wd;
    logic [3:0] D_addr;
    logic isExternal, RF_we;
    logic [2:0] RF_waddr, RF_raddr, RF_raddr2;
    logic pulse3, pulse4;
    logic [2:0] address;
    logic [11:0] linstr;
    logic [11:0] linstr2;
    logic increment;
    logic set;
    logic [2:0] addrOut;
    logic [3:0] R_data;
    logic [3:0] Rf_data;
    logic reset;

    debouncer de3(clk, leftButton, pulse1);
    debouncer de4(clk, rightButton, pulse2);
    
    initial begin
        reset = 0;
        address = 3'b000;
        increment = 0;
        set = 0;
    end
    
    always_ff @(posedge clk) begin
        if (pulse1) begin
            increment = 1;
        end
        else if (pulse2) begin
            set = 1;
        end
    end
    
    PC( clk, reset, increment, set, address, instr, addrOut, linstr);
    instrMem im( addrOut, linstr);
    instReg instReg( clk, reset, linstr, linstr2);
    controller control(linstr2, ALUop, D_rd, D_wd, D_addr, isExternal, RF_we, RF_waddr, RF_raddr, RF_raddr2);
    dataMem( clk, D_wd, D_rd, D_addr, Rf_data, R_data);
    datapath( R_data, isExternal, RF_raddr, RF_raddr2, RF_waddr, leftButton, clk, ALUop, Rf_data, seg, dp, an);

endmodule