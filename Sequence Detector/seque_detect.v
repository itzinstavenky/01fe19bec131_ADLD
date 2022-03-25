`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:29 01/25/2022 
// Design Name: 
// Module Name:    seque_detect 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seque_detect(clk,rst,in,out);
	 input clk;
    input rst;
    input in;
    output reg out;
	 parameter zero=3'b000,
					one=3'b001,
					two=3'b011,
					three=3'b010,
					four=3'b110;
	reg [2:0] cur_state,next_state;
	
	always @(posedge clk,posedge rst)
	begin
	if(rst==1)
	 cur_state<=zero;
	 else
	 cur_state<=next_state;
	end
	
	always @(cur_state,in)
	begin
	case(cur_state)
	zero:
		begin
		if(in==1)
		next_state<= one;
		else
		next_state<=zero;
		end
	one:
	begin
		if(in==1)
		next_state<= one;
		else
		next_state<=two;
		end
	two:
	begin
		if(in==1)
		next_state<= three;
		else
		next_state<=one;
		end
	three:
	begin
		if(in==1)
		next_state<= four;
		else
		next_state<=two;
		end
	four:
	begin
		if(in==1)
		next_state<= zero;
		else
		next_state<=two;
		end
	default : next_state<=zero;
	endcase
	end
	
	always @(cur_state)
	begin
		case(cur_state)
			zero: out=0;
			one: out=0;
			two: out=0;
			three: out=0;
			four: out=1;
			default:out=0;
		endcase
	end

endmodule
