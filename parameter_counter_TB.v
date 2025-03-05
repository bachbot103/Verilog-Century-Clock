module parameter_counter_TB();

reg enable, clk, reset_n;
wire done;

parameter_coutner #(0,3,2) dut(.enable(enable),.clk(clk),.reset_n(reset_n),.done(done));
always #5 clk = ~clk;

initial begin
	clk = 0;
	reset_n = 0;
	enable = 0;
	#12 reset_n = 1;
	#5 enable = 1;
	#3000;
	$stop;
end
endmodule
