module RD_FF(
	     input clk, reset_p,
	     input [1:0] d_p,
	     output reg [1:0] q_np
	     );
always@(posedge clk)
begin
if(reset_p)
q_np=0;
else
q_np=d_p;
end 
endmodule
