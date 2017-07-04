module pc(pc_in, pc_out, rst_n, clk, we);
	input rst_n, clk, we;
	input[11:0] pc_in;
	output[11:0] pc_out;
	reg[11:0] pc_out;

	always @(posedge clk) begin
		if (!rst_n) begin
			pc_out <= 0;
		end else begin
			if (we) begin
				pc_out <= pc_in;
			end else begin
				pc_out <= pc_out + 1;
			end
		end
	end
endmodule
