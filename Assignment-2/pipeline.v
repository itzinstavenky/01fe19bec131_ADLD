`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:41:07 03/26/2022 
// Design Name: 
// Module Name:    pipeline 
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
module pipeline(rs1,rs2,rd,func,addr,clk1,clk2,write,Z);
input [3:0] rs1,rs2,rd,func;
input [7:0] addr;
input write,clk1,clk2;
output [15:0] Z;

reg [15:0] p_A,p_B,q_Z,r_Z;
reg [3:0] p_rd,p_func,q_rd;
reg [7:0] p_addr,q_addr,r_addr;

reg [15:0] regbank [0:15];
reg [15:0] mem[0:255];

assign Z=r_Z;

//stage 1

always@(posedge clk1)
begin
	p_A <= #2 regbank[rs1];
	p_B <= #2 regbank[rs2];
	p_rd <= #2 rd;
	p_func <= #2 func;
	p_addr <= #2 addr;
end

//stage 2

always@(negedge clk2)
begin
	case(func)
	0 : q_Z <= #2 p_A + p_B;
	1 : q_Z <= #2 p_A - p_B;
	2 : q_Z <= #2 p_A * p_B;
	3 : q_Z <= #2 p_A & p_B;
	4 : q_Z <= #2 p_A | p_B;
	5 : q_Z <= #2 p_A ^ p_B;
	6 : q_Z <= #2 p_A ;
	8 : q_Z <= #2 p_B;
	default :  q_Z <= #2 16'hxxxx;
	endcase
	
	q_rd <= #2 p_rd;
	q_addr <= #2 p_addr;
end

//stage 3
always@(posedge clk1)
begin
	regbank[q_rd] <= #2 q_Z;
	q_Z <= #2 r_Z;
	q_addr <= #2 q_addr;
end

//stage 4
always@(negedge clk2)
begin 
	mem[r_addr] <= #2 r_Z;
end
	
endmodule
