// Verilog testbench created by TD v5.0.24498
// 2021-03-27 10:59:58

`timescale 1ns / 1ps

module pulp_soc_tb();

// reg boot_select;
// reg clk;
// reg clk2;
// reg pll_bypass;
// reg rst_n;

// wire programmer_spi_sck;
// wire programmer_spi_scs;
// wire programmer_spi_m2s;
// wire programmer_spi_s2m;

// reg uart_rx;
// wire [3:0] an;
// // wire ck1;
// // wire ck2;
// wire moving;
// wire [7:0] pc_digits;

// wire [7:0] sseg;
// wire uart_tx;
// wire [7:0] gpio;

// wire wp;
// wire hold;
// reg start;

// //Clock process
// parameter PERIOD = 10;
// always #(PERIOD/2) clk = ~clk;
// always #1000 clk2 = ~clk2;

//glbl Instantiate
glbl glbl();

// //Unit Instantiate
// pulp_soc uut(
// 	.boot_select(boot_select),
// 	.clk(clk),
// 	.pll_bypass(pll_bypass),
// 	.rst_n(rst_n),

// 	.spi_slave2_sck (programmer_spi_sck),
//     .spi_slave2_scs (programmer_spi_scs),
//     .spi_slave2_sdi (programmer_spi_m2s),
//     .spi_slave2_sdo (programmer_spi_s2m),

// 	.uart_rx(uart_rx),
// 	.an(an),

// 	.moving(moving),
// 	.pc_digits(pc_digits),
	
// 	.sseg(sseg),
// 	.uart_tx(uart_tx),
// 	.gpio(gpio));

// //spi master device
// virtual_spi_programmer programmer_i (
//     .clk(clk2),
//     .rst_n(rst_n),

//     .sclk(programmer_spi_sck),
//     .sdo(programmer_spi_m2s),
//     .sdi(programmer_spi_s2m),
//     .scs(programmer_spi_scs),
//     .load(start)
//     );

	
// `define SPI_PROG
// integer i;
// initial begin
// 	clk = 1;
//     clk2 = 1;
// 	rst_n = 0;
//     pll_bypass = 1;
// 	boot_select = 0;

// 	start = 0;
// 	#300000;
// 	rst_n = 1;

// 	start = 1;
//     #10000;
//     start = 0;

// end
// endmodule

reg clk;
reg clk2;
reg rst_n;
reg pll_bypass;
reg boot_select;


//flash inteface signal between flash chip and CPU
wire flash_spi_sck;
wire flash_spi_cs;
wire flash_spi_m2s;
wire flash_spi_s2m;

// programmer spi interface
wire programmer_spi_sck;
wire programmer_spi_scs;
wire programmer_spi_m2s;
wire programmer_spi_s2m;

//test module spi interface
reg  test_module_spi_sck;
reg  test_module_spi_scs;
reg  test_module_spi_m2s;
wire test_module_spi_s2m;
wire [31:0] spi_data;
wire spi_data_valid;

wire wp;
wire hold;
reg start;

wire [7:0] gpio;
wire ck1;
wire ck2;
wire uart_tx;

integer cmd, data;

assign wp = 1;
assign hold = 1;
//spi slave device
s25fl256s flash(
    .SI      (flash_spi_m2s),
    .SO      (flash_spi_s2m),

    .SCK     (flash_spi_sck),
    .CSNeg   (flash_spi_cs),
    .RSTNeg  (rst_n),
    .WPNeg   (wp),
    .HOLDNeg (hold)
);

