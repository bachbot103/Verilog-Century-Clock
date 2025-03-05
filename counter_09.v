
module counter_09(
	input wire enable, clk, reset_n,
	// output reg[6:0] seg,
	output reg done,
	output wire[6:0] seg
);


reg[3:0] count;
Led7thanh led1(.bcd(count),.seg(seg));
always @(posedge clk, negedge reset_n)
begin
	if(!reset_n) begin
		count <= 4'd0;
	end
	else if(enable) begin
		if (done) begin
			count <= 0;
		end
		else begin
			count <= count + 1;
		end
	end
	else begin
		count <= count;
	end

end


assign done = (count == 4'd9 && enable);
endmodule