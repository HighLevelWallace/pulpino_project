
module spi_sender(
	input  logic scs_i,
	input  logic sck_i,
	output logic sdo_o,

	input  logic [31:0] data_i,
	input  logic data_valid_i,
	output logic done
);

parameter counter_target = 5'd31;

reg [31:0] data_shift_reg;
reg [ 4:0] counter;

always @(negedge sck_i or posedge scs_i) begin
	if (scs_i) begin
		data_shift_reg <= 32'h0;
		counter <= 5'd0;
	end 
	else begin
		if (data_valid_i) begin
			data_shift_reg <= data_i;
			counter <= 5'd0;
		end 
		else if (counter != counter_target) begin
			data_shift_reg <= {data_shift_reg[30:0], 1'b0};
			counter <= counter + 1'b1;
		end 
		else begin
			counter <= 5'd0;
		end 
	end 
end 

assign sdo_o = data_shift_reg[31];
assign done = counter == counter_target;
endmodule