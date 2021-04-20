
module pll_controller(
	input  logic        clk,
	input  logic        rst_n,
       
    input  logic        sysclk_i,
    input  logic        pll_lock_i,
       
	input  logic [31:0] wdata_i,
	input  logic        wdata_valid_i,
	output logic        w_ready_o,

	output logic [31:0] pll_config_o,
	output logic        clk_gate_o
);
parameter pll_default_config = 32'h0010_0277;
parameter dummy_cycles = 8'd127;

reg [31:0] pll_config_reg;
reg [7:0] cycle_cnt;
enum logic [2:0] {IDLE, GATE, CHANGE, WAIT, DONE} state, next_state;

always_comb begin
	next_state = state;
	case(state) 

		IDLE : begin
			if(wdata_valid_i) begin
				next_state = GATE;
			end 
		end 

		GATE : begin
			if(~sysclk_i) begin
				next_state = CHANGE;
			end 
		end 

		CHANGE : begin
			next_state = WAIT;
		end 

		WAIT : begin
			if((cycle_cnt == dummy_cycles) && pll_lock_i) begin
				next_state = DONE;
			end 
		end 

		DONE : begin
			if(~wdata_valid_i) begin
				next_state = IDLE;
			end 
		end 

	endcase 
end 

always_ff @(negedge clk, negedge rst_n) begin
	if(~rst_n) begin
		state <= IDLE;
		pll_config_reg <= pll_default_config;
	end 
	else begin
		state <= next_state;
		if(state==CHANGE) begin
			pll_config_reg <= wdata_i;
		end
	end 
end 

assign pll_config_o = pll_config_reg;
assign clk_gate_o = (state == GATE) | (state == CHANGE) | (state == WAIT);
assign w_ready_o = state == DONE;
always_ff @(negedge clk, negedge rst_n) begin
	if(~rst_n) begin
		cycle_cnt <= 8'h0;
	end 
	else begin
		if(state == WAIT) begin
			if(cycle_cnt != dummy_cycles) begin
				cycle_cnt <= cycle_cnt + 1'b1;
			end 
		end 
		else begin
			cycle_cnt <= 8'h0;
		end 
	end 
end 
endmodule