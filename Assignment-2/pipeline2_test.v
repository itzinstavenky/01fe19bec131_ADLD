`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:05:05 03/26/2022
// Design Name:   pipeline
// Module Name:   E:/RTL DESIGN/Ass-2/pipeline2_test.v
// Project Name:  Ass-2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipe2_test;
wire [15:0] Z;
reg [3:0] rs1,rs2,rd,func;
reg [7:0] addr;
reg clk1,clk2;
integer k;

pipeline MYPIPE ( rs1,rs2,rd,func,addr,clk1,clk2,write,Z );
initial 
	begin 
	clk1=0;
	clk2=0;
	 repeat(20)
	 begin
		#5 clk1 = 1;
		#5 clk1 = 0;
		#5 clk2 = 1;
		#5 clk2 = 0;
	end
	end
	
initial 
for(k=0;k<16;k=k+1)
	MYPIPE.regbank[k] = k;


initial 
	begin
		#5 rs1=3; rs2=5; rd=10; func=0; addr=125; //ADD
		#20 rs1=10; rs2=5; rd=12; func=1; addr=126; //SUB
		#20 rs1=3; rs2=5; rd=13; func=2; addr=127; //MUL
		#20 rs1=3; rs2=5; rd=14; func=0; addr=128; //ADD
		#20 rs1=5; rs2=3; rd=15; func=4; addr=129; //SUB
		#20 rs1=7; rs2=3; rd=16; func=6; addr=130; //SELA
  
  #60 for(k=125;k<131;k=k+1)
  $display("Mem[%3d] = %3d", k, MYPIPE.mem[k]);
  end
  
endmodule
  