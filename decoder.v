module decoder(op, zf, pc_in, pc_we, src0, src1, dst, reg_we, sel1, sel2, data, alu_op, mem_we);/*{{{*//*}}}*/
		input wire [43:0] op;
			input wire zf;
			output reg [11:0] pc_in;
			output reg pc_we;
			output reg [3:0] src0, src1, dst;
			output reg reg_we;
			output reg sel1, sel2;
			output reg [27:0] data;
			output reg [7:0] alu_op;
			output reg mem_we;

		`include "def.h"

		always @(*) begin
			case (op[43:36])
			AND : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= op[27:24];
				pc_in <= 0;
				pc_we <= 1;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			OR : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= op[27:24];
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			INC : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= 0;
				src0 <= op[31:28];
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 1;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			STORE : begin
				alu_op <= op[43:36];
				dst <= 0;
				src1 <= op[35:32];
				src0 <= op[31:28];
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 0;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 1;
			end

			SHIFT : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			BS : begin
				alu_op <= op[43:36];
				dst <= 0;
				src1 <= op[35:32];
				src0 <= op[31:28];
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 0;
				sel1 <= 1;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			BS2 : begin
				alu_op <= op[43:36];
				dst <= 0;
				src1 <= op[35:32];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 0;
				sel1 <= 0;
				sel2 <= 0;
				data <= op[31:4];
				mem_we <= 0;
			end

			COMP : begin
				alu_op <= op[43:36];
				dst <= 0;
				src1 <= op[35:32];
				src0 <= op[31:28];
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 0;
				sel1 <= 1;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			CHECK : begin
				alu_op <= op[43:36];
				dst <= 0;
				src1 <= op[35:32];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 0;
				sel1 <= 0;
				sel2 <= 0;
				data <= op[31:4];
				mem_we <= 0;
			end

			WR : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			WL : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			WU : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			WD : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			FINDSTAR : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			FIND1 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			FIND2 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			FIND3 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			FIND4 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			FIND7 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			FIND5 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			UDSTAR : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			LRSTAR : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			UD1 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			LR1 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			UD2 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			LR2 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			UD3 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			LR3 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			UD4 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			LR4 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			UD7 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			LR7 : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			INC : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= 0;
				src0 <= op[31:28];
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 1;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			RIGHT : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			LEFT : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			UP : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			DOWN : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= op[31:28];
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 0;
				sel2 <= 0;
				data <= 0;
				mem_we <= 0;
			end

			JMP : begin
				pc_in <= op[11:0];
				pc_we <= 1;
			end

			JNZ : begin
				pc_in <= op[11:0];
				pc_we <= zf;
			end

			LI : begin
				alu_op <= op[43:36];
				dst <= op[35:32];
				src1 <= 0;
				src0 <= 0;
				pc_in <= 0;
				pc_we <= 0;
				reg_we <= 1;
				sel1 <= 1;
				sel2 <= 0;
				data <= op[31:4];
				mem_we <= 0;
			end

			default : begin
				pc_we <= 0;
			end

			endcase
		end

		endmodule
