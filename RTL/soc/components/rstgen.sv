// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

module rstgen
(
    // PAD FRAME SIGNALS
    input  logic clk_i,
    input  logic rst_ni,

    input  logic soft_reset_en,

    // OUTPUT RESET
    output logic c_rstn_o,
    output logic p_rstn_o
  );

  logic   c_rst_ff3,c_rst_ff2,c_rst_ff1,c_rst_ff0,c_rst_n;
  logic   p_rst_ff3,p_rst_ff2,p_rst_ff1,p_rst_ff0,p_rst_n;
  //
  // RESET GENERATION
  //

  always_ff @(posedge clk_i, negedge rst_ni)
  begin
    if (~rst_ni)
    begin
      c_rst_ff0  <= 1'b0;
      c_rst_ff1  <= 1'b0;
      c_rst_ff2  <= 1'b0;
      c_rst_ff3  <= 1'b0;
      c_rst_n    <= 1'b0;

      p_rst_ff0  <= 1'b0;
      p_rst_ff1  <= 1'b0;
      p_rst_ff2  <= 1'b0;
      p_rst_ff3  <= 1'b0;
      p_rst_n    <= 1'b0;
    end
    else
    begin
      p_rst_ff3  <= 1'b1;
      p_rst_ff2  <= p_rst_ff3;
      p_rst_ff1  <= p_rst_ff2;
      p_rst_ff0  <= p_rst_ff1;
      p_rst_n    <= p_rst_ff0;
      if (soft_reset_en) begin
        c_rst_ff0  <= 1'b0;
        c_rst_ff1  <= 1'b0;
        c_rst_ff2  <= 1'b0;
        c_rst_ff3  <= 1'b0;
        c_rst_n    <= 1'b0;
      end else begin
        c_rst_ff3  <= 1'b1;
        c_rst_ff2  <= c_rst_ff3;
        c_rst_ff1  <= c_rst_ff2;
        c_rst_ff0  <= c_rst_ff1;
        c_rst_n    <= c_rst_ff0;
      end
    end
  end

assign c_rstn_o = c_rst_n;
assign p_rstn_o = p_rst_n;
endmodule
