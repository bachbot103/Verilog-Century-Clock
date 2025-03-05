module Led7thanh(
	input wire[3:0] bcd,
	output reg[6:0] seg
);

always@(bcd)
begin 
	case(bcd)
		//seg abc_defg (common anode-Vcc)
		0 : seg = 7'b000_0001;
                1 : seg = 7'b100_1111;
                2 : seg = 7'b001_0010;
                3 : seg = 7'b000_0110;
                4 : seg = 7'b100_1100;
                5 : seg = 7'b010_0100;
                6 : seg = 7'b010_0000;
                7 : seg = 7'b000_1111;
                8 : seg = 7'b000_0000;
                9 : seg = 7'b000_0100;
		default: seg = 7'h111_1111;
	endcase
end
//Truth table -> Boolean function (Dataflow/Gate-level)
 
endmodule 
