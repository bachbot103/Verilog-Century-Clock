module counter_hours(
	input wire clk, reset_n, ch1,
	output wire cd1,
	output wire[6:0] seg_unit, seg_ten
);
reg[3:0] count_unit, count_ten;
Led7thanh seg_hour_unit(.bcd(count_unit),.seg(seg_unit));
Led7thanh seg_hour_ten(.bcd(count_ten),.seg(seg_ten));
always @(posedge clk, negedge reset_n) begin
	if(!reset_n) begin
		count_unit <= 4'd0;
		count_ten <= 4'd0;
	end
	else if(ch1)begin
		if((count_unit == 9) && (count_ten != 2)) begin
			count_unit <= 4'd0;
			count_ten <= count_ten + 1;
		end
		else if(cd1) begin
			count_unit <= 4'd0;
			count_ten <= 4'd0;
		end
		else begin
			count_unit <= count_unit + 1;
			count_ten <= count_ten;
		end
	end
end

assign cd1 = ((count_ten == 2) && (count_unit == 3) && ch1);
endmodule
