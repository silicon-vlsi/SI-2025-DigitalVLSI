module Subtractor#(parameter W=16)
(
input [W-1:0] in0, in1,
output [W-1:0] out
);
assign out = in0-in1;
endmodule 
