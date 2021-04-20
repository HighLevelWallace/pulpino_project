
`timescale 1ps / 1fs

`define TSTEP 1e-12

`define STROBE_PERIOD 10e-6

`define JITTER_EN 1
`define GATE_DELAY 15

`define TOUTVCOMAX 10000*1E-12 / `TSTEP
`define TOUTVCOMIN 300*1E-12 / `TSTEP
`define TREFMAX 100000*1E-12 / `TSTEP

`define FVCOMIN 625e6
`define FVCOMAX 2.5e9
`define FPFDMIN 5e6
`define FPFDMAX 200e6
`define FBDIVMIN 16
`define FBDIVMAX `FVCOMAX / `FPFDMIN

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

module PLLCORELAINT ( BYPASS, DSMPD, FBDIV, FOUTPOSTDIVPD, FOUTVCOPD, FREF, PD,
	POSTDIV1, POSTDIV2, REFDIV, CLKSSCG, FOUTPOSTDIV, FOUTVCO, LOCK	
);

supply1 VDD;
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

real toutvco = `TOUTVCOMAX;
real toutvco_int = `TOUTVCOMAX;
real toutvco_jit = `TOUTVCOMAX;
real toutvcomin = `TOUTVCOMIN;
real toutvcomax = `TOUTVCOMAX;

real fvcomin = `FVCOMIN;
real fvcomax = `FVCOMAX;
real fvcoprog = 0;
real fpfd = 0;
real fpfdmin = `FPFDMIN;
real fpfdmax = `FPFDMAX;
real fbdivmin = `FBDIVMIN;
real fbdivmax = `FBDIVMAX;

integer refdivval;
integer fbdivval;
integer postdiv1val;
integer postdiv2val;

always @(FBDIV) begin
	if (FBDIV > 7) begin
		fbdivval = FBDIV;
	end 
	else begin
		fbdivval = 4096 - FBDIV;
	end 
end 

