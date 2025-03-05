module ver2_dong_ho_the_ky(
	input wire cs1, clk, reset_n
	//output wire done
);
wire cs2, cmin1, cmin2, ch1;
wire cd1,cm1,cy1;
wire detect_2, detect_30_31, leap_year;


counter_09 s1(.enable(cs1),.clk(clk),.reset_n(reset_n),.done(cs2),.seg());
counter_05 s2(.enable(cs2),.clk(clk),.reset_n(reset_n),.done(cmin1),.seg());

counter_09 min1(.enable(cmin1),.clk(clk),.reset_n(reset_n),.done(cmin2),.seg());
counter_05 min2(.enable(cmin2),.clk(clk),.reset_n(reset_n),.done(ch1),.seg());


counter_hours hours(.ch1(ch1),.cd1(cd1),.clk(clk),.reset_n(reset_n),.seg_unit(),.seg_ten());


counter_day days(.cd1(cd1),.cm1(cm1),.detect_2(detect_2),.detect_30_31(detect_30_31),.leap_year(leap_year),.clk(clk),.reset_n(reset_n),.seg_d1(),.seg_d2());

counter_month months(.cm1(cm1),.cy1(cy1),.detect_2(detect_2),.detect_30_31(detect_30_31),.clk(clk),.reset_n(reset_n),.seg_mon1(),.seg_mon2());

counter_year years(.cy1(cy1),.leap_year(leap_year),.clk(clk),.reset_n(reset_n),.seg_y1(),.seg_y2(),.seg_y3());
endmodule

/*
module counter_day(
	input wire clk, reset_n, cd1,
	input wire detect_2, detect_30_31, leap_year,
	output wire[6:0] seg_d1, seg_d2,
	output wire cm1
);
module counter_month(
	input wire clk, reset_n, cm1,
	output wire[6:0] seg_mon1, seg_mon2,
	output wire cy1, detect_2, detect_30_31
);
module counter_year(
	input wire clk, reset_n, cy1,
	output wire[6:0] seg_y1, seg_y2, seg_y3,
	output reg leap_year
);
*/