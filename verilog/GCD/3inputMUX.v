module threeinMUX#(parameter W = 16)
(
 input [W-1:0] in0, in1, in2,
 input [1:0] sel,
 output [W-1:0] out
);
//wire [W-1:0] X;
//assign X = ;
assign out = sel[1]? (sel[0]?in2:in1) : (sel[0]?in0:16'bX);
endmodule 
