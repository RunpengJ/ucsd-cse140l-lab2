// task which drives five consecutive 7=segment displays
// CSE140L  Lab 2  Part 2 
// $display performs a return / new line feed; $write does not
task display_tb(input[6:0] seg_j, seg_d,
  seg_e, seg_f, seg_g, seg_h, seg_i
  );
   begin
 // segment A (top bar of 7-segment)
      if(seg_j[6]) $write(" _ ");		// day of week 
      else         $write("   ");		//  
      $write("  ");						//  
      if(seg_d[6]) $write(" _ ");		// hour of day
      else         $write("   ");
      $write(" ");
	  if(seg_e[6]) $write(" _ ");		// ones digit of hour
	  else         $write("   ");
	  $write("  ");
	  if(seg_f[6]) $write(" _ ");		// minute 10s digit
	  else         $write("   ");
      $write(" ");
	  if(seg_g[6]) $write(" _ ");	    // minute 1s digit
	  else         $write("   ");
/*	  $write("  ");				        // optional seconds disp
	  if(seg_h[6]) $write(" _ ");		_
	  else         $write("   ");		 
      $write(" ");
	  if(seg_i[6]) $write(" _ ");
	  else         $write("   ");
*/      $display();					    // line feed
 // segments FGB						// top verticals, center
 	  if(seg_j[1]) $write("|");
	  else $write(" ");
	  if(seg_j[0]) $write("_");
	  else $write(" ");
	  if(seg_j[5]) $write("|");
	  else $write(" ");
	  $write("  ");                     // days-hrs double space
	  if(seg_d[1]) $write("|");
	  else $write(" ");
	  if(seg_d[0]) $write("_");
	  else $write(" ");
	  if(seg_d[5]) $write("|");
	  else $write(" ");
	  $write(" ");
	  if(seg_e[1]) $write("|");
	  else $write(" ");
	  if(seg_e[0]) $write("_");
	  else $write(" ");
	  if(seg_e[5]) $write("|");
	  else $write(" ");
	  $write("  ");	                    // hrs-mins double space
	  if(seg_f[1]) $write("|");
	  else $write(" ");
	  if(seg_f[0]) $write("_");
	  else $write(" ");
	  if(seg_f[5]) $write("|");
	  else $write(" ");
	  $write(" ");
	  if(seg_g[1]) $write("|");
	  else $write(" ");
	  if(seg_g[0]) $write("_");
	  else $write(" ");
	  if(seg_g[5]) $write("|");
	  else $write(" ");
	  $display();
  // segments EDC                       // lower sides, bottom     
      if(seg_j[2]) $write("|");
	  else $write(" ");
	  if(seg_j[3]) $write("_");
	  else $write(" ");
	  if(seg_j[4]) $write("|");
	  else $write(" ");
	  $write("  ");
     if(seg_d[2]) $write("|");
	  else $write(" ");
	  if(seg_d[3]) $write("_");
	  else $write(" ");
	  if(seg_d[4]) $write("|");
	  else $write(" ");
	  $write(" ");
      if(seg_e[2]) $write("|");
	  else $write(" ");
	  if(seg_e[3]) $write("_");
	  else $write(" ");
	  if(seg_e[4]) $write("|");
	  else $write(" ");
	  $write("  ");
      if(seg_f[2]) $write("|");
	  else $write(" ");
	  if(seg_f[3]) $write("_");
	  else $write(" ");
	  if(seg_f[4]) $write("|");
	  else $write(" ");
	  $write(" ");
      if(seg_g[2]) $write("|");
	  else $write(" ");
	  if(seg_g[3]) $write("_");
	  else $write(" ");
	  if(seg_g[4]) $write("|");
	  else $write(" ");
	  $display();
	end
endtask