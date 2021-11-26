`timescale 1ns / 1ps

module controller(
    input logic [11:0] instruction,
    output logic [1:0] ALUop,
    output logic D_rd,
    output logic D_wd,
    output logic [3:0] D_addr,
    output logic isExternal,
    output logic RF_we,
    output logic [2:0] RF_waddr,
    output logic [2:0] RF_raddr,
    output logic [2:0] RF_raddr2
    );
    
    // next state logic
    always_comb begin
        case ( instruction[11:9])
            3'b000: begin
                ALUop = 2'b00;
                D_addr = instruction[3:0];
                D_rd = 1;
                D_wd = 0;
                isExternal = 1;
                RF_we = 1;
                RF_waddr = instruction[6:4];    
                end
            3'b001: begin
                ALUop = 2'b00;
                D_addr = instruction[3:0];
                D_rd = 0;
                D_wd = 1;
                isExternal = 1;
                RF_we = 0;
                RF_raddr = instruction[6:4];
                end
            3'b101: begin
                ALUop = 2'b01;
                D_rd = 0;
                D_wd = 0;
                isExternal = 0;
                RF_raddr = instruction[2:0];
                RF_raddr2 = instruction[5:3];
                RF_we = 1;
                RF_waddr = instruction[8:6];
                end
            3'b110: begin
                ALUop = 2'b10;
                D_rd = 0;
                D_wd = 0;
                isExternal = 0;
                RF_raddr = instruction[2:0];
                RF_raddr2 = instruction[5:3];
                RF_we = 1;
                RF_waddr = instruction[8:6];
                end
        endcase
    end
endmodule