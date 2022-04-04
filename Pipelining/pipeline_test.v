module pipeline_test;

	// Inputs
	reg [9:0] a;
	reg [9:0] b;
	reg [9:0] c;
	reg [9:0] d;
	reg clk;
	
	pipelining MYPIPE(f,a,b,c,d,clk);
	initial clk=0 ;
	always #10 clk = ~clk ; 

	// Outputs
	wire [9:0] f;

	
	initial begin
		// Initialize Inputs
		#5  a = 10 ;b = 20 ;c = 12 ;d = 2;
		#20 a = 14 ;b = 15 ;c = 8 ; d = 3;
		#20 a = 18 ;b = 10 ;c = 20; d = 3;
		#20 a = 22 ; b = 8  ;c = 25 ;d = 4;
		#20 a = 23 ;b = 15; c = 40; d = 3;
		#20 a = 30 ; b = 30; c = 5; d = 3;
		
	end
	
	initial
	begin
	$dumpfile ("pipelining.vod");
	$dumpvars (0,pipeline_test);
	$monitor ("time: %d, f = %d", $time, f);
	#300 $finish ;
	
	end 
      
endmodule
