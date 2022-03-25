`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:22:31 02/17/2022 
// Design Name: 
// Module Name:    MUL_datapath 
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
module MUL_datapath(eqz,lda,ldb,clrp,decb,data_in,clk);
input lda,ldb,clrp,decb,clk;
input [15:0]data_in;
output eqz;
wire [15:0]x,y,z,bout,bus;

PIPO1 A (x,bus,lda,clk);
PIPO2 P (y,z,ldp,clrp,clk);
CNTR B (bout,bus,ldb,decb,clk);
ADD AD (z,x,y);
EQZ COMP (eqz,bout);
endmodule
