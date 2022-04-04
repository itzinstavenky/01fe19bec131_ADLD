module fa(sum,cout,a,b,cin);
input wire a,b,cin;
output wire sum,cout;

assign sum = a^b^cin;
assign cout = (a&b)| (b&cin)|(cin&a);

endmodule
