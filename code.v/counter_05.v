module counter_05(
	input wire enable, clk, reset_n,
	output reg done,
	output wire[6:0] seg
);

reg[3:0] count;
Led7thanh led2(.bcd(count), .seg(seg));
always @(posedge clk, negedge reset_n) begin
	if(!reset_n) begin
		 count <= 0;
	end
	else if(enable) begin
		if(done) count <= 0;
		else count <= count + 1;
	end
	else begin
		count <= count;
	end
end

assign done = (count == 3'd5 && enable);
endmodule
