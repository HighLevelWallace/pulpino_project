// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the â€œLicenseâ€?); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an â€œAS ISâ€? BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
`define FPGA

module clk_rst_gen
(
    input  logic                            clk_i,
    input  logic                            rstn_i,

    input  logic                            clk_sel_i,

    input  logic                            testmode_i,

    input  logic                            soft_reset_en_i,

    input  logic  [5:0]                     pll_ref_div_i,
    input  logic  [11:0]                    pll_feedback_div_i,
    input  logic  [2:0]                     pll_post_div1_i,
    input  logic  [2:0]                     pll_post_div2_i,
    output logic                            pll_lock_o,

    output logic                            clk_o,
    output logic                            clk_en_o,
    output logic                            rstn_o
);

  logic clk_pll_int;
  logic clk_int;

  cluster_clock_mux2
  clk_mux_i
  (
      .clk_sel_i ( clk_sel_i     ),
      .clk0_i    ( clk_i         ),
      .clk1_i    ( clk_pll_int   ),
      .clk_o     ( clk_int       )
  );

  //----------------------------------------------------------------------------//
  // FLL
  //----------------------------------------------------------------------------//

`ifdef ASIC
/**************************************************************/

//      PLL macro

/*************************************************************/
/*TSMC28_PLL pll_i(
  .BYPASS       (1'b0),
  .DSMPD        (1'b0),
  .FBDIV        (pll_feedback_div_i),
  .FOUTPOSTDIVPD(1'b0),
  .FOUTVCOPD    (1'b0),
  .FREF         (clk_i),
  .PD           (~rstn_i),
  .POSTDIV1     (pll_post_div1_i),
  .POSTDIV2     (pll_post_div2_i),
  .REFDIV       (pll_ref_div_i),
  .CLKSSCG      (),
  .FOUTPOSTDIV  (clk_pll_int),
  .FOUTVCO      (),
  .LOCK         (pll_lock_o)  
);*/
assign pll_lock_o = 1;
`else
`ifdef FPGA

/**********************************************/

//     xilinx clock management module ip

/*********************************************/

/*clk_wiz_0 clk_management(
  .clk_in1 (clk_i),
  .reset   (~rstn_i),
  .clk_out1(clk_pll_int),
  .locked  (pll_lock_o)
);*/
assign pll_lock_o = 1;
`else
/******************************************************/

//       RTL model of PLL

/******************************************************/
/*TSMC28_PLL pll_i(
  .BYPASS       (1'b0),
  .DSMPD        (1'b0),
  .FBDIV        (pll_feedback_div_i),
  .FOUTPOSTDIVPD(1'b0),
  .FOUTVCOPD    (1'b0),
  .FREF         (clk_i),
  .PD           (~rstn_i),
  .POSTDIV1     (pll_post_div1_i),
  .POSTDIV2     (pll_post_div2_i),
  .REFDIV       (pll_ref_div_i),
  .CLKSSCG      (),
  .FOUTPOSTDIV  (clk_pll_int),
  .FOUTVCO      (),
  .LOCK         (pll_lock_o)  
);*/
assign pll_lock_o = 1;
`endif
`endif

  //----------------------------------------------------------------------------//
  // Reset synchronizer
  //----------------------------------------------------------------------------//
  rstgen i_rst_gen_soc
  (
      // PAD FRAME SIGNALS
      .clk_i               ( clk_int         ),
      .rst_ni              ( rstn_i          ),

      // TEST MODE
      .test_mode_i         ( testmode_i      ),

      .soft_reset_en       ( soft_reset_en_i   ),

      // OUTPUT RESET
      .rst_no              ( rstn_o          ),
      .init_no             (                 )
  );


  assign clk_o = clk_int;
  assign clk_en_o = ~clk_sel_i | (clk_sel_i & pll_lock_o);
endmodule
