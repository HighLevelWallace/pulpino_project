// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

////////////////////////////////////////////////////////////////////////////////
// Engineer:       Antonio Pullini - pullinia@iis.ee.ethz.ch                  //
//                                                                            //
// Additional contributions by:                                               //
//                 Sven Stucki - svstucki@student.ethz.ch                     //
//                 Markus Wegmann - markus.wegmann@technokrat.ch              //
//                                                                            //
// Design Name:    RISC-V register file                                       //
// Project Name:   zero-riscy                                                 //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Register file with 31 or 15x 32 bit wide registers.        //
//                 Register 0 is fixed to 0. This register file is based on   //
//                 latches and is thus smaller than the flip-flop based RF.   //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

`include "include/zeroriscy_config.sv"

module zeroriscy_register_file
#(
  parameter RV32E         = 0,
  parameter DATA_WIDTH    = 32
)
(
  // Clock and Reset
  input  logic                   clk,
  input  logic                   rst_n,

  input  logic                   test_en_i,

  //Read port R1
  input  logic [4:0]             raddr_a_i,
  output logic [DATA_WIDTH-1:0]  rdata_a_o,

  //Read port R2
  input  logic [4:0]             raddr_b_i,
  output logic [DATA_WIDTH-1:0]  rdata_b_o,


  // Write port W1
  input  logic [4:0]              waddr_a_i,
  input  logic [DATA_WIDTH-1:0]   wdata_a_i,
  input  logic                    we_a_i

);


  localparam    ADDR_WIDTH = RV32E ? 4 : 5;
  localparam    NUM_WORDS  = 2**ADDR_WIDTH;

  logic [DATA_WIDTH-1:0]      mem[NUM_WORDS];

  logic [NUM_WORDS-1:1]       waddr_onehot_a;

  logic [NUM_WORDS-1:1]       mem_clocks;
  logic [DATA_WIDTH-1:0]      wdata_a_q;


  // Write port W1
  logic [ADDR_WIDTH-1:0]     raddr_a_int, raddr_b_int, waddr_a_int;

  assign raddr_a_int = raddr_a_i[ADDR_WIDTH-1:0];
  assign raddr_b_int = raddr_b_i[ADDR_WIDTH-1:0];
  assign waddr_a_int = waddr_a_i[ADDR_WIDTH-1:0];


  logic clk_int;

  int unsigned i;
  int unsigned j;
  int unsigned k;

  genvar x;

  //-----------------------------------------------------------------------------
  //-- READ : Read address decoder RAD
  //-----------------------------------------------------------------------------
  assign rdata_a_o = mem[raddr_a_int];
  assign rdata_b_o = mem[raddr_b_int];

  //-----------------------------------------------------------------------------
  // WRITE : SAMPLE INPUT DATA
  //---------------------------------------------------------------------------

  cluster_clock_gating CG_WE_GLOBAL
  (
    .clk_i     ( clk             ),
    .en_i      ( we_a_i          ),
    .test_en_i ( test_en_i       ),
    .clk_o     ( clk_int         )
  );

  // use clk_int here, since otherwise we don't want to write anything anyway
  always_ff @(posedge clk_int, negedge rst_n)
  begin : sample_waddr
    if (~rst_n) begin
      wdata_a_q        <= '0;
    end else begin
      if(we_a_i)
        wdata_a_q <= wdata_a_i;
    end
  end

  //-----------------------------------------------------------------------------
  //-- WRITE : Write Address Decoder (WAD), combinatorial process
  //-----------------------------------------------------------------------------
  always_comb
  begin : p_WADa
    for(i = 1; i < NUM_WORDS; i++)
    begin : p_WordItera
      if ( (we_a_i == 1'b1 ) && (waddr_a_int == i) )
        waddr_onehot_a[i] = 1'b1;
      else
        waddr_onehot_a[i] = 1'b0;
    end
  end


  //-----------------------------------------------------------------------------
  //-- WRITE : Clock gating (if integrated clock-gating cells are available)
  //-----------------------------------------------------------------------------
  generate
    for(x = 1; x < NUM_WORDS; x++)
    begin : CG_CELL_WORD_ITER
      cluster_clock_gating CG_Inst
      (
        .clk_i     ( clk_int                               ),
        .en_i      ( waddr_onehot_a[x]                     ),
        .test_en_i ( test_en_i                             ),
        .clk_o     ( mem_clocks[x]                         )
      );
    end
  endgenerate

  //-----------------------------------------------------------------------------
  //-- WRITE : Write operation
  //-----------------------------------------------------------------------------
  //-- Generate M = WORDS sequential processes, each of which describes one
  //-- word of the memory. The processes are synchronized with the clocks
  //-- ClocksxC(i), i = 0, 1, ..., M-1
  //-- Use active low, i.e. transparent on low latches as storage elements
  //-- Data is sampled on rising clock edge

  always_latch
  begin : latch_wdata
    // Note: The assignment has to be done inside this process or Modelsim complains about it
    mem[0] = '0;

    for(k = 1; k < NUM_WORDS; k++)
    begin : w_WordIter
      if(mem_clocks[k] == 1'b1)
        mem[k] = wdata_a_q;
    end
  end


endmodule
