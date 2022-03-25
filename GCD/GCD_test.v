`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:04:56 02/16/2022
// Design Name:   gcd_datapath
// Module Name:   C:/PROJECT/gcd/GCD_test.v
// Project Name:  gcd
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gcd_datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
    
module GCD_test;

	// Inputs
	
	reg [15:0] data_in;
	reg clk, start;
   wire done ;
	
	reg [15:0] a,b;
	gcd_datapath DP (gt,lt,eq,lda,ldb,sel1,sel2,sel_in,data_in,clk);
	controller_gcd CON (lda,ldb,sel1,sel2,sel_in,done,clk,lt,gt,eq,start);

	initial
	begin
		// Initialize Inputs
		clk = 1 'b0;
		#3 start = 1'b1;
		#1000 $finish;

		

	end
	 
	always #5 clk = ~clk;
	initial
	begin
	#12 data_in <= 12;
	#10 data_in <= 24;
	end  
	
	initial 
	 begin
	   $monitor ($time, "%d %b", DP.aout, done);
		$dumpfile ("gcd.vcd") ; 
		$dumpvars (0, GCD_test);
		end    
endmodule

