




module pulp_soc (
	input              clk,
	input              rst_n,
    // input              pll_bypass,
    // input              boot_select,
    output             clk_real,
    output             clk_real_n,

    // input              spi_slave1_scs,
    // input              spi_slave1_sck,
    // input              spi_slave1_sdi,
    // output             spi_slave1_sdo,
             
	// input              spi_slave2_sck,
	// input              spi_slave2_scs,
	// input              spi_slave2_sdi,
	// output             spi_slave2_sdo,

	output             spi_master_sck,
	output             spi_master_scs,
	input              spi_master_sdi,
	output             spi_master_sdo,

	input              uart_rx,
	output             uart_tx,

    inout  [7:0]       gpio,

    // output             ck1,
    // output             ck2,
    output             moving,

    output [3:0]       an,
    output [7:0]       sseg        //digits display

    // output [15:0] instr_data_out_led
);

// wire clk;
wire clk_pll;
wire ext_lock;

wire [31:0] instr_addr_out;
wire [15:0] instr_data_out;
//assign instr_data_out_led = ~instr_data_out;

wire              spi_slave1_scs;
wire              spi_slave1_sck;
wire              spi_slave1_sdi;
wire              spi_slave1_sdo;
            
wire              spi_slave2_sck;
wire              spi_slave2_scs;
wire              spi_slave2_sdi;
wire              spi_slave2_sdo;

// wire              spi_master_sck;
// wire              spi_master_scs;
// wire              spi_master_sdi;
// wire              spi_master_sdo;


wire [31:0] gpio_in_w;
wire [31:0] gpio_out_w;
wire [31:0] gpio_oe_w;

wire we_w;
wire [31:0] test_data_w;

wire [31:0] soc_pll_config_w;
wire soc_pll_config_valid_w;
wire soc_pll_config_ready_w;

wire sys_clk;

wire [31:0] pc_if;

reg [31:0] instr_addr_out_prev;

assign moving = ~|(instr_addr_out ^ instr_addr_out_prev);

assign clk_real_n = ~clk_real;

assign gpio_in_w[7:0] = gpio[7:0];

assign gpio[0] = gpio_oe_w[0] ? ~gpio_out_w[0] : 1'bz;
assign gpio[1] = gpio_oe_w[1] ? ~gpio_out_w[1] : 1'bz;
assign gpio[2] = gpio_oe_w[2] ? ~gpio_out_w[2] : 1'bz;
assign gpio[3] = gpio_oe_w[3] ? ~gpio_out_w[3] : 1'bz;
assign gpio[4] = gpio_oe_w[4] ? ~gpio_out_w[4] : 1'bz;
assign gpio[5] = gpio_oe_w[5] ? ~gpio_out_w[5] : 1'bz;
assign gpio[6] = gpio_oe_w[6] ? ~gpio_out_w[6] : 1'bz;
assign gpio[7] = gpio_oe_w[7] ? ~gpio_out_w[7] : 1'bz;

/*
nominal_voltage_region nvr(
.clk                     (clk),
.rst_n                   (rst_n),
.pll_bypass_i            (pll_bypass),
.pll_o                   (pll_clk),
.sysclk_o                (sys_clk),

.soc_pll_config_i        (soc_pll_config_w),
.soc_pll_config_valid_i  (soc_pll_config_valid_w),
.soc_pll_config_ready_o  (soc_pll_config_ready_w),

.we2timingtest_o         (we_w),
.timing_test_data_i      (test_data_w),

.spi_slave1_scs_i        (spi_slave1_scs),
.spi_slave1_sck_i        (spi_slave1_sck),
.spi_slave1_sdi_i        (spi_slave1_sdi),
.spi_slave1_sdo_o        (spi_slave1_sdo)

);

timing_test timing_test_i(
    .clk     (sys_clk),
    .rst_n   (rst_n),
    .we_i    (we_w),
    .out_data(test_data_w)
);
*/

// OSC0 OSC_0(
//     .osc_dis(1'b1),
//     .osc_clk(clk_to_pll)
// );

pll0 my_pll(.refclk(clk),
    .reset(1'b0),
    .clk0_out(clk_pll),    
	.clk1_out(clk_real));

//seconds_clk_div mydiv(
//    .clk_in(clk),
//    .clk_out(clk_real));

pulpino_top pulpino_i(
 // Clock and Reset
    .clk(~clk),
    .rst_n(rst_n),

    .testmode_i(1'b0),
    .boot_select_i(1'b1), //(boot_select),

    // .soc_pll_config_o(soc_pll_config_w),
    // .soc_pll_config_valid_o(soc_pll_config_valid_w),
    // .soc_pll_config_ready_i(soc_pll_config_ready_w),

    //SPI Slave
    .spi_clk_i(spi_slave2_sck),
    .spi_cs_i(1'b1), //(spi_slave2_scs),
    .spi_mode_o(),
    .spi_sdo0_o(spi_slave2_sdo),
    .spi_sdo1_o(),
    .spi_sdo2_o(),
    .spi_sdo3_o(),
    .spi_sdi0_i(spi_slave2_sdi),
    .spi_sdi1_i(1'b0),
    .spi_sdi2_i(1'b0),
    .spi_sdi3_i(1'b0),

    //SPI Master
    .spi_master_clk_o(spi_master_sck),
    .spi_master_csn0_o(spi_master_scs),
    .spi_master_csn1_o(),
    .spi_master_csn2_o(),
    .spi_master_csn3_o(),
    .spi_master_mode_o(),
    .spi_master_sdo0_o(spi_master_sdo),
    .spi_master_sdo1_o(),
    .spi_master_sdo2_o(),
    .spi_master_sdo3_o(),
    .spi_master_sdi0_i(spi_master_sdi),
    .spi_master_sdi1_i(1'b0),
    .spi_master_sdi2_i(1'b0),
    .spi_master_sdi3_i(1'b0),

    .uart_tx(uart_tx),
    .uart_rx(uart_rx),
    .uart_rts(),
    .uart_dtr(),
    .uart_cts(1'b0),
    .uart_dsr(1'b0),

    .gpio_in(gpio_in_w),
    .gpio_out(gpio_out_w),
    .gpio_dir(gpio_oe_w),
    .gpio_padcfg(),

    // .ck1(ck1),
    // .ck2(ck2),

    .pc_if(pc_if),
    .instr_addr_out ( instr_addr_out ),
    .instr_data_out ( instr_data_out )
);

always @(posedge clk_real) begin
    instr_addr_out_prev <= instr_addr_out;
end

scan_led_hex_disp mydisp(
    .clk(clk_pll),
    .reset(1'b0),
    .hex0(instr_addr_out[3:0]),
    .hex1(instr_addr_out[7:4]),
    .hex2(instr_addr_out[11:8]),
    .hex3(instr_addr_out[15:12]),
    // .hex0(clk_real ? instr_addr_out[3:0] : instr_addr_out[19:16]),
    // .hex1(clk_real ? instr_addr_out[7:4] : instr_addr_out[23:20]),
    // .hex2(clk_real ? instr_addr_out[11:8] : instr_addr_out[27:24]),
    // .hex3(clk_real ? instr_addr_out[15:12] : instr_addr_out[31:28]),
    .an(an),
    .sseg(sseg)
);

endmodule 