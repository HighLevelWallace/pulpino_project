
module decoder_3to8(
	input  [2:0] addr_i,
	output [7:0] select_o
);
assign select_o[0] = (addr_i == 3'd0) ? 1 : 0;
assign select_o[1] = (addr_i == 3'd1) ? 1 : 0;
assign select_o[2] = (addr_i == 3'd2) ? 1 : 0;
assign select_o[3] = (addr_i == 3'd3) ? 1 : 0;
assign select_o[4] = (addr_i == 3'd4) ? 1 : 0;
assign select_o[5] = (addr_i == 3'd5) ? 1 : 0;
assign select_o[6] = (addr_i == 3'd6) ? 1 : 0;
assign select_o[7] = (addr_i == 3'd7) ? 1 : 0;
endmodule