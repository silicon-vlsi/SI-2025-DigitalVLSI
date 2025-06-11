module LessThan#(parameter W=16)
(
input [W-1:0] in0, in1,
output out
);
assign out = (in0<in1)?1:0;
endmodule 

