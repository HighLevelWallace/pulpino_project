// Verilog testbench created by TD v5.0.24498
// 2021-03-18 11:31:31

`timescale 1ns / 1ps

module pulpino_top_tb();

reg boot_select_i;
reg clk;
reg rst_n;
reg soc_pll_config_ready_i;
reg spi_clk_i;
reg spi_cs_i;
reg spi_master_sdi0_i;
reg spi_master_sdi1_i;
reg spi_master_sdi2_i;
reg spi_master_sdi3_i;
reg spi_sdi0_i;
reg spi_sdi1_i;
reg spi_sdi2_i;
reg spi_sdi3_i;
reg testmode_i;
wire [31:0] soc_pll_config_o;
wire soc_pll_config_valid_o;
wire spi_master_clk_o;
wire spi_master_csn0_o;
wire spi_master_csn1_o;
wire spi_master_csn2_o;
wire spi_master_csn3_o;
wire [1:0] spi_master_mode_o;
wire spi_master_sdo0_o;
wire spi_master_sdo1_o;
wire spi_master_sdo2_o;
wire spi_master_sdo3_o;
wire [1:0] spi_mode_o;
wire spi_sdo0_o;
wire spi_sdo1_o;
wire spi_sdo2_o;
wire spi_sdo3_o;

//Clock process
parameter PERIOD = 10;
always #(PERIOD/2) clk = ~clk;

//glbl Instantiate
glbl glbl();

//Unit Instantiate
pulpino_top uut(
	.boot_select_i(boot_select_i),
	.clk(clk),
	.rst_n(rst_n),
	.soc_pll_config_ready_i(soc_pll_config_ready_i),
	.spi_clk_i(spi_clk_i),
	.spi_cs_i(spi_cs_i),
	.spi_master_sdi0_i(spi_master_sdi0_i),
	.spi_master_sdi1_i(spi_master_sdi1_i),
	.spi_master_sdi2_i(spi_master_sdi2_i),
	.spi_master_sdi3_i(spi_master_sdi3_i),
	.spi_sdi0_i(spi_sdi0_i),
	.spi_sdi1_i(spi_sdi1_i),
	.spi_sdi2_i(spi_sdi2_i),
	.spi_sdi3_i(spi_sdi3_i),
	.testmode_i(testmode_i),
	.soc_pll_config_o(soc_pll_config_o),
	.soc_pll_config_valid_o(soc_pll_config_valid_o),
	.spi_master_clk_o(spi_master_clk_o),
	.spi_master_csn0_o(spi_master_csn0_o),
	.spi_master_csn1_o(spi_master_csn1_o),
	.spi_master_csn2_o(spi_master_csn2_o),
	.spi_master_csn3_o(spi_master_csn3_o),
	.spi_master_mode_o(spi_master_mode_o),
	.spi_master_sdo0_o(spi_master_sdo0_o),
	.spi_master_sdo1_o(spi_master_sdo1_o),
	.spi_master_sdo2_o(spi_master_sdo2_o),
	.spi_master_sdo3_o(spi_master_sdo3_o),
	.spi_mode_o(spi_mode_o),
	.spi_sdo0_o(spi_sdo0_o),
	.spi_sdo1_o(spi_sdo1_o),
	.spi_sdo2_o(spi_sdo2_o),
	.spi_sdo3_o(spi_sdo3_o));

//Stimulus process
initial begin
//To be inserted
end

endmodule