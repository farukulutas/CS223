`timescale 1ns / 1ps

module dataMem(
    input logic clk,
    input logic D_wr,
    input logic D_rd,
    input logic [3:0] D_addr,
    input logic [3:0] W_data,
    output logic [3:0] R_data);
    
    logic [3:0] D[15:0];
    
    initial begin
     D[0] <= 'h0x0;
     D[1] <= 'h0x1;
     D[2] <= 'h0x2;
     D[3] <= 'h0x3;
     D[4] <= 'h0x4;
     D[5] <= 'h0x5;
     D[6] <= 'h0x6;
     D[7] <= 'h0x7;
     D[8] <= 'h0x8;
     D[9] <= 'h0x9;
     D[10] <= 'h0xA;
     D[11] <= 'h0xB;
     D[12] <= 'h0xC;
     D[13] <= 'h0xD;
     D[14] <= 'h0xE;
     D[15] <= 'h0xF;
    end
    
    always_ff @(posedge clk)
    begin
    
        
        if (D_wr) begin
            D[D_addr] <= W_data;
        end
        
        if (D_rd) begin
            R_data <= D[D_addr];
        end
    end
endmodule