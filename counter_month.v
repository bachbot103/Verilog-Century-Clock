module counter_month(
	input wire clk, reset_n, cm1,
	output wire[6:0] seg_mon1, seg_mon2,
	output wire cy1, detect_2, detect_30_31
);

reg[3:0] count_unit, count_ten;
Led7thanh seg_mon_unit(.bcd(count_unit),.seg(seg_mon1));
Led7thanh seg_mon_ten(.bcd(count_ten),.seg(seg_mon2));


always @(posedge clk, negedge reset_n) begin
	if(!reset_n) begin
		count_unit <= 4'd1;
		count_ten <= 4'd0;
	end
	else if(cm1) begin
		if(count_unit == 9 && count_ten != 1) begin
			count_unit <= 4'd0;
			count_ten <= count_ten + 1; 
		end
		else if(cy1)begin
			count_unit <= 4'd1;
			count_ten <= 4'd0; 
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

assign cy1 = (count_unit == 2 && count_ten == 1 && cm1);
assign detect_2 = (count_unit == 2 && count_ten == 0);
assign detect_30_31 = ({count_ten,count_unit} == {4'd0,4'd4} || {count_ten,count_unit} == {4'd0,4'd6} || {count_ten,count_unit} == {4'd0,4'd9} || {count_ten,count_unit} == {4'd1,4'd1});

endmodule

