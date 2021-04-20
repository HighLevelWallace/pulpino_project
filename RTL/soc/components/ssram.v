
module ssram(
	input         SLEEP,
	input         rst_n,
	input         CLK,
	input         CLK_G,
	input         CLK_RBL,
	input         MODE,
	input         BOOST_EN,
	input         CEN,
	input         WEN,
	output        FLAG,
	input [ 11:0] EN,
	input [  7:0] BRS,
	input [255:0] WL_IN,
	input [ 31:0] D,
	output [31:0] Q
);

endmodule