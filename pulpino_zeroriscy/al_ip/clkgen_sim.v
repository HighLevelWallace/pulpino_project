// Verilog netlist created by TD v5.0.24498
// Fri Mar 19 19:53:02 2021

`timescale 1ns / 1ps
module OSC0  // clkgen.v(14)
  (
  osc_dis,
  osc_clk
  );

  input osc_dis;  // clkgen.v(16)
  output osc_clk;  // clkgen.v(15)


  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  EG_PHY_OSC #(
    .STDBY("ENABLE"))
    inst (
    .osc_dis(osc_dis),
    .osc_clk(osc_clk));  // clkgen.v(20)

endmodule 