always @(REFDIV) begin
	if (FBDIV > 6'b0) begin
		refdivval = REFDIV;
	end 
	else begin
		refdivval = 1;
	end 
end 

always @(POSTDIV1) begin
	if (POSTDIV1 > 0) begin
		postdiv1val = POSTDIV1;
	end 
	else begin
		postdiv1val = 1;
	end 
end 

always @(POSTDIV2) begin
	if (POSTDIV2 > 0) begin
		postdiv2val = POSTDIV2;
	end 
	else begin
		postdiv2val = 1;
	end 
end 

reg LOCK;

time trefin0, trefin1;
real infreq;
real inperiod;
always@(posedge FREF) begin
	trefin1 = $time;
	if(trefin0 > 0) begin
		inperiod = (trefin1 - trefin0);
	end 
	if(inperiod> 0) begin
		infreq = 1 / inperiod / `TSTEP;
	end 
	#1
	trefin0 = trefin1;
end 

real user_strobe_period_sec;
real strobe_period_val_sec;
initial begin
	if($value$plusargs("USER CONTROLLED STROBE PERIOD=%g", user_strobe_period_sec)) begin
		strobe_period_val_sec = user_strobe_period_sec;
		$display("User defined strobe period is %g seconds", strobe_period_val_sec);
	end 
	else begin
		strobe_period_val_sec = `STROBE_PERIOD;
		$display("Default strobe period is %g seconds", strobe_period_val_sec);
	end 
end 

always begin
	# (strobe_period_val_sec / `TSTEP)
	if(!PD) begin 
		if(inperiod > 0) begin
			fpfd = infreq / refdivval;
		end 

		if(fpfd < (fpfdmin * 0.999)) begin
			$display("Invalid PFD frequency = %.2f MHz at time %.1f ns", fpfd/1e6, $time/(1e-9/`TSTEP));
			$display("Minimum PFD frequency = %.2f MHz", fpfdmin/1e6);
		end 

		fpfdmax = 1/(fbdivmin*toutvco)/`TSTEP;
		if(fpfd > (fpfdmax * 1.001)) begin
			$display("Invalid PFD frequency = %.2f MHz at time %.1f ns", fpfd/1e6, $time/(1e-9/`TSTEP));
			$display("Maximum PFD frequency = %.2f MHz", fpfdmax/1e6);
		end 

		fvcoprog = fpfd*$itor(FBDIV);
		if($itor(FBDIV) < (fbdivmin * 0.999)) begin 
			$display("Invalid FBDIV value = %1d at time %.1f ns", $itor(FBDIV), $time/(1e-9/`TSTEP));
			$display("Minimum FBDIV value = %1d", fbdivmin);
		end 
		if($itor(FBDIV) > (fbdivmax * 1.001)) begin 
			$display("Invalid FBDIV value = %1d at time %.1f ns", $itor(FBDIV), $time/(1e-9/`TSTEP));
			$display("Maximum FBDIV value = %1d", fbdivmax);
		end 

		if(fvcoprog < (fvcomin * 0.999)) begin
			$display("Invalid VCO frequency = %.2f MHz at time %.1f ns", fvcoprog/1e6, $time/(1e-9/`TSTEP));
			$display("Minimum VCO frequency = %.2f MHz", fvcomin/1e6);
		end 
		if(fvcoprog > (fvcomax * 1.001)) begin
			$display("Invalid VCO frequency = %.2f MHz at time %.1f ns", fvcoprog/1e6, $time/(1e-9/`TSTEP));
			$display("Maximum VCO frequency = %.2f MHz", fvcomax/1e6);
		end 

		if($itor(POSTDIV2) > $itor(POSTDIV1)) begin 
			$display("POSTDIV1 should be greater than or equal to POSTDIV2");
		end 
		if(POSTDIV1 == 3'b0) begin 
			$display("POSTDIV1 is set to 0. It will default to divide by 1");
		end
		if(POSTDIV2 == 3'b0) begin 
			$display("POSTDIV2 is set to 0. It will default to divide by 1");
		end 
		if(REFDIV == 6'b0) begin 
			$display("REFDIV is set to 0. It will default to divide by 1");
		end 
	end 
end 

wire enable;
assign enable = (~PD && VDD && ~VSS);

reg FOUTVCOint;
assign FOUTVCO = (enable && ~FOUTVCOPD) ? FOUTVCOint : 1'b0;
reg FOUTPOSTDIVi;
reg FOUTPOSTDIVext;

initial begin
	FOUTVCOint = 1'b0;
	FOUTPOSTDIVi = 1'b0;

	LOCK = 1'b0;

	FOUTPOSTDIVext = 1'b0;
end

always @(FOUTPOSTDIVi)
	if(enable && ~FOUTPOSTDIVPD) FOUTPOSTDIVext = FOUTPOSTDIVi;
always @(PD or FOUTPOSTDIVPD) begin
	if (PD || FOUTPOSTDIVPD) begin
		FOUTPOSTDIVext = 1'b0;
	end 
end 

integer refdivcount = 1;
reg ref_in_int;
wire ref_in;
always @(posedge FREF) begin
	ref_in_int = 0;
	if(refdivcount> 1) refdivcount = refdivcount - 1;
	else begin
		refdivcount = refdivval;
		ref_in_int = 1;
	end 
end 
assign ref_in = enable ? ((refdivval == 1) ? FREF : ref_in_int) : 1'b0;

reg div_in;
real pllratio = `FBDIVMIN;
always @(posedge div_in) begin
	pllratio = fbdivval;
	if(pllratio < `FBDIVMIN) pllratio = `FBDIVMIN;
end 

integer fbdivcount = 1;

always @(posedge FOUTVCOint) begin
	div_in = 0;
	if(fbdivcount > 1) fbdivcount = fbdivcount - 1;
	else begin
		if(enable) begin
			div_in = 1;
			fbdivcount = fbdivval;
		end 
	end 
end 

real refperiod = `TREFMAX;
real phaseerror;
real ivcomax = `IVCOMAX;
real icp = `ICP;
real cint = `CINT;
real kvi = `KVI;
parameter dacratio = `DACRATIO;
time tref0, tref1;
time tpfd0, tpfd1;
reg pfd_up, pfd_down;
integer refcount;
initial begin
	pfd_up = 0;
	pfd_down = 0;
	refcount = 0;
end 
always @(enable) begin
	if(~enable) begin
		pfd_up = 0;
		pfd_down = 0;
		refcount = 0;
		LOCK = 0;
		toutvco = toutvcomax;
	end
end

always @(posedge enable) begin
	tpfd0 = $time;
	toutvco_int = toutvcomax;
	phaseerror = 0;
	LOCK = 0;
	refcount = 0;
end 

real freq1, freq_step;

always @(posedge ref_in) begin
	tref1 = $time;
	if(tref0 > 0) refperiod = (tref1 - tref0);
	tref0 = tref1;

	if(enable) begin
		if(pfd_up) begin
			tpfd1 = $time;
			refcount = 0;
			LOCK = 0;
			if(tpfd0 > 0) phaseerror = tpfd1 - tpfd0;
			tpfd0 = tpfd1;

			toutvco_int = (1/((1/(toutvco_int * `TSTEP))+((phaseerror * `TSTEP * icp * kvi) / cint))) / `TSTEP;

			toutvco = toutvco_int - (dacratio * phaseerror / pllratio);
		end 
		else begin
			if(pfd_down) begin 
				tpfd1 = $time;
				phaseerror = tpfd1 - tpfd0;
				pfd_up = 0;
				pfd_down = 0;

				freq1 = 1 / (toutvco_int * `TSTEP);
				freq_step = phaseerror * `TSTEP * icp * kvi / cint;
				if(freq1 < 1.001 * freq_step) begin
					toutvco_int = toutvcomax;
				end 
				else begin
					toutvco_int = (1/((1/(toutvco_int * `TSTEP)) - ((phaseerror * `TSTEP * icp * kvi) / cint))) / `TSTEP;
				end 

				toutvco = toutvco_int + (dacratio * phaseerror / pllratio);

				if(refcount < `LOCKCYCLES) begin
					LOCK= 0;
					refcount = refcount + 1;
				end 
				else
					LOCK = 1;
			end 
			else begin
				pfd_up = 1;
				tpfd0 = $time;
			end
		end 
		if(toutvco < toutvcomin) begin
			toutvco = toutvcomin;
		end 
	end 
	else begin
		tpfd0=0;
		toutvco_int = toutvcomax;
		phaseerror = 0;
		LOCK = 0;
		refcount = 0;
	end 
end 
always @(posedge div_in) begin
	if(enable) begin
		if(pfd_down) begin
			tpfd1 = $time;
			refcount = 0;
			LOCK = 0;
			if (tpfd0 > 0) phaseerror = tpfd1 - tpfd0;
			tpfd0 = tpfd1;

			freq1 = 1 / (toutvco_int * `TSTEP);
			freq_step = phaseerror * `TSTEP * icp * kvi / cint;
			if(freq1 < 1.001 * freq_step) begin
				toutvco_int = toutvcomax;
			end 
			else begin
				toutvco_int = (1/((1/(toutvco_int * `TSTEP)) - ((phaseerror * `TSTEP * icp * kvi) / cint))) / `TSTEP;
			end 

			toutvco = toutvco_int + (dacratio * phaseerror / pllratio);
		end 
		else begin
			if(pfd_up) begin
				tpfd1 = $time;
				phaseerror = tpfd1 - tpfd0;
				pfd_up = 0;
				pfd_down = 0;

				toutvco_int = (1/((1/(toutvco_int * `TSTEP))+((phaseerror * `TSTEP * icp * kvi) / cint))) / `TSTEP;

				toutvco = toutvco_int - (dacratio * phaseerror / pllratio);

				if (refcount < `LOCKCYCLES) begin
					LOCK = 0;
					refcount = refcount + 1;
				end 
				else LOCK = 1;
			end
			else begin
				pfd_down = 1;
				tpfd0 = $time;
			end
		end 
		if(toutvco < toutvcomin) begin
			toutvco = toutvcomin;
		end 
	end
	else begin
		tpfd0 = 0;
		toutvco_int = toutvcomax;
		phaseerror = 0;
		LOCK = 0;
		refcount = 0;
	end 
end 

real icp_int;
always @(toutvco_int) begin
	icp_int = ivcomax / ((fvcomax * toutvco * `TSTEP)**1.5) / `ICHRATIO;
	icp = LOCK ? icp_int :(icp_int < `ICP) ? `ICP : icp_int;
end 

parameter two_to_31 = 21474483648.0;
real jitter = `PJMIN_PS;
real tjit , rand1;
always @(posedge FOUTVCOint) begin
	rand1 = ($random / two_to_31 + $random / two_to_31 + $random / two_to_31
		+ $random / two_to_31 + $random / two_to_31 + $random / two_to_31
		+ $random / two_to_31 + $random / two_to_31 + $random / two_to_31
		) / 1.73205;
	tjit = jitter * rand1 * `JITTER_EN;
	toutvco_jit = toutvco + tjit;
end 

always @(toutvco_int) begin
	if (toutvco_int < toutvcomin) begin 
		toutvco_int = toutvcomin;
	end  

	if(toutvco_int > toutvcomax) begin
		toutvco_int = toutvcomax;
	end 
end 

wire FREFi;
assign #(2 * `GATE_DELAY) FREFi = FOUTPOSTDIVPD ? 1'b0 : FREF;
assign FOUTPOSTDIV = (BYPASS ? FREFi : FOUTPOSTDIVext);

always #(toutvco_jit / 2.0) FOUTVCOint = ~FOUTVCOint;

integer postdivcount = 1;

always @(FOUTVCOint) begin
	if (postdivcount > 1) begin
		if(postdivcount <(postdiv1val * postdiv2val + 1)) postdivcount = postdivcount - 1;
		else postdivcount = postdiv1val * postdiv2val;
	end 
	else begin
		FOUTPOSTDIVi = ~FOUTPOSTDIVi;
		postdivcount = postdiv1val * postdiv2val;
	end 
end 

reg clksscg_int;
integer clksscg_count = 0;

initial begin
	clksscg_int = 0;
end 

always @(posedge div_in) begin
	clksscg_int = 1;
	clksscg_count = 3;
end 
always @(posedge FOUTVCOint) begin
	if(clksscg_count > 0) clksscg_count = clksscg_count - 1;
	else clksscg_count = 0;
end 
assign CLKSSCG = DSMPD ? 1'b0 : clksscg_int;

endmodule