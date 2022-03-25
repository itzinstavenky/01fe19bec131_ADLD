`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:46:01 02/17/2022
// Design Name:   MUL_datapath
// Module Name:   C:/PROJECT/multiplier/MUL_test.v
// Project Name:  multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUL_datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module MUL_test;
reg [15:0] data_in;
reg clk,start;
wire done;
MUL_datapath DP(lda,ldb,ldp,clrp,decb,data_in,clk);
controller CON(lda,ldb,ldp,clrp,decb,done,clk,eqz,start);

initial
begin
clk=1'b0;
#3 start=1'b1;
#500 $finish;
end
always #5 clk=~clk;


initial
begin
#17 data_in=17;
#10 data_in=5;
end

initial
begin
$monitor ($time, "%d %b",DP.y,done);
end
endmodule
