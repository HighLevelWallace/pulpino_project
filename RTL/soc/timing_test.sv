`define SYNTHESIS

module timing_test(
  input  logic clk,
  input  logic rst_n,

  input  logic we_i,

  output logic [31:0] out_data
);

  parameter   NUM             = 512,
              INV_CHAIN_SIZE  = 22;
  enum logic [1:0] {IDLE, INV_EN, CNT_WAIT, CNT_EN} cstate, nstate;

  reg             in;
  wire [NUM-1:0]  inv_in;
  wire [NUM-1:0]  inv_out;
  wire [NUM-1:0]  inv_out_ff;
  wire [NUM-1:0]  inv_out_ff2;
  wire [NUM-1:0]  inv_err;
  reg             cnt_finish;
  reg  [8+1:0]    counter;
  reg  [8:0]      cnt_cnt;
  wire [8:0]      cnt_idx;

  wire start;
  wire cnt_start;

  reg pre_we1;
  reg pre_we2;

  reg cnt_wait1;
  reg cnt_wait2;

assign start = pre_we2 & (we_i);
assign cnt_start = cnt_wait2;

  always_comb begin
    nstate = cstate;
    case (cstate)
      IDLE: begin
        if(start) begin
          nstate = INV_EN;
        end 
      end 

      INV_EN: begin
        nstate = CNT_WAIT;
      end

      CNT_WAIT: begin
        if (cnt_start) nstate = CNT_EN;
      end

      CNT_EN: begin
        if (cnt_finish == 1'b1) begin
          nstate = IDLE; 
          $display("!!! Finish  Error Counting !!!   Error = %d", counter);
          end
      end

    endcase
  end

  always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
      cstate <= IDLE;
      pre_we1 <= 0;
      pre_we2 <= 0;

      cnt_wait1 <= 0;
      cnt_wait2 <= 0;
    end 
    else begin 
      cstate <= nstate;
      pre_we1 <= we_i;
      pre_we2 <= pre_we1;

      cnt_wait2 <= cnt_wait1;
    end 
  end
  
  // Input Generator
  always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
      in <= 1'b0;
    else if (cstate == INV_EN) begin
      in <= ~in;
      counter <= 0;
      cnt_wait1 <= 1'b0;
      cnt_wait2 <= 1'b0;
      cnt_cnt <= 0;
      cnt_finish <= 1'b0;
    end else if (cstate == CNT_WAIT) begin
      cnt_wait1 <= 1'b1;
    end
  end
  
  // INV Chain
  genvar chain_idx; 
  generate
    for(chain_idx=0; chain_idx<NUM; chain_idx++) begin
      // Input FF
      dff dff_inv_in(
        .din(in),
        .clk(clk),
        .q(inv_in[chain_idx]));
    
      // Chain
      inv_chain #(INV_CHAIN_SIZE) invchain(.in(inv_in[chain_idx]), .out(inv_out[chain_idx]));

      // Output FF (must right)
      dff dff_inv_out(
        .din(inv_out[chain_idx]),
        .clk(clk),
        .q(inv_out_ff[chain_idx]));

      // Output FF -> wait a cycle (maybe wrong output from previous FF)
      dff dff_inv_out2(
        .din(inv_out_ff[chain_idx]),
        .clk(clk),
        .q(inv_out_ff2[chain_idx]));

    end
  endgenerate  
  
  assign cnt_idx = cnt_cnt;
  always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
      counter <= 0;
      cnt_cnt <= 0;
    end else begin
      if ((cstate == CNT_EN) && (cnt_finish == 1'b0)) begin
        cnt_cnt <= cnt_cnt + 1'b1;
        if (inv_out_ff[cnt_idx] != inv_out_ff2[cnt_idx]) begin
          counter <= counter + 1'b1;
        end
      end
      if (cnt_cnt == NUM-1) begin
        cnt_finish <= 1'b1;
      end
    end

  end

  always_ff @(posedge clk or negedge rst_n) begin : proc_
    if(~rst_n) begin
       out_data <= 0;
    end else begin
      if (cnt_finish == 1'b1)
        out_data[9:0] <= counter;
    end
  end
  
endmodule
  
module dff (
  input   din,
  input   clk, 
  output reg q);

  always @ (posedge clk) begin
    q <= din;
  end
  
endmodule

module inv(
  input     I,
  output    ZN);
`ifndef SYNTHESIS
  //This is a black box.
  //it is implemented by spice module
  //just for simulation
  assign ZN = ~I;
  // black box end
`endif 
endmodule

module inv_chain
  #(
    parameter INV_CHAIN_SIZE = 1
    )
  (
  input in,
  output out
  );
assign out = ~in;
endmodule

