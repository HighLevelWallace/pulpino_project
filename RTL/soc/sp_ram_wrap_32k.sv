// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License�?); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS�? BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

`include "includes/config.sv"

(* DONT_TOUCH = "TRUE" *)module sp_ram_wrap_32k
  #(
    parameter RAM_SIZE   = 32768,              // in bytes
    parameter ADDR_WIDTH = $clog2(RAM_SIZE) + 1,
    parameter DATA_WIDTH = 32
  )(
    // Clock and Reset
    input  logic                    clk,
    input  logic                    rst_n,
    input  logic                    en_i,
    input  logic [ADDR_WIDTH-1:0]   addr_i,
    input  logic [DATA_WIDTH-1:0]   wdata_i,
    output logic [DATA_WIDTH-1:0]   rdata_o,
    input  logic                    we_i,
    input  logic [DATA_WIDTH/8-1:0] be_i,
    input  logic                    bypass_en_i,
    output logic                    rvalid_o,
    output logic                    stat_done_o,
    output logic                    ck_o
  );

wire clk_rbl;
wire rbl_active;
wire ram_active;
wire [11:0] wl_config;
wire is_cross_sensing;
wire boost_en;

// reg or ram address
logic is_reg;
reg is_reg_q;

//signal for ram
logic [15:0] error_flag_out;
logic error_flag;
logic ram_rvalid;
logic [31:0] ram_rdata_o;
logic [15:0][31:0] ram_data_out;
logic [15:0] select;
logic ram_en;

wire csn;

enum logic [1:0] {IDLE, READ, PRE_WR, WRITE} state, state_d;

logic [31:0] addr_d, addr_q;
logic we;
logic [31:0] wdata_d, wdata_q;
logic [3:0] be_d, be_q;

//signal for reg
wire reg_rvalid;
reg [1:0] reg_addr_q;
wire can_operate;

// config reg and performance counter 
logic perf_log;
reg pre_errorflag;
reg [31:0] ssram_config;
reg [31:0] access_counter;
reg [31:0] error_counter;
reg [31:0] cycle_counter;


assign wl_config = ssram_config[11:0];
assign is_cross_sensing = ssram_config[12];
assign boost_en = ssram_config[13];
assign ram_active = ssram_config[14];
assign rbl_active = ssram_config[15];
assign perf_log = ssram_config[16];

assign is_reg = addr_i[ADDR_WIDTH-1];
assign reg_rvalid = is_reg_q;
assign can_operate = (state == IDLE) | ((state == READ) & (~error_flag)) | (state == WRITE);

assign stat_done_o = access_counter == 32'h000f_ffff;

always @ (posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    pre_errorflag <= 0;
    reg_addr_q <= 0;
    is_reg_q <= 0;
  end else begin
    pre_errorflag <= error_flag;
    if(is_reg && can_operate) begin
      reg_addr_q <= addr_i[3:2];
      is_reg_q <= 1'b1;
    end 
    else begin
      is_reg_q <= 1'b0;
    end 
  end
end

always @ (posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    access_counter <= 32'h0;
    error_counter <= 32'h0;
    ssram_config <= 32'h0001_F180;
  end else begin
    if(en_i && we_i && is_reg && can_operate && (addr_i[3:2] == 2'b10)) begin
      access_counter <= wdata_i;
    end else if (perf_log && (state == READ) && ram_rvalid) begin
      access_counter <= access_counter + 1;
    end

    if(en_i && we_i && is_reg && can_operate && (addr_i[3:2] == 2'b01)) begin
      cycle_counter <= wdata_i;
    end else if (perf_log && (state == READ) && ~csn) begin
      cycle_counter <= cycle_counter + 1;
    end

    if(en_i && we_i && is_reg && can_operate && (addr_i[3:2] == 2'b11)) begin
      error_counter <= wdata_i;
    end else if (perf_log && (state == READ) && pre_errorflag && (~error_flag)) begin
      error_counter <= error_counter + 1;
    end

    if(en_i && we_i && is_reg && can_operate && (addr_i[3:2] == 2'b00)) begin
      ssram_config <= wdata_i;
    end
    else begin
      if (access_counter == 32'h000f_ffff) begin
        ssram_config[16] = 0;
      end
    end
  end
end

always_comb begin
  if(is_reg_q) begin
    rvalid_o = reg_rvalid;
    case(reg_addr_q) 
      2'b00 : begin
        rdata_o = ssram_config;
      end

      2'b01 : begin
        rdata_o = cycle_counter;
      end 

      2'b10: begin
        rdata_o = access_counter;
      end

      2'b11 : begin
        rdata_o = error_counter;
      end

      default : begin
        rdata_o = 32'h0;
      end
    endcase 
  end else begin
    rvalid_o = ram_rvalid;
    rdata_o = ram_rdata_o;
  end
end

assign ram_rvalid = ((state == READ) && (~error_flag)) || (state == WRITE);
assign ram_en = (~is_reg) && en_i;
assign csn = state_d == IDLE;

always_comb begin
  addr_d = addr_q;
  state_d = state;
  wdata_d = wdata_q;
  be_d = be_q;
  we = 0;
  case(state)
    IDLE : begin
      if(ram_en) begin
        addr_d = addr_i;
        if (we_i) begin
          state_d = PRE_WR;
          wdata_d = wdata_i;
          be_d = be_i;
        end 
        else begin
          state_d = READ;
        end 
      end 
    end 

    READ : begin
      if (~error_flag) begin
        if (ram_en) begin
          addr_d = addr_i;
          if(we_i) begin
            state_d = PRE_WR;
            wdata_d = wdata_i;
            be_d = be_i;
          end
        end 
        else begin
          state_d = IDLE;
        end 
      end 
    end 

    PRE_WR : begin
      if(~error_flag) begin
        state_d = WRITE;
        we = 1;
        wdata_d[31:24] = be_q[3] ? wdata_q[31:24] : rdata_o[31:24];
        wdata_d[23:16] = be_q[2] ? wdata_q[23:16] : rdata_o[23:16];
        wdata_d[15:8 ] = be_q[1] ? wdata_q[15:8 ] : rdata_o[15:8 ];
        wdata_d[7:0  ] = be_q[0] ? wdata_q[7:0  ] : rdata_o[7:0  ];
      end
    end 

    WRITE : begin
      we = 1;
      if(ram_en) begin
        addr_d = addr_i;
        if(we_i) begin
          state_d = PRE_WR;
          wdata_d = wdata_i;
          be_d = be_i;
        end
        else begin
          state_d = READ;
        end 
      end 
      else begin
        state_d = IDLE;
      end
    end

    default : state_d = IDLE;
  endcase  
end 

always_ff @(posedge clk, negedge rst_n) begin
  if (~rst_n) begin
    state  <= IDLE;
    addr_q <= 0;
    wdata_q <= 0;
    be_q <= 0;
  end 
  else begin
    state  <= state_d;
    addr_q <= addr_d;
    wdata_q <= wdata_d;
    be_q <= be_d;
  end 
end

mem_blk_32 mem_blk_32_i (
    .doa    ( ram_rdata_o               ),
    .dia    ( wdata_d                   ),
    .addra  ( addr_d[14:2]              ),
    .cea    ( 1'b1                      ),
    .clka   ( clk                       ),
    .wea    ( {4{~(csn) & we}} & be_d   )
);

// genvar i;
// generate
//   for(i = 0 ; i < BLK_CNT ; i = i + 1) begin
//     sp_ram
//     #(
//       .ADDR_WIDTH ( 8     ),
//       .DATA_WIDTH ( 32    ),
//       .NUM_WORDS  ( 256   ),
//       .ERAM_CHIP_NO  ( i  )
//     )
//     sp_ram_i
//     (
//       .clk           ( ~clk               ),
//       .clk_g         ( 1'b0               ),
//       .rst_n         ( 1'b1               ),
//       .clk_rbl       ( clk_rbl            ),
//       .sleep         ( ram_active         ),
//       .mode          ( is_cross_sensing   ),
//       .boost_en      ( boost_en           ),
//       .wl_config     ( wl_config          ),
//       .en_i          ( csn | select[i]    ),
//       .addr_i        ( addr_q[9:2]        ),
//       .wdata_i       ( wdata_q            ),
//       .rdata_o       ( ram_data_out[i]    ),
//       .we_i          ( we                 ),
//       .error_flag    ( error_flag_out[i]  )
//     ); 
//   end
// endgenerate

rbl rbl_i(
  .CLK(1'b1),
  .SLEEP(rbl_active),
  .CLK_RBL(clk_rbl),
  .CLK_DIV(ck_o)
);

// always_comb begin
//   case(addr_q[ADDR_WIDTH-3:ADDR_WIDTH-6])
//     4'b0000 : select = 16'b1111_1111_1111_1110;
//     4'b0001 : select = 16'b1111_1111_1111_1101;
//     4'b0010 : select = 16'b1111_1111_1111_1011;
//     4'b0011 : select = 16'b1111_1111_1111_0111;
//     4'b0100 : select = 16'b1111_1111_1110_1111;
//     4'b0101 : select = 16'b1111_1111_1101_1111;
//     4'b0110 : select = 16'b1111_1111_1011_1111;
//     4'b0111 : select = 16'b1111_1111_0111_1111;
//     4'b1000 : select = 16'b1111_1110_1111_1111;
//     4'b1001 : select = 16'b1111_1101_1111_1111;
//     4'b1010 : select = 16'b1111_1011_1111_1111;
//     4'b1011 : select = 16'b1111_0111_1111_1111;
//     4'b1100 : select = 16'b1110_1111_1111_1111;
//     4'b1101 : select = 16'b1101_1111_1111_1111;
//     4'b1110 : select = 16'b1011_1111_1111_1111;
//     4'b1111 : select = 16'b0111_1111_1111_1111;
//   endcase
// end 

// always_comb begin
//   case(addr_q[ADDR_WIDTH-3:ADDR_WIDTH-6])
//     4'b0000 : ram_rdata_o = ram_data_out[0];
//     4'b0001 : ram_rdata_o = ram_data_out[1];
//     4'b0010 : ram_rdata_o = ram_data_out[2];
//     4'b0011 : ram_rdata_o = ram_data_out[3];
//     4'b0100 : ram_rdata_o = ram_data_out[4];
//     4'b0101 : ram_rdata_o = ram_data_out[5];
//     4'b0110 : ram_rdata_o = ram_data_out[6];
//     4'b0111 : ram_rdata_o = ram_data_out[7];
//     4'b1000 : ram_rdata_o = ram_data_out[8];
//     4'b1001 : ram_rdata_o = ram_data_out[9];
//     4'b1010 : ram_rdata_o = ram_data_out[10];
//     4'b1011 : ram_rdata_o = ram_data_out[11];
//     4'b1100 : ram_rdata_o = ram_data_out[12];
//     4'b1101 : ram_rdata_o = ram_data_out[13];
//     4'b1110 : ram_rdata_o = ram_data_out[14];
//     4'b1111 : ram_rdata_o = ram_data_out[15];
//   endcase
// end

// always_comb begin
//   case(addr_q[ADDR_WIDTH-3:ADDR_WIDTH-6])
//     4'b0000 : error_flag = error_flag_out[0];
//     4'b0001 : error_flag = error_flag_out[1];
//     4'b0010 : error_flag = error_flag_out[2];
//     4'b0011 : error_flag = error_flag_out[3];
//     4'b0100 : error_flag = error_flag_out[4];
//     4'b0101 : error_flag = error_flag_out[5];
//     4'b0110 : error_flag = error_flag_out[6];
//     4'b0111 : error_flag = error_flag_out[7];
//     4'b1000 : error_flag = error_flag_out[8];
//     4'b1001 : error_flag = error_flag_out[9];
//     4'b1010 : error_flag = error_flag_out[10];
//     4'b1011 : error_flag = error_flag_out[11];
//     4'b1100 : error_flag = error_flag_out[12];
//     4'b1101 : error_flag = error_flag_out[13];
//     4'b1110 : error_flag = error_flag_out[14];
//     4'b1111 : error_flag = error_flag_out[15];
//   endcase
// end

endmodule