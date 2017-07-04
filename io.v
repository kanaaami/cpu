module io(comp, cnt, ord1, ord2, ord3, ord4, ord5, btn, seg, clk, rst_n);
	input comp;
	input [27:0] cnt; //data
	input [27:0] ord1, ord2, ord3, ord4, ord5; //data
	input [4:0] btn;
	output reg [11:0] seg;
	input clk, rst_n;

	reg [4:0] num;
	reg [1:0] digit;
	reg [11:0] buff [3:0];
	reg [11:0] count;
	reg [4:0] btn_flag;

`include "def.h"

	parameter
		SEG_U = 12'b1_1000001, //U
		SEG_P = 12'b1_0001100, //P
		SEG_D = 12'b1_0100001, //d
		SEG_O = 12'b1_0100011, //o
		SEG_L = 12'b1_1000111, //L
		SEG_E = 12'b1_0000110, //E
		SEG_R = 12'b1_0001000, //R
		SEG_I = 12'b1_1111001, //I
		SEG_S = 12'b1_0010010, //S
		SEG_0 = 12'b1_1000000,
		SEG_1 = 12'b1_1111001,
		SEG_2 = 12'b1_0100100,
		SEG_3 = 12'b1_0110000,
		SEG_4 = 12'b1_0011001,
		SEG_5 = 12'b1_0010010,
		SEG_6 = 12'b1_0000010,
		SEG_7 = 12'b1_1011000,
		SEG_8 = 12'b1_0000000,
		SEG_9 = 12'b1_0010000;

	parameter
		UE = 28'b0,
		SHITA = 28'b0,
		HIDARI = 28'b0,
		MIGI = 28'b0;


	always @(posedge clk) begin
		if(!rst_n) begin
			num <= 5'b0;
			digit <= 2'b0;
			seg <= 12'b0000_0_0000000;
			count <= 12'b0;
			btn_flag <= 5'b00000;
		end else begin
			count <= count + 1;
			if(count == 0) begin
				// display 7seg
				seg[11:8] <= ~(4'b1 << digit);
				seg[7:0] <= buff[digit];
				digit <= digit + 1;
				// button up
				if(btn[4] && !btn_flag[4]) begin
					btn_flag[4] <= 1;
					if(num < cnt) num <= num + 1;
				end else if(btn[3] && !btn_flag[3]) begin
					btn_flag[3] <= 1;
					if(num > 0) num <= num - 1;
				end
				// button down
				if(!btn[4]) btn_flag[4] <= 0;
				if(!btn[3]) btn_flag[3] <= 0;
				if(!btn[2]) btn_flag[2] <= 0;
				if(!btn[1]) btn_flag[1] <= 0;
				if(!btn[0]) btn_flag[0] <= 0;
			end
		end
	end

	always @(*) begin
		if(comp) begin
			case ((ord1 & (64'b11 << {num,1'b0})) >> {num,1'b0})
			// synopsys parallel_case
			// synopsys full_case
			UE : begin
				buff[3] = SEG_U;
				buff[2] = SEG_P;
			end
			SHITA : begin
				buff[3] = SEG_D;
				buff[2] = SEG_O;
			end
			HIDARI : begin
				buff[3] = SEG_L;
				buff[2] = SEG_E;
			end
			MIGI : begin
				buff[3] = SEG_R;
				buff[2] = SEG_I;
			end
			endcase
		end else begin
			buff[3] = SEG_S;
			buff[2] = SEG_O;
		end
	end

	always @(*) begin
		if(comp) begin
			case (num)
			// synopsys parallel_case
			// synopsys full_case
			0 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_0;
			end
			1 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_1;
			end
			2 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_2;
			end
			3 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_3;
			end
			4 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_4;
			end
			5 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_5;
			end
			6 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_6;
			end
			7 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_7;
			end
			8 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_8;
			end
			9 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_9;
			end
			10 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_0;
			end
			11 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_1;
			end
			12 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_2;
			end
			13 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_3;
			end
			14 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_4;
			end
			15 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_5;
			end
			16 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_6;
			end
			17 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_7;
			end
			18 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_8;
			end
			19 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_9;
			end
			20 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_0;
			end
			21 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_1;
			end
			22 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_2;
			end
			23 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_3;
			end
			24 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_4;
			end
			25 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_5;
			end
			26 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_6;
			end
			27 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_7;
			end
			28 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_8;
			end
			29 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_9;
			end
			30 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_0;
			end
			31 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_1;
			end
			32 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_2;
			end
			33 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_3;
			end
			34 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_4;
			end
			35 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_5;
			end
			36 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_6;
			end
			37 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_7;
			end
			38 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_8;
			end
			39 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_9;
			end
			40 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_0;
			end
			41 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_1;
			end
			42 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_2;
			end
			43 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_3;
			end
			44 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_4;
			end
			45 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_5;
			end
			46 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_6;
			end
			47 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_7;
			end
			48 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_8;
			end
			49 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_9;
			end
			50 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_0;
			end
			51 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_1;
			end
			52 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_2;
			end
			53 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_3;
			end
			54 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_4;
			end
			55 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_5;
			end
			56 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_6;
			end
			57 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_7;
			end
			58 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_8;
			end
			59 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_9;
			end
			60 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_0;
			end
			61 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_1;
			end
			62 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_2;
			end
			63 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_3;
			end
			64 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_4;
			end
			65 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_5;
			end
			66 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_6;
			end
			67 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_7;
			end
			68 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_8;
			end
			69 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_9;
			end
			70 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_0;
			end
			71 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_1;
			end
			72 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_2;
			end
			73 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_3;
			end
			74 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_4;
			end
			75 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_5;
			end
			76 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_6;
			end
			77 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_7;
			end
			78 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_8;
			end
			79 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_9;
			end
			80 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_0;
			end
			81 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_1;
			end
			82 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_2;
			end
			83 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_3;
			end
			84 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_4;
			end
			85 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_5;
			end
			86 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_6;
			end
			87 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_7;
			end
			88 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_8;
			end
			89 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_9;
			end
			90 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_0;
			end
			91 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_1;
			end
			92 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_2;
			end
			93 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_3;
			end
			94 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_4;
			end
			95 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_5;
			end
			96 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_6;
			end
			97 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_7;
			end
			98 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_8;
			end
			99 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_9;
			end
			endcase
		end else begin
			case (cnt)
			// synopsys parallel_case
			// synopsys full_case
			0 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_0;
			end
			1 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_1;
			end
			2 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_2;
			end
			3 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_3;
			end
			4 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_4;
			end
			5 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_5;
			end
			6 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_6;
			end
			7 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_7;
			end
			8 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_8;
			end
			9 : begin
				buff[1] = SEG_0;
				buff[0] = SEG_9;
			end
			10 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_0;
			end
			11 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_1;
			end
			12 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_2;
			end
			13 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_3;
			end
			14 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_4;
			end
			15 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_5;
			end
			16 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_6;
			end
			17 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_7;
			end
			18 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_8;
			end
			19 : begin
				buff[1] = SEG_1;
				buff[0] = SEG_9;
			end
			20 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_0;
			end
			21 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_1;
			end
			22 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_2;
			end
			23 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_3;
			end
			24 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_4;
			end
			25 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_5;
			end
			26 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_6;
			end
			27 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_7;
			end
			28 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_8;
			end
			29 : begin
				buff[1] = SEG_2;
				buff[0] = SEG_9;
			end
			30 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_0;
			end
			31 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_1;
			end
			32 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_2;
			end
			33 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_3;
			end
			34 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_4;
			end
			35 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_5;
			end
			36 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_6;
			end
			37 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_7;
			end
			38 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_8;
			end
			39 : begin
				buff[1] = SEG_3;
				buff[0] = SEG_9;
			end
			40 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_0;
			end
			41 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_1;
			end
			42 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_2;
			end
			43 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_3;
			end
			44 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_4;
			end
			45 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_5;
			end
			46 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_6;
			end
			47 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_7;
			end
			48 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_8;
			end
			49 : begin
				buff[1] = SEG_4;
				buff[0] = SEG_9;
			end
			50 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_0;
			end
			51 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_1;
			end
			52 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_2;
			end
			53 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_3;
			end
			54 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_4;
			end
			55 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_5;
			end
			56 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_6;
			end
			57 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_7;
			end
			58 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_8;
			end
			59 : begin
				buff[1] = SEG_5;
				buff[0] = SEG_9;
			end
			60 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_0;
			end
			61 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_1;
			end
			62 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_2;
			end
			63 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_3;
			end
			64 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_4;
			end
			65 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_5;
			end
			66 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_6;
			end
			67 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_7;
			end
			68 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_8;
			end
			69 : begin
				buff[1] = SEG_6;
				buff[0] = SEG_9;
			end
			70 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_0;
			end
			71 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_1;
			end
			72 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_2;
			end
			73 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_3;
			end
			74 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_4;
			end
			75 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_5;
			end
			76 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_6;
			end
			77 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_7;
			end
			78 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_8;
			end
			79 : begin
				buff[1] = SEG_7;
				buff[0] = SEG_9;
			end
			80 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_0;
			end
			81 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_1;
			end
			82 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_2;
			end
			83 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_3;
			end
			84 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_4;
			end
			85 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_5;
			end
			86 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_6;
			end
			87 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_7;
			end
			88 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_8;
			end
			89 : begin
				buff[1] = SEG_8;
				buff[0] = SEG_9;
			end
			90 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_0;
			end
			91 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_1;
			end
			92 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_2;
			end
			93 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_3;
			end
			94 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_4;
			end
			95 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_5;
			end
			96 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_6;
			end
			97 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_7;
			end
			98 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_8;
			end
			99 : begin
				buff[1] = SEG_9;
				buff[0] = SEG_9;
			end
			endcase
		end
	end
endmodule
