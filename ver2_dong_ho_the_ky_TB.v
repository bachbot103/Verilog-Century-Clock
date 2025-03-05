`timescale 1s/1ms
module ver2_dong_ho_the_ky_TB();

reg cs1, clk, reset_n;

ver2_dong_ho_the_ky dut(.cs1(cs1),.clk(clk),.reset_n(reset_n));
always #5 clk = ~clk;

initial begin
	clk = 0;
	reset_n = 0;
	cs1 = 0;
	#12 reset_n = 1;
	#5 cs1 = 1;
	#40000000;
	$stop;
end
endmodule
