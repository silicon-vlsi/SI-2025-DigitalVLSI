module gcdControlUnit ( 
   input      clk,  
   input     reset, 
   // Data signals 
   input     input_available,    
   output  reg    result_rdy,    
   input    result_taken,   
   // Control signals (ctrl->dpath) 
   output  reg        A_en,
   output  reg       B_en,              
   output  reg [1:0] A_mux_sel,          
   output  reg        B_mux_sel,           
   // Control signals (dpath->ctrl) 
   input         B_zero,
   input         A_lt_B
);
   // local params are scoped constants 
   localparam WAIT = 2'd0;  
   localparam CALC = 2'd1; 
   localparam DONE = 2'd2; 
  
   reg  [1:0] state_next; 
   wire [1:0] state; 
   
   RD_FF state_ff ( // flip flop with reset 
       .clk (clk),   
       .reset_p (reset),   
       .d_p (state_next),   
       .q_np (state) );	



   reg [5:0] cs; 
   
   always@(*) 
   begin // Default control signals  
     A_mux_sel    = 2'b00;   
     A_en         = 1'b0;   
     B_mux_sel    = 1'bx;   
     B_en         = 1'b0;   
     //input_available = 1'b0;   
     result_rdy   = 1'b0; 
     
     case ( state )
     
  	WAIT : 
	begin
	  A_mux_sel    = 2'b01;         
	  A_en         = 1'b1;         
	  B_mux_sel    = 1'b0;         
	  B_en         = 1'b1;         
	 // input_available = 1'b1; 
	end     
	CALC : 
	if ( A_lt_B )
	   begin  	    
	      A_mux_sel = 2'b10;         
	      A_en      = 1'b1;         
	      B_mux_sel = 1'b1;         
	      B_en      = 1'b1; 
	   end	    
	else if ( !B_zero )
	   begin 	    
	      A_mux_sel = 2'b11;
	      A_en      = 1'b1; 
	   end	   
	DONE : 
	   result_rdy = 1'b1; 
       endcase
   end  

   always @(*) 
   begin 
      // Default is to stay in 
      // the same state   
      state_next = state; 
      case ( state )     
      	WAIT : 
	  if ( input_available )         
      	     state_next = CALC;     
        CALC : if ( B_zero )         
      	     state_next = DONE;     
        DONE : if ( result_taken )         
             state_next = WAIT; 
     endcase
   end  
endmodule	  