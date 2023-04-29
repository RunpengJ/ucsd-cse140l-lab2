// testbench for lab2 part 2 -- alarm clock
// days, hours, minutes, and seconds
`include "display_tb_file.sv"
module lab2_tb #(parameter NS = 60, NH = 24);
  logic Reset    = 1,
        Clk      = 0,
        Timeset  = 0,
        Alarmset = 0,
		Minadv   = 0,
		Hrsadv   = 0,
        Dayadv   = 0,
		Alarmon  = 1,
		Pulse = 0;

  wire[6:0] S1disp, S0disp,
            M1disp, M0disp,
            H1disp, H0disp, D0disp;
  wire Buzz;

  struct_diag sd(.*);             // our DUT itself
  int h1;
  initial begin
    h1 = $fopen("lab2part2.txt");
    $monitor("buzz = %b  at time %t",Buzz,$time);
	#  2us  Reset    = 0;
	#  1us  Timeset  = 1;
	        Minadv   = 1;
	# 50us  Minadv   = 0;
	        Hrsadv   = 1;
	#  7us  Hrsadv   = 0;
	        Dayadv   = 1;
	#  4us 	Dayadv   = 0;
	        Timeset  = 0;

//	force (.sd.Min = 'h5);
//	release(.sd.Min);
    display_tb (.h1(h1),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp), .Buzz(Buzz));
	#  1us  Alarmset = 1;
            Hrsadv   = 1;
	#  8us  Hrsadv   = 0;
	#  1us  Minadv   = 1;
	# 10us  Minadv   = 0;
	#  1us  Alarmset = 0;
    display_tb (.h1(h1),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp), .Buzz(Buzz));
    for(int i=0; i<220; i++) 
		# 60us  display_tb (.h1(h1),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp),.Buzz(Buzz));
    repeat(24) #3000us;
    for(int i=0; i<220; i++) 
		# 60us  display_tb (.h1(h1),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp),.Buzz(Buzz));
    repeat(24) #3000us;
    for(int i=0; i<220; i++) 
		# 60us  display_tb (.h1(h1),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp),.Buzz(Buzz));
    repeat(24) #3000us;
    for(int i=0; i<220; i++) 
		# 60us  display_tb (.h1(h1),.seg_j(D0disp),.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp),.Buzz(Buzz));
  	#100us  $stop;
  end 
  always begin
    #500ns Pulse = 1;
	#500ns Pulse = 0;
  end

endmodule