module parameter_coutner(check_END_TIME, check_count ,enable, enable2, clk, reset_n, done, seg, done2, detect_END_TIME);
	parameter START = 0;
	parameter END = 9;
	parameter TIME = 9; //
	input wire enable, clk, reset_n;

	input wire check_END_TIME, enable2; //input of done2
	input wire check_count; // check count of the next blocks
	output wire done, done2, detect_END_TIME; // done2: time-defined detection
	output wire[6:0] seg;

	reg[3:0] count;
	Led7thanh seg1(.bcd(count),.seg(seg));

	always @(posedge clk, negedge reset_n) begin
		if(!reset_n) begin
			count <= START; 
		end
		else if(enable || (done && check_END_TIME)) begin//
			if(done || check_count) begin //
				count <= START;
			end
			else begin
				count <= count + 1;
			end
		end
		else begin
			count <= count;
		end
	end

	assign done2 = ((count == TIME) && enable); //Nhan dien mau
	assign detect_END_TIME = (END != TIME); //

	assign done = (check_END_TIME) ? ((count == END) && enable2) : ((count == END) && enable); //Dem so START to END
endmodule 
