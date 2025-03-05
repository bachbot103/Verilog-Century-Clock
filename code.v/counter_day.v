module counter_day(
	input wire clk, reset_n, cd1,
	input wire detect_2, detect_30_31, leap_year,
	output wire[6:0] seg_d1, seg_d2,
	output wire cm1
);

reg[3:0] count_unit, count_ten;
Led7thanh seg_day_unit(.bcd(count_unit),.seg(seg_d1));
Led7thanh seg_day_ten(.bcd(count_ten),.seg(seg_d2));

always @(posedge clk, negedge reset_n) begin
	if(!reset_n) begin
		count_unit <= 4'd1; 
		count_ten <= 4'd0;
	end
	else if(cd1) begin
		if(cm1) begin
			count_unit <= 4'd1;
			count_ten <= 4'd0;
		end 
		else if(count_unit == 9) begin
			count_unit <= 4'd0;
			count_ten <= count_ten + 1;
		end
		else begin
			count_unit <= count_unit + 1;
			count_ten <= count_ten;
		end
		
	end
	else begin 
		count_unit <= count_unit;
		count_ten <= count_ten;
	end
end

assign cm1 = (count_ten == 2 && count_unit == 9 && detect_2 && cd1 && leap_year) ||
	     (count_ten == 2 && count_unit == 8 && detect_2 && cd1 && !leap_year) ||
	     (count_ten == 3 && count_unit == 0 && detect_30_31 && cd1) ||
	     (count_ten == 3 && count_unit == 1 && !detect_30_31 && cd1);
endmodule
