`timescale 1ns/1ps

module rbl
#(parameter CK_PERIOD = 2)
(
	input  SLEEP,
	output CLK_RBL,
	output CLK_DIV,
	input  CLK
);
reg ck;
initial begin
	ck = 0;
end
always #(CK_PERIOD/2) ck = ~ck;
assign CLK_RBL = ck;
endmodule