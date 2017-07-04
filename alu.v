module alu(in0, in1, op, zf, out);
	input wire [27:0] in0, in1;
	input wire [7:0] op;
	output reg zf;
	output reg [27:0] out;

`include "def.h"

always @(*) begin
	case (op)
	// synopsys parallel_case
	// synopsys full_case

	AND : begin
		out <= in0 & in1;
		zf <= 0;
	end

	OR : begin
		out <= in0 | in1;
		zf <= 0;
	end

	ADD : begin
		out <= in0 + in1;
		zf <= 0;
	end

	STORE : begin
		out <= in0;
		zf <= 0;
	end

	SHIFT : begin
		out <= {in1[26:0], 2'b00};
		zf <= 0;
	end

	BS : begin
		out <= 0;
		zf <= (in0 > in1) ? 1 : 0;
	end

	BS2 : begin
		out <= 0;
		zf <= (in0 < in1) ? 1 : 0;
	end

	INC : begin
		out <= in0 + 1;
		zf <= 0;
	end

	DEC : begin
		out <= in0 - 1;
		zf <= 0;
	end

	COMP : begin
		out <= 0;
		zf <= (in0 == in1) ? 1 : 0;
	end

	CHECK : begin
		out <= 0;
		zf <= (in0 == in1) ? 1 : 0;
	end

	LOAD : begin
		out <= in0;
		zf <= 0;
	end

	LI : begin
		out <= in0;
		zf <= 0;
	end

	JMP : begin
		out <= 0;
		zf <= 0;
	end

	JNZ : begin
		out <= 0;
		zf <= 0;
	end

	WR : begin
		out <= {in1[27:2], 2'b00};
		zf <= 0;
	end

	WL : begin
		out <= {in1[27:2], 2'b01};
		zf <= 0;
	end

	WU : begin
		out <= {in1[27:2], 2'b10};
		zf <= 0;
	end

	WD : begin
		out <= {in1[27:2], 2'b11};
		zf <= 0;
	end

	FIND1 : begin
		out <= {in1[27:24], 24'b0};
		zf <= 0;
	end

	FIND2 : begin
		out <= {in1[23:20], 24'b0};
		zf <= 0;
	end

	FIND3 : begin
		out <= {in1[19:16], 24'b0};
		zf <= 0;
	end

	FIND4 : begin
		out <= {in1[15:12], 24'b0};
		zf <= 0;
	end

	FIND7 : begin
		out <= {in1[11:8], 24'b0};
		zf <= 0;
	end

	FIND5 : begin
		out <= {in1[7:4], 24'b0};
		zf <= 0;
	end

	FINDSTAR : begin
		out <= {in1[3:0], 24'b0};
		zf <= 0;
	end

	UD1 : begin
		out <= {in1[27:26], 26'b0};
		zf <= 0;
	end

	LR1 : begin
		out <= {in1[25:24], 26'b0};
		zf <= 0;
	end

	UD2 : begin
		out <= {in1[23:22], 26'b0};
		zf <= 0;
	end

	LR2 : begin
		out <= {in1[21:20], 26'b0};
		zf <= 0;
	end

	UD3 : begin
		out <= {in1[19:18], 26'b0};
		zf <= 0;
	end

	LR3 : begin
		out <= {in1[17:16], 26'b0};
		zf <= 0;
	end

	UD4 : begin
		out <= {in1[15:14], 26'b0};
		zf <= 0;
	end

	LR4 : begin
		out <= {in1[13:12], 26'b0};
		zf <= 0;
	end

	UD7 : begin
		out <= {in1[11:10], 26'b0};
		zf <= 0;
	end

	LR7 : begin
		out <= {in1[9:8], 26'b0};
		zf <= 0;
	end

	UDSTAR : begin
		out <= {in1[3:2], 26'b0};
		zf <= 0;
	end

	LRSTAR : begin
		out <= {in1[1:0], 26'b0};
		zf <= 0;
	end

	RIGHT : begin
		if (in1[3:0] + 4'b0001 == in1[27:24])
			out <= {in1[3:0], in1[23:4], in1[27:24]};
		else if (in1[3:0] + 4'b0001 == in1[23:20])
			out <= {in1[27:24], in1[3:0], in1[19:4], in1[23:20]};
		else if (in1[3:0] + 4'b0001 == in1[19:16])
			out <= {in1[27:20], in1[3:0], in1[15:4], in1[19:16]};
		else if (in1[3:0] + 4'b0001 == in1[15:12])
			out <= {in1[27:16], in1[3:0], in1[11:4], in1[15:12]};
		else if (in1[3:0] + 4'b0001 == in1[11:8])
			out <= {in1[27:12], in1[3:0], in1[7:4], in1[11:8]};
		else if (in1[3:0] + 4'b0001 == in1[7:4])
			out <= {in1[27:8], in1[3:0], in1[7:4]};
		else
			out <= {in1[27:0] + 28'b0000_0000_0000_0000_0000_0000_0001};
		zf <= 0;
	end

	LEFT : begin
		if (in1[3:0] - 4'b0001 == in1[27:24])
			out <= {in1[3:0], in1[23:4], in1[27:24]};
		else if (in1[3:0] - 4'b0001 == in1[23:20])
			out <= {in1[27:24], in1[3:0], in1[19:4], in1[23:20]};
		else if (in1[3:0] - 4'b0001 == in1[19:16])
			out <= {in1[27:20], in1[3:0], in1[15:4], in1[19:16]};
		else if (in1[3:0] - 4'b0001 == in1[15:12])
			out <= {in1[27:16], in1[3:0], in1[11:4], in1[15:12]};
		else if (in1[3:0] - 4'b0001 == in1[11:8])
			out <= {in1[27:12], in1[3:0], in1[7:4], in1[11:8]};
		else if (in1[3:0] - 4'b0001 == in1[7:4])
			out <= {in1[27:8], in1[3:0], in1[7:4]};
		else
			out <= {in1[27:0] - 28'b0000_0000_0000_0000_0000_0000_0001};
		zf <= 0;
	end

	UP : begin
		if (in1[3:0] - 4'b0100 == in1[27:24])
			out <= {in1[3:0], in1[23:4], in1[27:24]};
		else if (in1[3:0] - 4'b0100 == in1[23:20])
			out <= {in1[27:24], in1[3:0], in1[19:4], in1[23:20]};
		else if (in1[3:0] - 4'b0100 == in1[19:16])
			out <= {in1[27:20], in1[3:0], in1[15:4], in1[19:16]};
		else if (in1[3:0] - 4'b0100 == in1[15:12])
			out <= {in1[27:16], in1[3:0], in1[11:4], in1[15:12]};
		else if (in1[3:0] - 4'b0100 == in1[11:8])
			out <= {in1[27:12], in1[3:0], in1[7:4], in1[11:8]};
		else if (in1[3:0] - 4'b0100 == in1[7:4])
			out <= {in1[27:8], in1[3:0], in1[7:4]};
		else
			out <= {in1[27:0] - 28'b0000_0000_0000_0000_0000_0000_0100};
		zf <= 0;
	end

	DOWN : begin
		if (in1[3:0] + 4'b0100 == in1[27:24])
			out <= {in1[3:0], in1[23:4], in1[27:24]};
		else if (in1[3:0] + 4'b0100 == in1[23:20])
			out <= {in1[27:24], in1[3:0], in1[19:4], in1[23:20]};
		else if (in1[3:0] + 4'b0100 == in1[19:16])
			out <= {in1[27:20], in1[3:0], in1[15:4], in1[19:16]};
		else if (in1[3:0] + 4'b0100 == in1[15:12])
			out <= {in1[27:16], in1[3:0], in1[11:4], in1[15:12]};
		else if (in1[3:0] + 4'b0100 == in1[11:8])
			out <= {in1[27:12], in1[3:0], in1[7:4], in1[11:8]};
		else if (in1[3:0] + 4'b0100 == in1[7:4])
			out <= {in1[27:8], in1[3:0], in1[7:4]};
		else
			out <= {in1[27:0] + 28'b0000_0000_0000_0000_0000_0000_0100};
		zf <= 0;
	end

	default : begin
		out <= 0;
		zf <= 0;
	end

	endcase
end

endmodule
