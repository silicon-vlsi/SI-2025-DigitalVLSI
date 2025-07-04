module gcdGCDUnit_behav#( parameter W = 16 ) (
	input [W-1:0] inA, inB,
	output reg [W-1:0] out);
	
	reg [W-1:0] A, B, swap;
	integer done;

	always @(*)
	begin
		done = 0;
		A = inA; 
		B = inB;
		
		while (!done)
		begin
			if ( A < B )
			begin			
				swap = A;
				A = B;
				B = swap;
			end	
			else if ( B!=0 )
				A=A-B;
			else
				done = 1;
			end
				out = A;
		end
endmodule
