module ssram
#(//parameter TBL_FILE = "I:/pulpino/tbl.dat",
  //parameter INI_FILE = "I:/pulpino/ini.dat"
)
(
	input  logic         SLEEP,
	input  logic         rst_n,
	input  logic         CLK,
	input  logic         CLK_G,
	input  logic         CLK_RBL,
	input  logic         MODE,
	input  logic         BOOST_EN,
	input  logic         CEN,
	input  logic         WEN,
	output logic         FLAG,
	input  logic [ 11:0] EN,
	input  logic [  7:0] BRS,
	input  logic [255:0] WL_IN,
	input  logic [ 31:0] D,
	output logic [ 31:0] Q
);
//the code in blow is only for simulation
//in systhesis this module should be a black box
logic [31:0] mem[256];
logic [4:0] Tbl[256];

logic [4:0] remaining_tbl, remaining_tbl_d;
logic [4:0] tbl_cnt, tbl_cnt_d;
logic [4:0] r_cnt, r_cnt_d;

logic [31:0] mem_rdata;
logic [4:0] tbl_rdata;

logic clk_posedge;
logic pre_clk;
logic tanke;
logic [31:0] Q_d;
logic FLAG_d;

enum logic [1:0] {IDLE, BL_DISC, RE} state_d, state_q;

initial begin
	$readmemh(TBL_FILE, Tbl);
	$readmemh(INI_FILE, mem);
end

assign mem_rdata = mem[BRS];
assign tbl_rdata = Tbl[BRS];
assign clk_posedge = ~pre_clk & CLK;

always_comb begin
	state_d = state_q;
	tbl_cnt_d = tbl_cnt;
	remaining_tbl_d = remaining_tbl;
	r_cnt_d = r_cnt;
	Q_d = Q;
	FLAG_d = FLAG;

	case(state_q) 

		IDLE : begin
			if (~CEN & WEN & clk_posedge) begin
				state_d = BL_DISC;
				tbl_cnt_d = tbl_rdata;
				remaining_tbl_d = EN[4:0];
			end 
		end 

		BL_DISC : begin
			if(CEN | ~WEN) begin
				state_d = IDLE;
				tbl_cnt_d = 0;
				remaining_tbl_d = 0;
				r_cnt_d = 0;
				FLAG_d = 0;
			end 
			else if (remaining_tbl != 0) begin
				remaining_tbl_d = remaining_tbl - 1'b1;
				tbl_cnt_d = tbl_cnt == 0 ? 0 : tbl_cnt - 1'b1;
			end 
			else begin
				state_d = RE;
				r_cnt_d = 6;
				if(tbl_cnt == 0) begin
					Q_d = mem_rdata;
				end 
				else begin
					Q_d = mem_rdata ^ 32'h00030010;
				end 
			end 
		end 

		RE : begin
			if(CEN | ~WEN) begin
				state_d = IDLE;
				tbl_cnt_d = 0;
				remaining_tbl_d = 0;
				r_cnt_d = 0;
				FLAG_d = 0;
			end
			else if (r_cnt != 0) begin
				r_cnt_d = r_cnt - 1'b1;
			end 
			else begin
				FLAG_d = tbl_cnt != 0;
				if(clk_posedge) begin
					state_d = BL_DISC;
					remaining_tbl_d = EN[4:0];
					if(~FLAG | ~MODE) begin
						tbl_cnt_d = tbl_rdata;
						FLAG_d = 0;
					end 
				end 
			end
		end

	endcase  			
end 



always_ff @(posedge CLK_RBL, negedge rst_n) begin
	if(~rst_n) begin
		state_q <= IDLE;
		tbl_cnt <= 0;
		remaining_tbl <= 0;
		r_cnt <= 0;
		pre_clk <= 0;
		Q <= 0;
		FLAG <= 0;
		tanke <= 0;
	end 
	else begin
		state_q <= state_d;
		tbl_cnt <= tbl_cnt_d;
		remaining_tbl <= remaining_tbl_d;
		r_cnt <= r_cnt_d;
		pre_clk <= CLK;
		tanke <= CLK;
		Q <= Q_d;
		FLAG <= FLAG_d;
	end 
end 

always @(posedge CLK) begin
	if(~WEN & ~CEN) begin
		mem[BRS] <= D;
	end 
end 

endmodule