pulp_soc soc
(
    .clk            (clk),
    .rst_n          (rst_n),
    .pll_bypass     (pll_bypass),
    .boot_select    (boot_select),

    .spi_slave1_scs (test_module_spi_scs),
    .spi_slave1_sck (test_module_spi_sck),
    .spi_slave1_sdi (test_module_spi_m2s),
    .spi_slave1_sdo (test_module_spi_s2m),

    .spi_slave2_sck (programmer_spi_sck),
    .spi_slave2_scs (programmer_spi_scs),
    .spi_slave2_sdi (programmer_spi_m2s),
    .spi_slave2_sdo (programmer_spi_s2m),

    .spi_master_sck (flash_spi_sck),
    .spi_master_scs (flash_spi_cs),
    .spi_master_sdi (flash_spi_s2m),
    .spi_master_sdo (flash_spi_m2s),

    .uart_rx        (1'b0),
    .uart_tx        (uart_tx),

    .gpio           (gpio),

    .ck1            (ck1),
    .ck2            (ck2)
  );
//spi master device
virtual_spi_programmer programmer_i (
    .clk(clk2),
    .rst_n(rst_n),

    .sclk(programmer_spi_sck),
    .sdo(programmer_spi_m2s),
    .sdi(programmer_spi_s2m),
    .scs(programmer_spi_scs),
    .load(start)
    );
`define SPI_PROG
integer i;
initial begin
`ifdef SPI_CONFIG_TEST
    cmd  = 32'h0000_0001;
    data = 32'h0_010_02_6_7;
`else 

`ifdef TIMING_TEST
    cmd  = 32'h0000_0003;
    data = 32'h0000_0000;
`else 
    cmd  = 32'h0000_0000;
    data = 32'h0000_0000;
`endif

`endif  

	clk = 1;
    clk2 = 1;
	rst_n = 0;
    pll_bypass = 1;

`ifdef SPI_PROG 
    boot_select = 0;
`else 
    boot_select = 1;
`endif 

    test_module_spi_sck = 0;
    test_module_spi_scs = 1;
    test_module_spi_m2s = 0;

    start = 0;
	#300000;
	rst_n = 1;

`ifdef SPI_CONFIG_TEST
    #10000;
    test_module_spi_scs = 0;
    for (i=0;i<32;i=i+1) begin
        test_module_spi_m2s = cmd[31-i];
        #1000;
        test_module_spi_sck = 1;
        #1000;
        test_module_spi_sck = 0;
    end 
    for (i=0;i<32;i=i+1) begin
        test_module_spi_m2s = data[31-i];
        #1000;
        test_module_spi_sck = 1;
        #1000;
        test_module_spi_sck = 0;
    end 
    #1000;
    test_module_spi_scs = 1;
`endif

`ifdef TIMING_TEST
    #10000;
    test_module_spi_scs = 0;
    for (i=0;i<32;i=i+1) begin
        test_module_spi_m2s = cmd[31-i];
        #1000;
        test_module_spi_sck = 1;
        #1000;
        test_module_spi_sck = 0;
    end 
    for (i=0;i<32;i=i+1) begin
        test_module_spi_m2s = data[31-i];
        #1000;
        test_module_spi_sck = 1;
        #1000;
        test_module_spi_sck = 0;
    end 
    #1000;
    test_module_spi_scs = 1;
    #100000;
    cmd = 32'h0000_0002;
    test_module_spi_scs = 0;
    for (i=0;i<32;i=i+1) begin
        test_module_spi_m2s = cmd[31-i];
        #1000;
        test_module_spi_sck = 1;
        #1000;
        test_module_spi_sck = 0;
    end 
    for (i=0;i<32;i=i+1) begin
        test_module_spi_m2s = data[31-i];
        #1000;
        test_module_spi_sck = 1;
        #1000;
        test_module_spi_sck = 0;
    end 
    #1000;
    test_module_spi_scs = 1;

`endif

`ifdef SPI_PROG
    start = 1;
    #10000;
    start = 0;
`endif 

end

spi_reciver recive_indictor(
    .scs_i       (test_module_spi_scs),
    .sck_i       (test_module_spi_sck),
    .sdi_i       (test_module_spi_s2m),
    .data_o      (spi_data),
    .data_valid_o(spi_data_valid)
);

always begin
	#5;
	clk = ~clk;
end

always begin
    #20;
    clk2 = ~clk2;
end 

endmodule