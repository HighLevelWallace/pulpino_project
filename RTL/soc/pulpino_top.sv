// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License��?); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS��? BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

`include "includes/axi_bus.sv"
`include "includes/debug_bus.sv"

`define AXI_ADDR_WIDTH         32
`define AXI_DATA_WIDTH         32
`define AXI_ID_MASTER_WIDTH     2
`define AXI_ID_SLAVE_WIDTH      4
`define AXI_USER_WIDTH          1

module pulpino_top
  #(
    parameter USE_ZERO_RISCY       = 1,
    parameter RISCY_RV32F          = 0,
    parameter ZERO_RV32M           = 1,
    parameter ZERO_RV32E           = 0
  )
  (
    // Clock and Reset
    input  logic               clk,
    input  logic               rst_n,



    input  logic              testmode_i,
    input  logic              boot_select_i,

    output logic [31:0]       soc_pll_config_o,
    output logic              soc_pll_config_valid_o,
    input  logic              soc_pll_config_ready_i,

    //SPI Slave
    input  logic              spi_clk_i /*verilator clocker*/,
    input  logic              spi_cs_i /*verilator clocker*/,
    output logic [1:0]        spi_mode_o,
    output logic              spi_sdo0_o,
    output logic              spi_sdo1_o,
    output logic              spi_sdo2_o,
    output logic              spi_sdo3_o,
    input  logic              spi_sdi0_i,
    input  logic              spi_sdi1_i,
    input  logic              spi_sdi2_i,
    input  logic              spi_sdi3_i,

    //SPI Master
    output logic              spi_master_clk_o,
    output logic              spi_master_csn0_o,
    output logic              spi_master_csn1_o,
    output logic              spi_master_csn2_o,
    output logic              spi_master_csn3_o,
    output logic [1:0]        spi_master_mode_o,
    output logic              spi_master_sdo0_o,
    output logic              spi_master_sdo1_o,
    output logic              spi_master_sdo2_o,
    output logic              spi_master_sdo3_o,
    input  logic              spi_master_sdi0_i,
    input  logic              spi_master_sdi1_i,
    input  logic              spi_master_sdi2_i,
    input  logic              spi_master_sdi3_i,

    input  logic              scl_pad_i,
    output logic              scl_pad_o,
    output logic              scl_padoen_o,
    input  logic              sda_pad_i,
    output logic              sda_pad_o,
    output logic              sda_padoen_o,

    output logic              uart_tx,
    input  logic              uart_rx,
    output logic              uart_rts,
    output logic              uart_dtr,
    input  logic              uart_cts,
    input  logic              uart_dsr,

    input  logic       [31:0] gpio_in,
    output logic       [31:0] gpio_out,
    output logic       [31:0] gpio_dir,
    output logic [31:0] [5:0] gpio_padcfg,

    output logic              ck1,
    output logic              ck2,

    //JTAG signals
    input  logic              tck_i,
    input  logic              trstn_i,
    input  logic              tms_i,
    input  logic              tdi_i,
    output logic              tdo_o,

    //PULPino specific pad config
    output logic [31:0] [5:0] pad_cfg_o,
    output logic       [31:0] pad_mux_o,

    output logic [31:0] pc_if,

    output logic [31:0] instr_addr_out,
    output logic [15:0] instr_data_out
  );

  logic        fetch_enable_int;
  logic        fetch_enable_w;
  logic        core_busy_int;
  logic        clk_gate_core_int;
  logic [31:0] irq_to_core_int;
  logic        ram_stat_done;

  logic [31:0] boot_addr_int;

  wire c_rstn_w;
  wire p_rstn_w;
  wire soft_reset_w;
  wire cpu_start_w;

  assign fetch_enable_w = boot_select_i ? 1'b1 : cpu_start_w;
  AXI_BUS
  #(
    .AXI_ADDR_WIDTH ( `AXI_ADDR_WIDTH     ),
    .AXI_DATA_WIDTH ( `AXI_DATA_WIDTH     ),
    .AXI_ID_WIDTH   ( `AXI_ID_SLAVE_WIDTH ),
    .AXI_USER_WIDTH ( `AXI_USER_WIDTH     )
  )
  slaves[2:0]();

  AXI_BUS
  #(
    .AXI_ADDR_WIDTH ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH ( `AXI_DATA_WIDTH      ),
    .AXI_ID_WIDTH   ( `AXI_ID_MASTER_WIDTH ),
    .AXI_USER_WIDTH ( `AXI_USER_WIDTH      )
  )
  masters[2:0]();

  DEBUG_BUS
  debug();


