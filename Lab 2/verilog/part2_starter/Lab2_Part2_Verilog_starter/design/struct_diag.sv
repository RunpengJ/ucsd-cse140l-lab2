// CSE140L  
// see Structural Diagram in Lab2 assignment writeup
// fill in missing connections and parameters
module struct_diag #(parameter NS=60, NH=24)(
  input Reset,
        Timeset, 	  // manual buttons
        Alarmset,	  //	(five total)
		Minadv,
		Hrsadv,
		Dayadv,
		Alarmon,
		Pulse,		  // assume 1/sec.
// 6 decimal digit display (7 segment)
  output [6:0] S1disp, S0disp, 	   // 2-digit seconds display
               M1disp, M0disp, 
               H1disp, H0disp,
                       D0disp,   // for part 2
  output logic Buzz);	           // alarm sounds
// internal connections (may need more)
  logic[6:0] TSec, TMin, THrs, TDys,     // clock/time 
             AMin, AHrs;		   // alarm setting
  logic[6:0] Min, Hrs, Dys;
  logic Szero, Mzero, Hzero, Dzero,	   // "carry out" from sec -> min, min -> hrs, hrs -> days
        TMen, THen, TDen, AMen, AHen;
  logic buzz;

// free-running seconds counter	-- be sure to set parameters on ct_mod_N modules
  ct_mod_N #(.N(NS)) Sct(
// input ports
    .clk(Pulse), .rst(Reset), .en(!Timeset), 
// output ports    
    .ct_out(TSec), .z(Szero)
    );
// minutes counter -- runs at either 1/sec or 1/60sec
  ct_mod_N #(.N(NS)) Mct(
    .clk(Pulse), .rst(Reset), .en(TMen), .ct_out(TMin), .z(Mzero)
    );
// hours counter -- runs at either 1/sec or 1/60min
  ct_mod_N #(.N(NH)) Hct(
	.clk(Pulse), .rst(Reset), .en(THen), .ct_out(THrs), .z(Hzero)
    );
  ct_mod_N #(.N(7)) Dct(
	.clk(Pulse), .rst(Reset), .en(TDen), .ct_out(TDys), .z(Dzero)
    );

// alarm set registers -- either hold or advance 1/sec
  ct_mod_N #(.N(NS)) Mreg(
// input ports
    .clk(Pulse), .rst(Reset), .en(AMen), 
// output ports    
    .ct_out(AMin), .z()
    ); 
  ct_mod_N #(.N(NH)) Hreg(
    .clk(Pulse), .rst(Reset), .en(AHen), .ct_out(AHrs), .z()
    ); 

// display drivers (2 digits each, 6 digits total)
  lcd_int Sdisp(
    .bin_in    (TSec)  ,
	.Segment1  (S1disp),
	.Segment0  (S0disp)
	);

  lcd_int Mdisp(
    .bin_in    (Min),
	.Segment1  (M1disp),
	 .Segment0 (M0disp)
	);

  lcd_int Hdisp(
    .bin_in    (Hrs),
	.Segment1  (H1disp),
	  .Segment0  (H0disp)
	);
  lcd_int Ddisp(
    .bin_in    (TDys),
	.Segment1  (),
	  .Segment0  (D0disp)
	);
	
  always_comb begin
    AMen = 0;
	AHen = 0;
    Min = 0;
	Hrs = 0;
    Dys = 0;
    TMen = 0;
    THen = 0;
    TDen = 0;
	if (Alarmset && !Timeset) begin
		// display alarm
		Min = AMin;
		Hrs = AHrs;
		AMen = Minadv;
		AHen = Hrsadv;
	end
	else if (!Alarmset && Timeset) begin
		// display current time
		Min = TMin;
		Hrs = THrs;
		Dys = TDys;
		TMen = Minadv;
		THen = Hrsadv;
		TDen = Dayadv;
	end
	else begin
		// rolling over
		Min = TMin;
		Hrs = THrs;
		Dys = TDys;
		// min++ when Szero is 1
		TMen = Szero;
		// hr++ when Mzero and Szero are 1
		THen = Mzero && Szero;
		// dys++ when Hzero, Mzero and Szero are 1
		TDen = Hzero && Mzero && Szero;
	end
	// buzz only when alarm on and time matches
    if (Alarmon && TDys < 5)
		Buzz = buzz;
	else
		Buzz = 0;		
  end
  
  // buzz off :)	  make the connections
  alarm a1(
	  .tmin(TMin), .amin(AMin), .thrs(THrs), .ahrs(AHrs), .buzz(buzz)
  );
  
endmodule
