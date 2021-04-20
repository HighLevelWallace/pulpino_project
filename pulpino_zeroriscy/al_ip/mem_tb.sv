`timescale 1ns/1ps
module mem_tb();

wire [31:0] data_o;
reg [7:0] addr;
reg clk;
reg ce;

glbl glbl();

mem_blk 
	// #(.CHIP_NO(0))
    uut
 	(
        .doa(data_o), .addra(addr), .cea(ce), .clka(clk), .dia({16{2'b01}}), .wea(1'b0)
    );

initial begin
    addr = 0;
    clk = 0;
    ce = 1;
    
    #100 ce = ~ce;
    #400 ce = ~ce; 
end

always begin
    #5 clk = ~clk;
end

always begin
    #30 addr <= addr + 1;
end


endmodule