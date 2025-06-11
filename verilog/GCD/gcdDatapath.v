module gcdDatapath#( parameter W = 16 ) 
( 
	input      clk, 
	// Data signals 
	input  [W-1:0] operands_bits_A, 
	input  [W-1:0] operands_bits_B,    
	output [W-1:0] result_bits_data,   
	// Control signals (ctrl->dpath) 
	input          A_en,
	input          B_en,
	input  [1:0]   A_mux_sel,
	input          B_mux_sel,           
	// Control signals (dpath->ctrl) 
	output         B_zero,             
	output         A_lt_B              
);

	wire [W-1:0] B;
	wire [W-1:0] sub_out; 
	wire [W-1:0] A_mux_out; 
	
	
	threeinMUX#(W) A_mux    
	(  .in0 (operands_bits_A),   
	   .in1 (B),   
	   .in2 (sub_out),   
	   .sel (A_mux_sel),   
	   .out (A_mux_out) ); 

	wire [W-1:0] A; 

	ED_FF#(W) A_ff ( // D flip flop with enable   
   	   .clk  (clk),   
   	   .en_p (A_en),   
   	   .d_p  (A_mux_out),   
           .q_np (A) );


	wire [W-1:0] B_mux_out; 
	
	twoinMUX#(W) B_mux (   
	   .in0 (operands_bits_B),   
	   .in1 (A),   
	   .sel (B_mux_sel),   
	   .out (B_mux_out) ); 

	ED_FF#(W) B_ff (   
  	   .clk  (clk),   
	   .en_p (B_en),   
	   .d_p  (B_mux_out),   
	   .q_np (B) ); 

	twoinEQ#(W) B_EQ_0 ( 
	   .in0(B),
	   .in1((16'b0)),
	   .out(B_zero) ); 

	LessThan#(W) lt ( 
	   .in0(A),
	   .in1(B), 
	   .out(A_lt_B) ); 

	Subtractor#(W) sub (
	   .in0(A),
	   .in1(B),
	   .out(sub_out) );

	assign result_bits_data = A;

endmodule

	
