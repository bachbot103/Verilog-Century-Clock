module counter_09_TB();

reg clk, reset_n, enable;
wire done;
wire[6:0] seg;

counter_09 dut(.clk(clk), .reset_n(reset_n), .enable(enable), .done(done),.seg(seg));
always #5 clk = ~clk;
initial begin
	clk = 0;
	reset_n = 0;
	enable = 0;
$display("Test 1: apply reset");
	#5 enable = 1;
	#10 reset_n = 1;
	#10 reset_n = 0;
	#10 reset_n = 1;
$display("Test 2: anable counter");
	enable = 1;
	#120 enable = 0;
	$stop;

	
end
endmodule
