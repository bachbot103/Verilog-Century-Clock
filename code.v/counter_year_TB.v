`timescale 1s/1ms
module counter_year_TB();

reg clk, reset_n, cy1;
wire leap_year;
counter_year uut(.clk(clk),.reset_n(reset_n),.cy1(cy1),.seg_y1(),.seg_y2(),.seg_y3(),.leap_year(leap_year));
always #5 clk = ~clk;


initial begin
	clk = 0;
	reset_n = 0;
	cy1 = 0;
	#20 reset_n = 1;
	#20 cy1 = 1;
	#30000
	$stop;
end
endmodule

