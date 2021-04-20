// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

module apb_pll_if
#(
    parameter APB_ADDR_WIDTH = 12
)
(
    input  logic                      HCLK,
    input  logic                      HRESETn,
    input  logic [APB_ADDR_WIDTH-1:0] PADDR,
    input  logic               [31:0] PWDATA,
    input  logic                      PWRITE,
    input  logic                      PSEL,
    input  logic                      PENABLE,
    output logic               [31:0] PRDATA,
    output logic                      PREADY,
    output logic                      PSLVERR,

    output logic               [31:0] pll_config_o,
    output logic                      pll_config_valid_o,
    input  logic                      pll_config_ready_i

 
);
parameter pll_default_config = 32'h0010_0277;

enum logic [1:0] {IDLE, GET, CONFIG, DONE} state, next_state;
reg [31:0] pll_config_reg;

always_comb begin
    next_state = state;
    pll_config_valid_o = 0;
    PREADY = 0;
    case (state) 

        IDLE : begin
            if(PSEL & PENABLE & PWRITE) begin
                next_state = GET;
            end 
        end 

        GET : begin
            next_state = CONFIG;
        end 

        CONFIG : begin
            pll_config_valid_o = 1;
            if(pll_config_ready_i) begin
                next_state = DONE;
            end 
        end 

        DONE : begin
            next_state = IDLE;
            PREADY = 1;
        end 

        default : next_state = IDLE;
    endcase 
end 

always_ff @(posedge HCLK, negedge HRESETn) begin
    if(~HRESETn) begin
        pll_config_reg <= pll_default_config;
        state <= IDLE;
    end 
    else begin
        state <= next_state;
        if(PSEL & PENABLE & PWRITE) begin
            pll_config_reg <= PWDATA;
        end 
    end 
end 


assign pll_config_o = pll_config_reg;
assign PRDATA     = pll_config_reg;
assign PSLVERR    = 1'b0;

endmodule
