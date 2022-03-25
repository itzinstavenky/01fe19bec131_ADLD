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
	reg clock;
	reg reset;
	reg sequence_in;
	// Outputs
	wire detector_out;

	// Instantiate the Unit Under Test (UUT)
	seque_detect uut (
		.clock(clock), 
		.reset(reset), 
		.sequence_in(sequence_in), 
		.detector_out(detector_out)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		sequence_in = 0;

		#10 reset=0; #20 reset =1;
		#20 sequence_in=111011011;
		#40 sequence_in=1011011011;
        
		// Add stimulus here

	end
      
endmodule