rstgen rst_gen_i(
  .clk_i(clk),
  .rst_ni(rst_n),
  .soft_reset_en(soft_reset_w),
 
  .c_rstn_o(c_rstn_w),
  .p_rstn_o(p_rstn_w)
);

  //----------------------------------------------------------------------------//
  // Core region
  //----------------------------------------------------------------------------//
  core_region
  #(
    .AXI_ADDR_WIDTH       ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH       ( `AXI_DATA_WIDTH      ),
    .AXI_ID_MASTER_WIDTH  ( `AXI_ID_MASTER_WIDTH ),
    .AXI_ID_SLAVE_WIDTH   ( `AXI_ID_SLAVE_WIDTH  ),
    .AXI_USER_WIDTH       ( `AXI_USER_WIDTH      ),
    .USE_ZERO_RISCY       (  USE_ZERO_RISCY      ),
    .RISCY_RV32F          (  RISCY_RV32F         ),
    .ZERO_RV32M           (  ZERO_RV32M          ),
    .ZERO_RV32E           (  ZERO_RV32E          )
  )
  core_region_i
  (
    .clk            ( clk           ),
    .rst_n          ( c_rstn_w        ),

    .testmode_i     ( testmode_i        ),
    .fetch_enable_i ( fetch_enable_int  ),
    .irq_i          ( irq_to_core_int   ),
    .core_busy_o    ( core_busy_int     ),
    .clock_gating_i ( clk_gate_core_int ),
    .boot_addr_i    ( boot_addr_int     ),

    .core_master    ( masters[0]        ),
    .dbg_master     ( masters[1]        ),
    .data_slave     ( slaves[1]         ),
    .instr_slave    ( slaves[0]         ),
    .debug          ( debug             ),
    .ram_stat_done_o( ram_stat_done     ),

   // .tck_i          ( tck_i             ),
   // .trstn_i        ( trstn_i           ),
   // .tms_i          ( tms_i             ),
   // .tdi_i          ( tdi_i             ),
   // .tdo_o          ( tdo_o             ),

    .ck1            (ck1),
    .ck2            (ck2),

    .pc_if          ( pc_if ),
    .instr_addr_out ( instr_addr_out ),
    .instr_data_out ( instr_data_out )
  );

  //----------------------------------------------------------------------------//
  // Peripherals
  //----------------------------------------------------------------------------//
  peripherals
  #(
    .AXI_ADDR_WIDTH      ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH      ( `AXI_DATA_WIDTH      ),
    .AXI_SLAVE_ID_WIDTH  ( `AXI_ID_SLAVE_WIDTH  ),
    .AXI_MASTER_ID_WIDTH ( `AXI_ID_MASTER_WIDTH ),
    .AXI_USER_WIDTH      ( `AXI_USER_WIDTH      )
    // .ROM_START_ADDR      (32'h00000000)
  )
  peripherals_i
  (
    .clk_i           (     clk           ),
    .rst_n           ( p_rstn_w   ),

    .axi_spi_master  ( masters[2]        ),
    .debug           ( debug             ),

    .spi_clk_i       ( spi_clk_i         ),
    .testmode_i      ( testmode_i        ),
    .spi_cs_i        ( spi_cs_i          ),
    .spi_mode_o      ( spi_mode_o        ),
    .spi_sdo0_o      ( spi_sdo0_o        ),
    .spi_sdo1_o      ( spi_sdo1_o        ),
    .spi_sdo2_o      ( spi_sdo2_o        ),
    .spi_sdo3_o      ( spi_sdo3_o        ),
    .spi_sdi0_i      ( spi_sdi0_i        ),
    .spi_sdi1_i      ( spi_sdi1_i        ),
    .spi_sdi2_i      ( spi_sdi2_i        ),
    .spi_sdi3_i      ( spi_sdi3_i        ),

    .slave           ( slaves[2]         ),

    .uart_tx         ( uart_tx           ),
    .uart_rx         ( uart_rx           ),
    .uart_rts        ( uart_rts          ),
    .uart_dtr        ( uart_dtr          ),
    .uart_cts        ( uart_cts          ),
    .uart_dsr        ( uart_dsr          ),

    .spi_master_clk  ( spi_master_clk_o  ),
    .spi_master_csn0 ( spi_master_csn0_o ),
    .spi_master_csn1 ( spi_master_csn1_o ),
    .spi_master_csn2 ( spi_master_csn2_o ),
    .spi_master_csn3 ( spi_master_csn3_o ),
    .spi_master_mode ( spi_master_mode_o ),
    .spi_master_sdo0 ( spi_master_sdo0_o ),
    .spi_master_sdo1 ( spi_master_sdo1_o ),
    .spi_master_sdo2 ( spi_master_sdo2_o ),
    .spi_master_sdo3 ( spi_master_sdo3_o ),
    .spi_master_sdi0 ( spi_master_sdi0_i ),
    .spi_master_sdi1 ( spi_master_sdi1_i ),
    .spi_master_sdi2 ( spi_master_sdi2_i ),
    .spi_master_sdi3 ( spi_master_sdi3_i ),

  //  .scl_pad_i       ( scl_pad_i         ),
 //   .scl_pad_o       ( scl_pad_o         ),
  //  .scl_padoen_o    ( scl_padoen_o      ),
  //  .sda_pad_i       ( sda_pad_i         ),
  //  .sda_pad_o       ( sda_pad_o         ),
  //  .sda_padoen_o    ( sda_padoen_o      ),

    .gpio_in         ( gpio_in           ),
    .gpio_out        ( gpio_out          ),
    .gpio_dir        ( gpio_dir          ),
    .gpio_padcfg     ( gpio_padcfg       ),

    .core_busy_i     ( core_busy_int     ),
    .irq_o           ( irq_to_core_int   ),
    .fetch_enable_i  ( fetch_enable_w    ),
    .fetch_enable_o  ( fetch_enable_int  ),
    .clk_gate_core_o ( clk_gate_core_int ),
    .soft_reset_o    ( soft_reset_w      ),
    .cpu_start_o     ( cpu_start_w       ),

    .pll_config_o      (soc_pll_config_o      ), 
    .pll_config_valid_o(soc_pll_config_valid_o),
    .pll_config_ready_i(soc_pll_config_ready_i),
    .pad_cfg_o          ( pad_cfg_o         ),
    .pad_mux_o          ( pad_mux_o         ),
    .boot_addr_o        ( boot_addr_int     ),
    .ram_stat_done_i    ( ram_stat_done     )
  );


  //----------------------------------------------------------------------------//
  // Axi node
  //----------------------------------------------------------------------------//

  axi_node_intf_wrap
  #(
    .NB_MASTER      ( 3                    ),
    .NB_SLAVE       ( 3                    ),
    .AXI_ADDR_WIDTH ( `AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH ( `AXI_DATA_WIDTH      ),
    .AXI_ID_WIDTH   ( `AXI_ID_MASTER_WIDTH ),
    .AXI_USER_WIDTH ( `AXI_USER_WIDTH      )
  )
  axi_interconnect_i
  (
    .clk       (     clk        ),
    .rst_n     ( p_rstn_w),
    .test_en_i ( testmode_i ),

    .master    ( slaves     ),
    .slave     ( masters    ),

    .start_addr_i ( { 32'h1A10_0000, 32'h0010_0000, 32'h0000_0000 } ),
    .end_addr_i   ( { 32'h1A11_FFFF, 32'h001F_FFFF, 32'h000F_FFFF } )
  );

endmodule

