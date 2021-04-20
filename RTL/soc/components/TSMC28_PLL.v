`timescale 1 ps / 1 fs

`define TSTEP 1e-12

`define STROBE_PERIOD 10e-6

`define JITTER_EN 1
`define GATE_DELAY 15

`define TOUTVCOMAX 10000*1E-12 / `TSTEP
`define TOUTVCOMIN 300*1E-12 / `TSTEP
`define TOUTVCOMAX 100000*1E-12 / `TSTEP

`define FVCOMIN 625e6
`define FVCOMIN 2.5e9
`define FPFDMIN 5e6
`define FPFDMAX 200e6
`define FBDIVMIN 16
`define FBDIVMIN `FVCOMAX / `FPFDMIN

`define SETUP 4 / `FVCOMIN / `TSTEP
`define HOLD 0

`define IVCOMAX 1.27e-3
`define ICP 4e-6
`define CINT 60e-12
`define KVI 4 * `FVCOMAX
`define ICHRATIO 256
`define DACRATIO 0.25
`define LOCKCYCLES 256
`define PJMIN_PS 0.5

module TSMC28_PLL (BYPASS, DSMPD, FBDIV, FOUTPOSTDIVPD, FOUTVCOPD, FREF, PD,
	POSTDIV1, POSTDIV2, REFDIV, CLKSSCG, FOUTPOSTDIV, FOUTVCO, LOCK);

supply1 VDD;
supply1 VDDA;
supply0 VSS;

input FREF;
input [5:0] REFDIV;

input [11:0] FBDIV;

input [2:0] POSTDIV1;
input [2:0] POSTDIV2;

input PD;
input DSMPD;
input FOUTPOSTDIVPD;
input FOUTVCOPD;
input BYPASS;

output FOUTVCO;
output FOUTPOSTDIV;

output LOCK;

output CLKSSCG;

specify 
	$setup(FBDIV[11], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[10], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[9], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[8], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[7], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[6], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[5], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[4], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[3], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[2], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[1], posedge CLKSSCG, `SETUP);
	$setup(FBDIV[0], posedge CLKSSCG, `SETUP);
	$hold(posedge CLKSSCG, FBDIV[11], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[10], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[9], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[8], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[7], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[6], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[5], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[4], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[3], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[2], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[1], `HOLD);
	$hold(posedge CLKSSCG, FBDIV[0], `HOLD);
endspecify

PLLCORELAINT pll( .BYPASS(BYPASS), .DSMPD(DSMPD), .FBDIV(FBDIV),
	.FOUTPOSTDIVPD(FOUTPOSTDIVPD), .FOUTVCOPD(FOUTVCOPD), .FREF(FREF), .PD(PD),
	.POSTDIV1(POSTDIV1), .POSTDIV2(POSTDIV2), .REFDIV(REFDIV), .CLKSSCG(CLKSSCG),
	.FOUTPOSTDIV(FOUTPOSTDIV), .FOUTVCO(FOUTVCO), .LOCK(LOCK)
	);

endmodule