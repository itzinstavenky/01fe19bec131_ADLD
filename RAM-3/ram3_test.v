`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:44:03 03/14/2022
// Design Name:   ram_3
// Module Name:   E:/RTL DESIGN/Adreess/ram3_test.v
// Project Name:  Adreess
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram_3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RAM_test;

	reg [9:0] address;
	wire [7:0] data_out;
	reg [7:0] data_in;
	reg read,write,select;
	integer k, myseed;
	ram_3 RAM(data_out,data_in,address,write,select);

	initial 
		begin
		// Initialize Inputs
		for (k=0;k<=1023;k=k+1)
		begin
			data_in = (k+k)%256 ; read=0; write=1; select=1;
			#2 address=k; write=0; select=0;
			$display ("Address: %5d, Data: %4d",address,data_in);
		end
		/*repeat (20)
		begin
			#2 address=$random(myseed) %1024;
			write=0; select=1;
			$display ("Address: %5d, Data: %4d",address,data_in);
			end*/
			end
endmodule
