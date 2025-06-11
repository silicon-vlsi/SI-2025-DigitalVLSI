module gcd#( parameter W = 16 ) 
( 
           input      clk, 
	   // Data signals 
	   input  [W-1:0] operands_bits_A,
	   input  [W-1:0] operands_bits_B,    
	   output [W-1:0] result_bits_data, 
	   // Control signals 
	   input input_available, 
	   input reset, 
	   output result_rdy, 
	   input result_taken   
);   
	wire[1:0] A_sel;   
	wire A_en; 
	wire B_sel;
        wire B_en;
        wire B_zero;             
	wire A_lt_B;

	

	gcdDatapath#(16)  datapath (   
	  .clk(clk),
	  .operands_bits_A(operands_bits_A),   
	  .operands_bits_B(operands_bits_B),
	  .result_bits_data(result_bits_data),
	  .A_mux_sel(A_sel),   
	  .B_mux_sel(B_sel),
          .A_en(A_en),
	  .B_en(B_en),
	  .B_zero(B_zero),
	  .A_lt_B(A_lt_B)
        );


	gcdControlUnit control ( 
	   .clk(clk),
           .reset(reset),  
	   .input_available(input_available),
	   .result_rdy(result_rdy),
	   .result_taken(result_taken),
	   .A_mux_sel(A_sel),
	   .B_mux_sel(B_sel),
	   .A_en(A_en),
	   .B_en(B_en),
           .B_zero(B_zero),
	   .A_lt_B(A_lt_B)
	    );
endmodule 



