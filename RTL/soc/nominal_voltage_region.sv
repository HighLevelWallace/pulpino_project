 

 module nominal_voltage_region(
 	input  logic        clk,
 	input  logic        rst_n,
 	input  logic        pll_bypass_i,
 	output logic        pll_o,

 	output logic        sysclk_o,

 	input  logic [31:0] soc_pll_config_i,
 	input  logic        soc_pll_config_valid_i,
 	output logic        soc_pll_config_ready_o,

 	output logic        we2timingtest_o,
 	input  logic [31:0] timing_test_data_i,
       
 	input  logic        spi_slave1_scs_i,
 	input  logic        spi_slave1_sck_i,
 	input  logic        spi_slave1_sdi_i,
 	output logic        spi_slave1_sdo_o



 );

wire        sysclk;
wire        clk_after_gate;
wire        FOUTPOSTDIV;
wire        gate;
wire [31:0] pll_config;
wire [11:0] FBDIV;
wire  [2:0] POSTDIV1;
wire  [2:0] POSTDIV2;
wire  [5:0] REFDIV;
wire        BYPASS;
wire        FOUTPOSTDIVPD;
wire        FOUTVCOPD;
wire        PD;
wire        LOCK;

wire  [1:0] spi_op_addr;
wire [31:0] spi_op_wdata;
wire        spi_op_we;
logic [31:0] spi_op_rdata;

wire [31:0] spi_pll_wdata;
wire        spi_pll_valid;

wire [31:0] pll_ctrl_wdata;
wire        pll_ctrl_valid;
wire        pll_ctrl_ready;

assign pll_o = FOUTPOSTDIV;
assign FBDIV = pll_config[27:16];
assign POSTDIV1 = pll_config[2:0];
assign POSTDIV2 = pll_config[6:4];
assign REFDIV = pll_config[13:8];
assign BYPASS = pll_config[31];
assign PD = pll_config[30] & rst_n;
assign FOUTVCOPD = pll_config[29];
assign FOUTPOSTDIVPD = pll_config[28];

assign we2timingtest_o = spi_op_addr == 2'b01 ? 
						spi_op_we : 1'b0;

assign spi_pll_wdata = spi_op_addr == 2'b00 ? 
                       spi_op_wdata : 32'h0;
assign spi_pll_valid = spi_op_addr == 2'b00 ? 
                       spi_op_we : 0;

always_comb begin
	spi_op_rdata = 32'h0;
	case (spi_op_addr) 
		2'b00 : spi_op_rdata = pll_config;
		2'b01 : spi_op_rdata = timing_test_data_i;

		default : spi_op_rdata = 32'h0;
	endcase 
end 

spi_interface spi_if(
	.scs_i  (spi_slave1_scs_i),
	.sck_i  (spi_slave1_sck_i),
	.sdi_i  (spi_slave1_sdi_i),
	.sdo_o  (spi_slave1_sdo_o),

	.addr_o (spi_op_addr),
	.rdata_i(spi_op_rdata),
	.wdata_o(spi_op_wdata),
	.we_o   (spi_op_we)
);

pll_config_arbiter arbiter(
	.clk         (clk),
	.rst_n       (rst_n),

	.ch1_wdata_i (spi_pll_wdata),
	.ch1_valid_i (spi_pll_valid),
	.ch1_ready_o (),

	.ch2_wdata_i (soc_pll_config_i),
	.ch2_valid_i (soc_pll_config_valid_i),
	.ch2_ready_o (soc_pll_config_ready_o),

	.wdata_o     (pll_ctrl_wdata),
	.valid_o     (pll_ctrl_valid),
	.ready_i     (pll_ctrl_ready)
);


pll_controller pll_ctrl(

	.clk           (clk),
	.rst_n         (rst_n),

	.sysclk_i      (sysclk),
	.pll_lock_i    (LOCK),

	.wdata_i       (pll_ctrl_wdata),
	.wdata_valid_i (pll_ctrl_valid),
	.w_ready_o     (pll_ctrl_ready),

	.pll_config_o  (pll_config),
	.clk_gate_o    (gate)
);

 TSMC28_PLL pll(
	.BYPASS        (BYPASS), 
	.DSMPD         (1'b0), 
	.FBDIV         (FBDIV),
	.FOUTPOSTDIVPD (FOUTPOSTDIVPD), 
	.FOUTVCOPD     (FOUTVCOPD), 
	.FREF          (clk), 
	.PD            (PD),
	.POSTDIV1      (POSTDIV1), 
	.POSTDIV2      (POSTDIV2), 
	.REFDIV        (REFDIV), 
	.CLKSSCG       (),
	.FOUTPOSTDIV   (FOUTPOSTDIV), 
	.FOUTVCO       (), 
	.LOCK          (LOCK)
 );


cluster_clock_gating clk_gate(
	.clk_i      (FOUTPOSTDIV),
	.en_i       (LOCK & (~gate)),
	.test_en_i  (1'b0),
	.clk_o      (clk_after_gate)
);

cluster_clock_mux2 clk_mux(
	.clk0_i    (clk_after_gate),
	.clk1_i    (clk),
	.clk_sel_i (pll_bypass_i),
	.clk_o     (sysclk)
);

assign sysclk_o = sysclk;
 endmodule