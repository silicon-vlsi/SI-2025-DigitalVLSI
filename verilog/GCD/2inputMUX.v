module twoinMUX#(parameter W = 16)
(
input [W-1:0]in0, in1, 
input sel,
output[W-1:0] out
);
assign out = sel?in1:in0;
endmodule
