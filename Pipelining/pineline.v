module pipelining(f,a,b,c,d,clk);
parameter N = 10 ;
input [N-1:0] a,b,c,d;
input clk;
output [N-1:0] f;
reg [N-1:0] L12_X1,L12_X2,L12_D,L23_X3,L23_D,L34_F;

assign L34_F= f;

always @(posedge clk)
begin
L12_X1= #4 a+b ;
L12_X2= #4 c-d ;
L12_D= d ;
end 

always @(posedge clk)
begin
L23_X3= #4 L12_X1 + L12_X2;
L23_D= L12_D;
end

always @(posedge clk)

L34_F <= #6 L23_X3 * L23_D ;


endmodule
