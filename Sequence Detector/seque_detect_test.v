`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:03:00 01/25/2022
// Design Name:   seque_detect
// Module Name:   E:/RTL DESIGN/Sequencedetector/seque_detect_test.v
// Project Name:  Sequencedetector
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seque_detect
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seque_detect_test;

	// Inputs
	reg clk;
	reg rst;
	reg in;
	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	seque_detect uut (
		.clk(clk), 
		.rst(rst), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		in = 0;

		#10 rst=0; #20 rst =1;
		#20 in=111011011;
		#40 in=1011011011;
        
		// Add stimulus here

	end
      
endmodule

