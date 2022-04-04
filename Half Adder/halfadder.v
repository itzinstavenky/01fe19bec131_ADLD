module SUB(subout,in1,in2);
input [15:0] in1,in2;
output [15:0] subout;

always @(*)

out<=in1-in2;

endmodule
