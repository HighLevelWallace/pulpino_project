
module spi_interface(
	input  logic scs_i,
	input  logic sck_i,
	input  logic sdi_i,
	output logic sdo_o,

	output logic [1:0] addr_o,
	input  logic [31:0] rdata_i,
	output logic [31:0] wdata_o,
	output logic we_o
);

enum logic [1:0] {RECIVE_CMD, RECIVE_DATA, SEND_DATA} state, next_state;

logic recive_valid;
logic [31:0] recive_data;
logic [31:0] send_data;
reg send_data_valid;
logic send_done;

reg [31:0] cmd_reg;
reg [31:0] data_reg;

always_comb begin
	next_state = state;
	case(state)

		RECIVE_CMD : begin
			if(recive_valid) begin
				if(~recive_data[0]) begin
					next_state = SEND_DATA;
				end 
				else begin
					next_state = RECIVE_DATA;
				end 
			end 
		end 

		RECIVE_DATA : begin
			if (recive_valid) begin
				next_state = RECIVE_CMD;
			end 
		end 

		SEND_DATA : begin
			if(send_done) begin
				next_state = RECIVE_CMD;
			end 
		end 

		default : next_state = RECIVE_CMD;
	endcase 
end 

always_ff @(posedge sck_i, posedge scs_i) begin
	if(scs_i) begin
		state <= RECIVE_CMD;
		send_data_valid <= 1'b0;
		cmd_reg <= 32'h0;
		data_reg <= 32'h0;
		we_o <= 1'b0;
	end 
	else begin
		state <= next_state;
		if (recive_valid && (state == RECIVE_CMD)) begin
			cmd_reg <= recive_data;
			if (~recive_data[0]) begin
				send_data_valid <= 1'b1;
			end 
		end 
		else begin
			send_data_valid <= 1'b0;
		end 
		if (recive_valid && (state == RECIVE_DATA)) begin
			data_reg <= recive_data;
			we_o <= 1'b1;
		end 
		else begin
			we_o <= 1'b0;
		end 
	end 
end 

assign addr_o = cmd_reg[2:1];
assign wdata_o = data_reg;

assign send_data = rdata_i;

spi_reciver reciver_i(
 .scs_i       (scs_i),
 .sck_i       (sck_i),
 .sdi_i       (sdi_i),
 .data_o      (recive_data),
 .data_valid_o(recive_valid)
);

spi_sender sender_i(
	.scs_i       (scs_i),
	.sck_i       (sck_i),
	.sdo_o       (sdo_o),
	.data_i      (send_data),
	.data_valid_i(send_data_valid),
	.done        (send_done)
);
endmodule