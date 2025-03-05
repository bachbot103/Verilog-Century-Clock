module counter_year(
	input wire clk, reset_n, cy1,
	output wire[6:0] seg_y1, seg_y2, seg_y3,
	output reg leap_year
);

reg[3:0] count_y_unit, count_y_ten, count_y_hun;


Led7thanh seg_year_unit(.bcd(count_y_unit),.seg(seg_y1));
Led7thanh seg_year_ten(.bcd(count_y_ten),.seg(seg_y2));
Led7thanh seg_year_hun(.bcd(count_y_hun),.seg(seg_y3));

wire[11:0] current_year = 2000 + count_y_unit + count_y_ten*10 + count_y_hun*100;

always @(posedge clk, negedge reset_n) begin
	if(!reset_n) begin
		count_y_unit <= 4'd0;
		count_y_ten <= 4'd0;
		count_y_hun <= 4'd0;
	end
	else if(cy1) begin
		if(count_y_unit == 9) begin 
			count_y_unit <= 4'd0;
			if(count_y_ten == 9) begin
				count_y_ten <= 4'd0;
				if(count_y_hun == 9) begin
					count_y_hun <= 4'd0;
				end
				else begin
					count_y_hun <= count_y_hun + 1;
				end
			end
			else begin
				count_y_ten <= count_y_ten + 1;
			end
		end
		else begin
			count_y_unit <= count_y_unit + 1;
		end
	end
	else begin
		count_y_unit <= count_y_unit;
		count_y_ten <= count_y_ten;
		count_y_hun <= count_y_hun;
	end
end

reg[9:0] previous_mock;
wire[9:0] current_count = count_y_unit + count_y_ten*10 + count_y_hun*100;
wire[9:0] check_gap = current_count - previous_mock;
always @(posedge clk, negedge reset_n) begin
	if(!reset_n) begin
		previous_mock <= 10'd0;
	end
	else if ((check_gap == 4) && (cy1)) begin
		previous_mock <= current_count;
	end
	else if (previous_mock == 996 && current_count == 999) begin
		previous_mock <= 10'd0;
	end
	else begin
		previous_mock <= previous_mock;
	end
end

always @(*) begin
	if(current_count == 0) begin
		leap_year = 1;
	end
	else if(check_gap == 4) begin
		if (count_y_ten == 0 && count_y_unit == 0) begin
			if((current_count == 400) || (current_count == 800)) begin
				leap_year = 1;
			end
			else begin
				leap_year = 0;
			end
		end
		else begin
			leap_year = 1;
		end
	end
	else begin
		leap_year = 0;
	end
end

endmodule
