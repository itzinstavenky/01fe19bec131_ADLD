`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:54:59 02/14/2022 
// Design Name: 
// Module Name:    COMPARE 
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
module COMPARE(lt,gt,eq,data1,data2);

input [15:0] data1,data2 ;
output lt,gt,eq;

assign lt = data1<data2;
assign gt = data2>data1;
assign eq = data1==data2;


endmodule
