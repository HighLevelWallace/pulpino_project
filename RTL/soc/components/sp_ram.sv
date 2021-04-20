// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License��?); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS��? BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
`timescale 1ns/1ps

module sp_ram
  #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32,
    parameter NUM_WORDS  = 256,
    parameter ERAM_CHIP_NO = 0,
    parameter INIT = 1
  )(
    // Clock and Reset
    input  logic                    clk,
    input  logic                    clk_g,
    input  logic                    rst_n,
    input  logic                    clk_rbl,
    input  logic                    sleep,

    input  logic                    mode,
    input  logic                    boost_en,
    input  logic [11:0]             wl_config,

    
    input  logic                    en_i,
    input  logic [ADDR_WIDTH-1:0]   addr_i,
    input  logic [DATA_WIDTH-1:0]   wdata_i,
    output logic [DATA_WIDTH-1:0]   rdata_o,
    input  logic [DATA_WIDTH/8-1:0] we_i,

    output logic                    error_flag
  );

//`ifdef SYNTHESIS
/************************************************************/

//                  true ssram macro

/************************************************************/
/*
wire [255:0] wl;
wire [7:0]   brs;

decoder_8to256 wl_decode(
  .addr_i(addr_i),
  .select_o(wl)
);

decoder_3to8 brs_decode(
  .addr_i  (addr_i[7:5]),
  .select_o(brs)
);
ssram ssram_macro(
  .SLEEP      (sleep),
  .rst_n      (rst_n),
  .CLK        (clk),
  .CLK_G      (clk),
  .CLK_RBL    (clk_rbl),
  .MODE       (mode),
  .BOOST_EN   (boost_en),
  .CEN        (en_i),
  .WEN        (~we_i),
  .FLAG       (error_flag),
  .EN         (wl_config),
  .BRS        (brs),
  .WL_IN      (wl),
  .D          (wdata_i),
  .Q          (rdata_o)
);

`else
`ifdef FPGA*/
/*********************************************************/

//                ssram model used in FPGA platform

/*********************************************************/
/*
wire [31:0] has_fault;
reg is_corrected;

always @ (posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    is_corrected <= 1'b0;
  end else begin
    if (is_corrected) begin
      is_corrected <= 1'b0;
    end else begin
      if(error_flag) begin
        is_corrected <= 1'b1;
      end
    end
  end
end

blk_mem_gen_0 mem(
  .addra( addr_i ),
  .clka ( clk   ),
  .ena  ( ~en_i  ),
  .wea  ( we_i   ),
  .dina ( wdata_i),
  .douta( rdata_o)
);

blk_mem_gen_1 fault_map(
  .clka ( clk      ),
  .ena  ( ~en_i     ),
  .wea  ( 0         ),
  .addra( addr_i    ),
  .dina ( 'b0       ),
  .douta( has_fault )
);

assign error_flag = (has_fault != 32'h0) && (~is_corrected) && (~we_i);
 


`else*/

  /*******************************************************/

  //       RTL model of ssram
  //       only for design and verification in front end
  //       This should be replaced by spice design in back end

  /******************************************************/

 // reg [31:0] mem[255:0];

  reg [255:0] fault_map;

  reg is_corrected;
/*
  initial begin
    $readmemh("G:/CS_sram/ext_mem.dat", mem);
  end
*/
always @(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    fault_map <= 256'hF53;
  end 
end 

  always @ (negedge clk or negedge rst_n) begin
    if(~rst_n) begin
      is_corrected <= 1'b0;
    end else begin
      if (is_corrected) begin
        is_corrected <= 1'b0;
      end else begin
        if(error_flag) begin
          is_corrected <= 1'b1;
        end
      end
    end
  end


mem_blk
  #( .CHIP_NO(ERAM_CHIP_NO) )
  RAM( 
  .doa(rdata_o), 
  .dia(wdata_i), 
  .addra(addr_i), 
  .clka(clk), 
  .wea( {4{~en_i & we_i}} ),
  .cea(1'b1)
  );

assign error_flag = 1'b0; //(fault_map[addr_i] != 0) && (~is_corrected) && (~we_i);

/*
assign rdata_o = mem[addr_i];


  always @(posedge clk)
  begin
    if (~en_i && we_i)
    begin
      mem[addr_i] <= wdata_i;
    end
  end
*/
//`endif
//`endif
endmodule
