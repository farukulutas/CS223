`timescale 1ns / 1ps

module instrMem(input logic [2:0] address, output logic [11:0] instruction);
    logic [7:0] rom[11:0];
    
    initial begin 
        rom[0] = 12'b000_00_001_0010; //same
        rom[1] = 12'b000_11_001_0010; //same
        rom[2] = 12'b001_00_001_0100;
        rom[3] = 12'b101_010_000_001;
        rom[4] = 12'b110_010_000_001;
        for (int i = 5; i < 12; i++) rom[i] = 12'b000000000000;
    end
    
    always_comb begin
        instruction = rom[address];
    end

endmodule