module ED_FF#(parameter W = 16)
( 
 input clk, en_p,
 input [W-1:0] d_p,
 output reg[W-1:0]  q_np
);
 always@(posedge clk)
begin
 if(en_p == 1)
  q_np = d_p;
 else 
  q_np = q_np;
end
endmodule 
