// converts binary into two-digit BCD
// converts BCD into 7-segment drives
module lcd_int(
  input[6:0] bin_in,
  output logic [6:0] Segment1,
                     Segment0);

  logic[6:0] bin0,    // least significant decimal digit
             bin1;	  // most significant decimal digit
  assign bin0 = bin_in % 10;  // mod10   
  assign bin1 = bin_in/10;	  // floor of bin_in / 10
  
// mapping to LED/LCD 7-segment display
/*
                 A			horizontals = A, G, D
			  F     B	     _
				 G		    \_\
			  E     C	    \_\
				 D
*/			   
  always_comb case(bin0) 	// bit sequence: ABCDEFG
    4'b0000 : Segment0 = 7'h7E;	  // 0 lights up all segments except center
    4'b0001 : Segment0 = 7'h30;   // 1 lights up right side (B, C)
    4'b0010 : Segment0 = 7'h6D;
    4'b0011 : Segment0 = 7'h79;
    4'b0100 : Segment0 = 7'h33;          
    4'b0101 : Segment0 = 7'h5B;
    4'b0110 : Segment0 = 7'h5F;
    4'b0111 : Segment0 = 7'h70;	  // 7 lights up top and right side (A, B, C)
    4'b1000 : Segment0 = 7'h7F;	  // 8 lights up all 7 segments
    4'b1001 : Segment0 = 7'h7B;
	default : Segment0 = 7'h00;
  endcase
    always_comb case(bin1) 
    4'b0000 : Segment1 = 7'h7E;
    4'b0001 : Segment1 = 7'h30;
    4'b0010 : Segment1 = 7'h6D;
    4'b0011 : Segment1 = 7'h79;
    4'b0100 : Segment1 = 7'h33;          
    4'b0101 : Segment1 = 7'h5B;
    4'b0110 : Segment1 = 7'h5F;
    4'b0111 : Segment1 = 7'h70;
    4'b1000 : Segment1 = 7'h7F;
    4'b1001 : Segment1 = 7'h7B;
	default : Segment1 = 7'h00;
  endcase

endmodule

