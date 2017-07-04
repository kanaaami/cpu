module memory(clk, rst_n, in, addr, we, out);
	input wire clk, rst_n;
	input wire [27:0] in;
	input wire [27:0] addr;
	input wire we;
	output wire [27:0] out;

	reg [7:0] mem [255:0];
	wire [7:0] mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10, mem11, mem12, mem13, mem14, mem15, mem16, mem17, mem18, mem19, mem20;
	integer i;

always @(posedge clk) begin
	if (!rst_n) begin
		for(i = 0; i < 256; i = i + 1)
			mem[i] <= 0;
	end else begin
		if (we) begin
			mem[addr] <= in;
		end else begin
			mem[addr] <= mem[addr];
		end
	end
end

assign out = mem[addr[7:0]];
assign mem0 = mem[0];
assign mem1 = mem[1];
assign mem2 = mem[2];
assign mem3 = mem[3];
assign mem4 = mem[4];
assign mem5 = mem[5];
assign mem6 = mem[6];
assign mem7 = mem[7];
assign mem8 = mem[8];
assign mem9 = mem[9];
assign mem10 = mem[10];
assign mem11 = mem[11];
assign mem12 = mem[12];
assign mem13 = mem[13];
assign mem14 = mem[14];
assign mem15 = mem[15];
assign mem16 = mem[16];
assign mem17 = mem[17];
assign mem18 = mem[18];
assign mem19 = mem[19];
assign mem20 = mem[20];

endmodule
