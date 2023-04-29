// task which drives six consecutive 7=segment displays
// $fdisplay performs a return / new line feed; $fwrite does not
// writes to file named "list.txt"
task display_tb(input int h1, input[6:0] seg_j, seg_d,
  seg_e, seg_f, seg_g, seg_h, seg_i, Buzz
  );
//   int h1;
//   begin
//    h1=$fopen("list.txt");	   // 		'b00001
//	h2=$fopen("list2.txt");    //       'b00010
//  h3=$fopen("list3.txt");    //       'b00100
// segment A
      if(seg_j[6]) $fwrite(h1," _ ");	
      else         $fwrite(h1,"   ");
                   $fwrite(h1,"  ");
// 10s of hrs
      if(seg_d[6]) $fwrite(h1," _ ");
      else         $fwrite(h1,"   ");
                   $fwrite(h1," ");
// 1s of hrs
	  if(seg_e[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
	               $fwrite(h1,"  ");
// 10s of mins
	  if(seg_f[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
                   $fwrite(h1," ");
// 1s of mins
	  if(seg_g[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
	               $fwrite(h1,"  ");
// 10s of sec
	  if(seg_h[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
                   $fwrite(h1," ");
// 1s of sec
	  if(seg_i[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
                   $fdisplay(h1,"");	   

// segments FGB
      if(seg_j[1]) $fwrite(h1,"|");    // day
      else         $fwrite(h1," ");
      if(seg_j[0]) $fwrite(h1,"_");    
      else         $fwrite(h1," ");
      if(seg_j[5]) $fwrite(h1,"|");
      else         $fwrite(h1," ");
                   $fwrite(h1,"  "); 
// 10s of hours
      if(seg_d[1]) $fwrite(h1,"|");    
	  else         $fwrite(h1," ");
	  if(seg_d[0]) $fwrite(h1,"_");    
	  else         $fwrite(h1," ");
      if(seg_d[5]) $fwrite(h1,"|");    
	  else         $fwrite(h1," ");
	               $fwrite(h1," ");
// 1s of hours
	  if(seg_e[1]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_e[0]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_e[5]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	               $fwrite(h1,"  ");
// 10s of mins
	  if(seg_f[1]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_f[0]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_f[5]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	               $fwrite(h1," ");
// 1s of mins
	  if(seg_g[1]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_g[0]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_g[5]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	               $fwrite(h1,"  ");
// 10s of secs
	  if(seg_h[1]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_h[0]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_h[5]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	               $fwrite(h1," ");
// 1s of secs
	  if(seg_i[1]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_i[0]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_i[5]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  $fdisplay(h1,"");

// segments EDC
      if(seg_j[2]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_j[3]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_j[4]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
                   $fwrite(h1,"  ");
// 10s of hours
      if(seg_d[2]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_d[3]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_d[4]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
                   $fwrite(h1," ");
// 1s of hrs
      if(seg_e[2]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_e[3]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_e[4]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
                   $fwrite(h1,"  ");
// 10s of mins
      if(seg_f[2]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_f[3]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_f[4]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	               $fwrite(h1," ");
// 1s of mins
      if(seg_g[2]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_g[3]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_g[4]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	               $fwrite(h1,"  ");
// 10s of sec
      if(seg_h[2]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_h[3]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_h[4]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	               $fwrite(h1," ");
// 1s of sec
      if(seg_i[2]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(seg_i[3]) $fwrite(h1,"_");
	  else         $fwrite(h1," ");
	  if(seg_i[4]) $fwrite(h1,"|");
	  else         $fwrite(h1," ");
	  if(Buzz)     $fdisplay(h1,"   BUZZ!!!");

	  $fdisplay(h1,"");
endtask