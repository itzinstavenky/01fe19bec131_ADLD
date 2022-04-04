module ha_tb();
reg a,b,cin;
wire sum,cout;
fa DUT(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
initial begin
$monitor("a =%b b =%b sum =%b cin =%b cout =%b ",a,b,sum,cin,cout);

a=0;
b=1;
cin=1;
#5
a=1;
b=0;
cin=1;
#5
a=1;
b=1;
cin=1;

end
endmodule
