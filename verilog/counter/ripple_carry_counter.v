module ripple_carry_counter(q, clk, reset);

	output [3:0] q; 
	input clk, reset; 

	// Four instances of the module T_FF are created. 
	// Each has a unique name. 
	// Each instance is passed a set of signals.	
	// Notice, that each instance is a copy of the module T_FF.

	T_FF tff0(q[0],clk, reset);
	T_FF tff1(q[1],q[0], reset);
	T_FF tff2(q[2],q[1], reset);
	T_FF tff3(q[3],q[2], reset);
endmodule
