module register(src0, src1, dst, we, data, clk, rst_n, data0, data1, cnt, comp, ord1, ord2, ord3, ord4, ord5);
	input wire clk, rst_n;
	input wire [3:0] src0, src1;
	input wire [3:0] dst;
	input wire we;
	input wire [27:0] data;
	output wire [27:0] data0, data1, cnt, ord1, ord2, ord3, ord4, ord5;
	output wire comp;
	wire [27:0] answer, counter;

	reg [27:0] regis [15:0];

always @(posedge clk) begin
	if (!rst_n) begin
	//initial state
		regis[0] <= 28'b1010_1101_1110_1011_0101_0110_0111;
	//ideal state
		regis[1] <= 28'b0101_0110_0111_1001_1101_1010_1111;
	//PLACE
		regis[2] <= 0;
	//UPDOWN STAR
		regis[3] <= 0;
	//LEFTRIGHT STAR
		regis[4] <= 0;
	//UPDOWN NUMBER
		regis[5] <= 0;
	//LEFTRIGHT NUMBER
		regis[6] <= 0;
	//counter
		regis[7] <= 0;
	//store
		regis[8] <= 0;//0bannme
	//comp
		regis[9] <= 0;
	//ord
		regis[10] <= 0;
		regis[11] <= 0;
		regis[12] <= 0;
		regis[13] <= 0;
		regis[14] <= 0;
	//ignore
		regis[15] <= 0;
	end else begin
		if (we) begin
			regis[dst] <= data;
		end else begin
			regis[dst] <= regis[dst];
		end
	end
end

assign data0 = regis[src0];
assign data1 = regis[src1];
assign cnt = regis[7];
assign ord1 = regis[10];
assign ord2 = regis[11];
assign ord3 = regis[12];
assign ord4 = regis[13];
assign ord5 = regis[14];
assign answer = regis[0];
assign counter = regis[7];

endmodule
