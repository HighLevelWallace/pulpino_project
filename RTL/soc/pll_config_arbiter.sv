
module pll_config_arbiter(
	input  logic        clk,
	input  logic        rst_n,

	input  logic [31:0] ch1_wdata_i,
	input  logic        ch1_valid_i,
	output logic        ch1_ready_o,

	input  logic [31:0] ch2_wdata_i,
	input  logic        ch2_valid_i,
	output logic        ch2_ready_o,

	output logic [31:0] wdata_o,
	output logic        valid_o,
	input  logic        ready_i
);

enum logic [2:0] {IDLE, CH1_BUSY, CH2_BUSY, CH1_RELEASE, 
                  CH2_RELEASE} state, next_state;

always_ff @(posedge clk, negedge rst_n) begin
	if(~rst_n) begin
		state <= IDLE;
	end 
	else begin
		state <= next_state;
	end 
end 

always_comb begin
	next_state = state;
	case (state)

		IDLE : begin
			if(ch1_valid_i) begin
				next_state = CH1_BUSY;
			end 
			else if(ch2_valid_i)begin
				next_state = CH2_BUSY;
			end 
		end 

		CH1_BUSY : begin
			if(ready_i) begin
				next_state = CH1_RELEASE;
			end 
		end 

		CH2_BUSY : begin
			if(ready_i) begin
				next_state = CH2_RELEASE;
			end 
		end 

		CH1_RELEASE : begin
			if(~ch1_valid_i) begin
				next_state = IDLE;
			end 
		end 

		CH2_RELEASE : begin
			if(~ch2_valid_i) begin
				next_state =IDLE;
			end 
		end

		default : next_state = IDLE; 
	endcase 
end 

assign wdata_o = ((state == CH2_BUSY) | (state == CH2_RELEASE)) 
                 ? ch2_wdata_i : ch1_wdata_i; 
assign valid_o = ((state == CH2_BUSY) | (state == CH2_RELEASE)) 
                 ? ch2_valid_i : ch1_valid_i;
assign ch1_ready_o = state == CH1_RELEASE;
assign ch2_ready_o = state == CH2_RELEASE;
endmodule