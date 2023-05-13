// CSE140L  
// What does this do? 
// When does "z" go high? 
module ct_mod_N #(parameter N=60)(
  input clk, rst, 
        en,			 // enable update   
  output logic[6:0] ct_out,
  output logic      z);

  always_ff @(posedge clk)	 begin :clk_loop
    if(rst)	begin :reset_loop
	  ct_out <= 0;
	end			  :reset_loop
	else if(en)	begin
//      if(ct_out == N-1) ct_out <= 0;
//	  else ct_out <= ct_out + 1;
	  ct_out <= (ct_out+1)%N;	  // modulo operator
    end
  end	  :clk_loop
//    else
//   	  ct_out <= ct_out;  // hold; don't enable	 
//  assign   z = !ct_out;
  always_comb begin z = ct_out==(N-1); end  // always @(*)   // always @(ct_out)

endmodule



/*
 always_ff @(posedge clk)
    if(rst)
	  ct_out <= 0;
	else if(en)
	  ct_out <= ct_out_next;
//    else
//	  ct_out <= ct_out;

	  
  always_comb	  
	 ct_out = (ct_out+1)%N;	



  always_ff @(posedge clk)
    if(rst)
	  ct_out <= 'd0;
	else
	  ct_out <= ct_out_next;


  always_comb	  
	 ct_out_next = en? (ct_out+1)%N : ct_out;	



  month counter    count_N   mod 12   0, 1, 2, ..., 11
						 mon0 + 1 = month
                                      1, 2, 3, ..., 12

*/