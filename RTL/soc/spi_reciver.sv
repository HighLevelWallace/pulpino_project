
module spi_reciver(
	input  logic scs_i,
	input  logic sck_i,
	input  logic sdi_i,

	output logic [31:0] data_o,
	output logic data_valid_o
);

parameter counter_target = 5'd31;

reg [31:0] data_shift_reg;
reg [ 4:0] counter;

always @(posedge sck_i or posedge scs_i) begin
	if(scs_i) begin
		data_shift_reg <= 32'h0;
		counter <= 5'b0;
	end 
	else begin
		if (counter != counter_target) begin
			data_shift_reg <= {data_shift_reg[30:0], sdi_i};
			counter = counter + 1'b1;
		end 
		else begin
			counter <= 5'b0;
		end 
	end
end 

assign data_o = {data_shift_reg[30:0], sdi_i};
assign data_valid_o = counter == counter_target;

endmodule