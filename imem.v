module imem(pc, op);
	input wire [11:0] pc;
	output reg [43:0] op;

`include "def.h"

parameter [11:0]
	MOVE_1 = 0,
	ORD2_1 = 24,
	ORD3_1 = 30,
	ORD4_1 = 36,
	ORD5_1 = 43,
	MOVE_1_UD_LR = 46,
	ORD2_2 = 57,
	ORD3_2 = 63,
	ORD4_2 = 69,
	ORD5_2 = 76,
	MOVE_1_UD_LR_R = 79,
	ORD2_3 = 86,
	ORD3_3 = 92,
	ORD4_3 = 98,
	ORD5_3 = 104,
	MOVE_1_UD_LR_1_D = 108,
	ORD2_4 = 115,
	ORD3_4 = 121,
	ORD4_4 = 127,
	ORD5_4 = 133,
	MOVE_1_UD_UD_LR = 137,
	ORD2_5 = 149,
	ORD3_5 = 155,
	ORD4_5 = 161,
	ORD5_5 = 167,
	MOVE_1_UD_UD_LR_D = 170,
	ORD2_6 = 177,
	ORD3_6 = 183,
	ORD4_6 = 189,
	ORD5_6 = 195,
	MOVE_1_UD_UD_LR_LR_R = 199,
	ORD2_7 = 206,
	ORD3_7 = 212,
	ORD4_7 = 218,
	ORD5_7 = 224,
	MOVE_1_UD_UD_LR_1 = 228,
	ORD2_8 = 237,
	ORD3_8 = 243,
	ORD4_8 = 249,
	ORD5_8 = 255,
	MOVE_1_UD_UD_LR_1_R = 259,
	ORD2_9 = 266,
	ORD3_9 = 272,
	ORD4_9 = 278,
	ORD5_9 = 284,
	MOVE_1_UD_UD_LR_LR_U = 288,
	ORD2_10 = 295,
	ORD3_10 = 301,
	ORD4_10 = 307,
	ORD5_10 = 313,
	MOVE_1_UD_UD_LR_LR_1_S = 318,
	ORD2_11 = 327,
	ORD3_11 = 333,
	ORD4_11 = 339,
	ORD5_11 = 345,
	MOVE_1_UD_UD_LR_LR_1_S_U = 349,
	ORD2_12 = 356,
	ORD3_12 = 362,
	ORD4_12 = 368,
	ORD5_12 = 374,

	CHECK_23_2 = 378,
	CHECK_23_3 = 382,
	CHECK_2 = 386,
	CHECK_32 = 389,
	CHECK_32_3 = 390,
	CHECK_32_3_S = 395,
	CHECK_32_S = 400,
	CHECK_32_S_S_R = 412,
	ORD2_13 = 419,
	ORD3_13 = 425,
	ORD4_13 = 431,
	ORD5_13 = 437,
	CHECK_32_S_S_S_L = 441,
	ORD2_14 = 448,
	ORD3_14 = 454,
	ORD4_14 = 460,
	ORD5_14 = 466,
	CHECK_32_S_S_S_S_R = 470,
	ORD2_15 = 477,
	ORD3_15 = 483,
	ORD4_15 = 489,
	ORD5_15 = 495,
	CHECK_32_S_S_S_S_S_L = 499,
	ORD2_16 = 506,
	ORD3_16 = 512,
	ORD4_16 = 518,
	ORD5_16 = 524,
	CHECK_32_S_S_S_S_S_U = 527,
	ORD2_17 = 534,
	ORD3_17 = 540,
	ORD4_17 = 546,
	ORD5_17 = 552,
	CHECK_32_S_U = 555,
	ORD2_18 = 562,
	ORD3_18 = 568,
	ORD4_18 = 574,
	ORD5_18 = 580,
	CHECK_32_3_S_R = 583,
	ORD2_19 = 590,
	ORD3_19 = 596,
	ORD4_19 = 602,
	ORD5_19 = 608,
	CHECK_32_3_S_R_D = 611,
	ORD2_20 = 618,
	ORD3_20 = 624,
	ORD4_20 = 630,
	ORD5_20 = 636,
	CHECK_32_3_S_R_D_L = 639,
	ORD2_21 = 646,
	ORD3_21 = 652,
	ORD4_21 = 658,
	ORD5_21 = 664,
	CHECK_32_3_S_R_D_L_D = 667,
	ORD2_22 = 674,
	ORD3_22 = 680,
	ORD4_22 = 686,
	ORD5_22 = 692,

	MOVE_2 = 695,
	ORD2_23 = 717,
	ORD3_23 = 723,
	ORD4_23 = 729,
	ORD5_23 = 735,
	MOVE_2_UD_LR = 739,
	ORD2_24 = 748,
	ORD3_24 = 754,
	ORD4_24 = 760,
	ORD5_24 = 766,
	MOVE_2_UD_LR_S = 770,
	ORD2_25 = 780,
	ORD3_25 = 786,
	ORD4_25 = 792,
	ORD5_25 = 798,
	MOVE_2_UD_LR_S_D = 802,
	ORD2_26 = 809,
	ORD3_26 = 815,
	ORD4_26 = 821,
	ORD5_26 = 827,
	MOVE_2_UD_UD_LR = 831,
	ORD2_27 = 842,
	ORD3_27 = 848,
	ORD4_27 = 854,
	ORD5_27 = 860,
	MOVE_2_UD_UD_LR_D = 864,
	ORD2_28 = 871,
	ORD3_28 = 877,
	ORD4_28 = 883,
	ORD5_28 = 889,
	MOVE_2_UD_UD_LR_LR_R = 893,
	ORD2_29 = 900,
	ORD3_29 = 906,
	ORD4_29 = 912,
	ORD5_29 = 918,
	MOVE_2_UD_UD_LR_2 = 922,
	ORD2_30 = 931,
	ORD3_30 = 937,
	ORD4_30 = 943,
	ORD5_30 = 949,
	MOVE_2_UD_UD_LR_2_L = 953,
	ORD2_31 = 960,
	ORD3_31 = 966,
	ORD4_31 = 972,
	ORD5_31 = 978,
	MOVE_2_UD_UD_LR_LR_2 = 982,
	ORD2_32 = 991,
	ORD3_32 = 997,
	ORD4_32 = 1003,
	ORD5_32 = 1009,
	MOVE_2_UD_UD_LR_LR_2_R = 1013,
	ORD2_33 = 1020,
	ORD3_33 = 1026,
	ORD4_33 = 1032,
	ORD5_33 = 1038,

	MOVE_3 = 1042,
	MOVE_3_U = 1057,
	ORD2_34 = 1064,
	ORD3_34 = 1070,
	ORD4_34 = 1076,
	ORD5_34 = 1082,
	MOVE_3_UD_LR = 1086,
	MOVE_3_L = 1088,
	ORD2_35 = 1095,
	ORD3_35 = 1101,
	ORD4_35 = 1107,
	ORD5_35 = 1113,
	MOVE_3_UD_LR_3 = 1117,
	MOVE_3_UD_UD_LR = 1120,
	MOVE_3_D = 1124,
	ORD2_36 = 1131,
	ORD3_36 = 1137,
	ORD4_36 = 1143,
	ORD5_36 = 1149,
	MOVE_3_UD_UD_LR_LR_3 = 1153,
	MOVE_3_R = 1155,
	ORD2_37 = 1162,
	ORD3_37 = 1168,
	ORD4_37 = 1174,
	ORD5_37 = 1180,
	MOVE_3_UD_UD_LR_LR_3_S = 1184,

	MOVE_23 = 1188,
	MOVE_23_S_S_S_R = 1220,
	ORD2_38 = 1207,
	ORD3_38 = 1213,
	ORD4_38 = 1219,
	ORD5_38 = 1225,
	MOVE_23_S_S_S_S_R = 1229,
	ORD2_39 = 1236,
	ORD3_39 = 1242,
	ORD4_39 = 1248,
	ORD5_39 = 1254,
	MOVE_23_S_S_S_S_S_L = 1258,
	ORD2_40 = 1265,
	ORD3_40 = 1271,
	ORD4_40 = 1277,
	ORD5_40 = 1283,
	MOVE_23_S_S_S_S_S_U = 1286,
	ORD2_41 = 1293,
	ORD3_41 = 1299,
	ORD4_41 = 1305,
	ORD5_41 = 1311,
	MOVE_23_S_S_U = 1314,
	ORD2_42 = 1321,
	ORD3_42 = 1327,
	ORD4_42 = 1333,
	ORD5_42 = 1339,
	MOVE_23_S_R = 1342,
	ORD2_43 = 1349,
	ORD3_43 = 1355,
	ORD4_43 = 1361,
	ORD5_43 = 1367,
	MOVE_23_S_R_D = 1370,
	ORD2_44 = 1377,
	ORD3_44 = 1383,
	ORD4_44 = 1389,
	ORD5_44 = 1395,

	CHECK_47_4 = 1398,
	CHECK_47_7 = 1402,
	CHECK_4 = 1406,
	CHECK_74 = 1409,
	CHECK_74_7_S = 1415,
	CHECK_74_S = 1420,
	ORD2_45 = 1434,
	ORD3_45 = 1440,
	ORD4_45 = 1446,
	ORD5_45 = 1452,
	CHECK_74_S_S_S_U = 1455,
	ORD2_46 = 1462,
	ORD3_46 = 1468,
	ORD4_46 = 1474,
	ORD5_46 = 1480,
	CHECK_74_S_S_L = 1484,
	ORD2_47 = 1491,
	ORD3_47 = 1497,
	ORD4_47 = 1503,
	ORD5_47 = 1509,
	CHECK_74_S_L = 1512,
	ORD2_48 = 1519,
	ORD3_48 = 1525,
	ORD4_48 = 1531,
	ORD5_48 = 1537,
	CHECK_74_7_S_D = 1540,
	ORD2_49 = 1547,
	ORD3_49 = 1553,
	ORD4_49 = 1559,
	ORD5_49 = 1565,
	CHECK_74_7_S_D_R = 1568,
	ORD2_50 = 1575,
	ORD3_50 = 1581,
	ORD4_50 = 1587,
	ORD5_50 = 1593,
	CHECK_74_7_S_D_R_U = 1596,
	ORD2_51 = 1603,
	ORD3_51 = 1609,
	ORD4_51 = 1615,
	ORD5_51 = 1621,
	CHECK_74_7_S_D_R_U_R = 1624,
	ORD2_52 = 1631,
	ORD3_52 = 1637,
	ORD4_52 = 1643,
	ORD5_52 = 1649,

	MOVE_4 = 1652,
	MOVE_4_L = 1667,
	ORD2_53 = 1674,
	ORD3_53 = 1680,
	ORD4_53 = 1686,
	ORD5_53 = 1692,
	MOVE_4_UD_LR = 1696,
	MOVE_4_D = 1700,
	ORD2_54 = 1707,
	ORD3_54 = 1713,
	ORD4_54 = 1719,
	ORD5_54 = 1725,
	MOVE_4_R = 1729,
	ORD2_55 = 1736,
	ORD3_55 = 1742,
	ORD4_55 = 1748,
	ORD5_55 = 1756,
	MOVE_4_U = 1758,
	ORD2_56 = 1765,
	ORD3_56 = 1771,
	ORD4_56 = 1777,
	ORD5_56 = 1783,
	MOVE_4_UD_UD_LR = 1787,

	MOVE_7 = 1792,
	MOVE_7_L = 1807,
	ORD2_57 = 1814,
	ORD3_57 = 1820,
	ORD4_57 = 1826,
	ORD5_57 = 1832,
	MOVE_7_UD_LR = 1836,
	MOVE_7_D = 1838,
	ORD2_58 = 1845,
	ORD3_58 = 1851,
	ORD4_58 = 1857,
	ORD5_58 = 1863,
	MOVE_7_UD_UD_LR = 1867,
	MOVE_7_R = 1872,
	ORD2_59 = 1879,
	ORD3_59 = 1885,
	ORD4_59 = 1891,
	ORD5_59 = 1897,
	MOVE_7_U = 1901,
	ORD2_60 = 1908,
	ORD3_60 = 1914,
	ORD4_60 = 1920,
	ORD5_60 = 1926,

	MOVE_47 = 1930,
	ORD2_61 = 1944,
	ORD3_61 = 1950,
	ORD4_61 = 1956,
	ORD5_61 = 1962,
	MOVE_47_L = 1965,
	ORD2_62 = 1972,
	ORD3_62 = 1978,
	ORD4_62 = 1984,
	ORD5_62 = 1990,
	MOVE_47_L_L = 1993,
	ORD2_63 = 2000,
	ORD3_63 = 2006,
	ORD4_63 = 2012,
	ORD5_63 = 2018,
	MOVE_47_L_L_D = 2021,
	ORD2_64 = 2028,
	ORD3_64 = 2034,
	ORD4_64 = 2040,
	ORD5_64 = 2046,
	MOVE_47_L_L_D_R = 2049,
	ORD2_65 = 2056,
	ORD3_65 = 2062,
	ORD4_65 = 2068,
	ORD5_65 = 2074,
	MOVE_47_L_L_D_R_R = 2077,
	ORD2_66 = 2084,
	ORD3_66 = 2090,
	ORD4_66 = 2096,
	ORD5_66 = 2102,

	MOVE_S = 2106,
		ORD2_67 = 2120,
		ORD3_67 = 2126,
		ORD4_67 = 2132,
		ORD5_67 = 2138,
	MOVE_S_R = 2141,
		ORD2_68 = 2148,
		ORD3_68 = 2154,
		ORD4_68 = 2160,
		ORD5_68 = 2166,
	MOVE_S_D = 2170,
		ORD2_69 = 2177,
		ORD3_69 = 2183,
		ORD4_69 = 2189,
		ORD5_69 = 2195,
	MOVE_5S = 2198,
		ORD2_70 = 2208,
		ORD3_70 = 2214,
		ORD4_70 = 2220,
		ORD5_70 = 2226,
	MOVE_5S_U = 2229,
		ORD2_71 = 2236,
		ORD3_71 = 2242,
		ORD4_71 = 2248,
		ORD5_71 = 2254,
	MOVE_5S_R = 2257,
		ORD2_72 = 2264,
		ORD3_72 = 2270,
		ORD4_72 = 2276,
		ORD5_72 = 2282,
	MOVE_5S_D = 2285,
		ORD2_73 = 2292,
		ORD3_73 = 2298,
		ORD4_73 = 2304,
		ORD5_73 = 2310,
	FINISH = 2314,
	LOOP = 2316;

always @(pc) begin
	case (pc)

	0 : begin
		op[43:36] <= FIND1;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0101;
		op[27:0] <= 28'b0;
	end

	2 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_23_2;
	end

	3 : begin
		op[43:36] <= UDSTAR;
		op[35:32] <= 3;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	4 : begin
		op[43:36] <= LRSTAR;
		op[35:32] <= 4;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	5 : begin
		op[43:36] <= UD1;
		op[35:32] <= 5;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	6 : begin
		op[43:36] <= LR1;
		op[35:32] <= 6;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	7 : begin
		op[43:36] <= COMP;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	8 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_LR;
	end

	9 : begin
		op[43:36] <= BS;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	10 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_UD_LR;
	end

	11 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	12 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_UD_LR_1;
	end

	13 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	14 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_UD_LR_LR_U;
	end

	15 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1001;
		op[27:0] <= 28'b0;
	end

	16 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_UD_LR_LR_1_S;
	end

	17 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	18 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	19 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_1;
	end

	20 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	21 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	22 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	23 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_1
	24 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	25 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_1;
	end

	26 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	27 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	28 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	29 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_1
	30 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	31 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_1;
	end

	32 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	33 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	34 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	35 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_1
	36 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	37 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_1;
	end

	38 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	39 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	40 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	41 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_1
	42 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	43 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	44 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	45 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_LR
	46 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	47 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_LR_R;
	end

	48 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	49 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_LR_1_D;
	end

	50 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	51 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	52 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_2;
	end

	53 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	54 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	55 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	56 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_2
	57 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	58 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_3;
	end

	59 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	60 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	61 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	62 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_2
	63 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	64 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_2;
	end

	65 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	66 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	67 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	68 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_2
	69 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	70 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_2;
	end

	71 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	72 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	73 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	74 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_2
	75 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	76 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	77 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	78 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_LR_R
	79 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	80 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	81 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_3;
	end

	82 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	83 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	84 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	85 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_3
	86 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	87 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_3;
	end

	88 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	89 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	90 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	91 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_3
	92 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	93 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_3;
	end

	94 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	95 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	96 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	97 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_3
	98 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	99 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_3;
	end

	100 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	101 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	102 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	103 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_3
	104 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	105 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	106 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	107 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_LR_1_D
	108 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	109 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	110 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_4;
	end

	111 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	112 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	113 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	114 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_4
	115 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	116 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_4;
	end

	117 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	118 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	119 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	120 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_4
	121 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	122 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_4;
	end

	123 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	124 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	125 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	126 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_4
	127 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	128 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_4;
	end

	129 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	130 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	131 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	132 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_4
	133 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	134 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	135 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	136 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_UD_LR
	137 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	138 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_UD_LR_D;
	end

	139 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	140 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_UD_LR_LR_R;
	end

	141 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	142 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	143 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_5;
	end

	144 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	145 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	146 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	147 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_5
	148 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	149 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_5;
	end

	150 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	151 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	152 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	153 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_5
	154 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	155 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_5;
	end

	156 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	157 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	158 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	159 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_5
	160 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	161 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_5;
	end

	162 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	163 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	164 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	165 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_5
	166 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	167 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	168 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	169 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_UD_LR_D
	170 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	171 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	172 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_6;
	end

	173 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	174 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	175 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	176 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_6
	177 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	178 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_6;
	end

	179 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	180 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	181 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	182 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_6
	183 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	184 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_6;
	end

	185 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	186 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	187 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	188 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_6
	189 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	190 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_6;
	end

	191 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	192 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	193 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	194 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_6
	195 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	196 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	197 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	198 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_UD_LR_LR_R
	199 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	200 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	201 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_7;
	end

	202 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	203 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	204 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	205 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_7
	206 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	207 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_7;
	end

	208 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	209 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	210 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	211 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_7
	212 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	213 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_7;
	end

	214 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	215 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	216 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	217 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_7
	218 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	219 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_7;
	end

	220 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	221 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	222 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	223 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_7
	224 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	225 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	226 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	227 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_UD_LR_1
	228 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1001;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	229 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_UD_LR_1_R;
	end

	230 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	231 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	232 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_8;
	end

	233 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	234 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	235 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	236 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_8
	237 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	238 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_8;
	end

	239 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	240 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	241 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	242 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_8
	243 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	244 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_8;
	end

	245 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	246 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	247 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	248 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_8
	249 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	250 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_8;
	end

	251 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	252 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	253 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	254 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_8
	255 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	256 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	257 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	258 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_UD_LR_1_R
	259 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	260 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	261 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_9;
	end

	262 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	263 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	264 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	265 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_9
	266 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	267 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_9;
	end

	268 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	269 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	270 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	271 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_9
	272 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	273 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_9;
	end

	274 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	275 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	276 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	277 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_9
	278 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	279 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_9;
	end

	280 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	281 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	282 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	283 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_9
	284 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	285 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	286 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	287 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_UD_LR_LR_U
	288 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	289 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	290 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_10;
	end

	291 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	292 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	293 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	294 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_10
	295 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	296 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_10;
	end

	297 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	298 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	299 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	300 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_10
	301 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	302 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_10;
	end

	303 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	304 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	305 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	306 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_10
	307 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	308 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_10;
	end

	309 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	310 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	311 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	312 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_10
	313 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	314 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	315 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	316 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_UD_LR_LR_1
	317 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	318 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	319 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1_UD_UD_LR_LR_1_S_U;
	end

	320 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	321 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	322 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_11;
	end

	323 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	324 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	325 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	326 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_11
	327 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	328 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_11;
	end

	329 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	330 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	331 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	332 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_11
	333 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	334 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_11;
	end

	335 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	336 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	337 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	338 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_11
	339 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	340 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_11;
	end

	341 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	342 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	343 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	344 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_11
	345 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	346 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	347 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	348 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//MOVE_1_UD_UD_LR_LR_1_S_U
	349 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	350 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	351 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_12;
	end

	352 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	353 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	354 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	355 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD2_12
	356 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	357 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_12;
	end

	358 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	359 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	360 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	361 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD3_12
	362 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	363 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_12;
	end

	364 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	365 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	366 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	367 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD4_12
	368 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	369 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_12;
	end

	370 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	371 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	372 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	373 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//ORD5_12
	374 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	375 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	376 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	377 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_1;
	end

//CHECK_23_2
	378 : begin
		op[43:36] <= FIND2;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	379 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	380 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_23_3;
	end

	381 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_2;
	end

//CHECK_23_3
	382 : begin
		op[43:36] <= FIND3;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	383 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0111;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	384 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_47_4;
	end

	385 : begin
		op[43:36] <= FIND2;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

//CHECK_2
	386 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0111;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	387 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32;
	end

	388 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//CHECK_32
	389 : begin
		op[43:36] <= FIND3;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	390 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	391 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S;
	end

	392 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	393 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S;
	end

	394 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//CHECK_32_3_S
	395 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	396 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	397 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R;
	end

	398 : begin
		op[43:36] <= FIND3;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	399 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//CHECK_32_S
	400 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	401 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	402 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

	403 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1001;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	404 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_R;
	end

	405 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1011;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	406 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_L;
	end

	407 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1101;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	408 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_R;
	end

	409 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1111;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	410 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_L;
	end

	411 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//CHECK_32_S_S_R
	412 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	413 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	414 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_13;
	end

	415 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	416 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	417 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	418 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD2_13
	419 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	420 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_13;
	end

	421 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	422 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	423 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	424 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD3_13
	425 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	426 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_13;
	end

	427 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	428 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	429 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	430 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD4_13
	431 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	432 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_13;
	end

	433 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	434 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	435 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	436 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD5_13
	437 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	438 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	439 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	440 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//CHECK_32_S_S_S_L
	441 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	442 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	443 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_14;
	end

	444 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	445 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	446 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	447 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD2_14
	448 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	449 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_14;
	end

	450 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	451 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	452 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	453 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD3_14
	454 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	455 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_14;
	end

	456 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	457 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	458 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	459 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD4_14
	460 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	461 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_14;
	end

	462 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	463 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	464 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	465 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD5_14
	466 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	467 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	468 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	469 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//CHECK_32_S_S_S_S_R
	470 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	471 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	472 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_15;
	end

	473 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	474 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	475 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	476 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//ORD2_15
	477 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	478 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_15;
	end

	479 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	480 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	481 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	482 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//ORD3_15
	483 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	484 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_15;
	end

	485 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	486 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	487 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	488 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//ORD4_15
	489 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	490 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_15;
	end

	491 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	492 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	493 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	494 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//ORD5_15
	495 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	496 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	497 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	498 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//CHECK_32_S_S_S_S_S_L
	499 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	500 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	501 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_16;
	end

	502 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	503 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	504 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	505 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//ORD2_16
	506 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	507 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_16;
	end

	508 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	509 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	510 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	511 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//ORD3_16
	512 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	513 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_16;
	end

	514 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	515 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	516 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	517 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//ORD4_16
	518 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	519 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_16;
	end

	520 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	521 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	522 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	523 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_S_S_S_S_U;
	end

//ORD5_16
	524 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	525 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	526 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_32_S_S_S_S_S_U
	527 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	528 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	529 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_17;
	end

	530 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	531 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	532 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	533 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD2_17
	534 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	535 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_17;
	end

	536 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	537 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	538 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	539 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD3_17
	540 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	541 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_17;
	end

	542 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	543 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	544 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	545 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD4_17
	546 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	547 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_17;
	end

	548 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	549 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	550 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	551 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_S_U;
	end

//ORD5_17
	552 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	553 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	554 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_32_S_U
	555 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	556 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	557 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_18;
	end

	558 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	559 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	560 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	561 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R;
	end

//ORD2_18
	562 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	563 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_18;
	end

	564 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	565 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	566 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	567 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R;
	end

//ORD3_18
	568 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	569 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_18;
	end

	570 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	571 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	572 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	573 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R;
	end

//ORD4_18
	574 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	575 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_18;
	end

	576 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	577 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	578 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	579 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R;
	end

//ORD5_18
	580 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	581 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	582 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_32_3_S_R
	583 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	584 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	585 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_19;
	end

	586 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	587 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	588 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	589 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D;
	end

//ORD2_19
	590 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	591 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_19;
	end

	592 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	593 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	594 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	595 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D;
	end

//ORD3_19
	596 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	597 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_19;
	end

	598 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	599 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	600 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	601 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D;
	end

//ORD4_19
	602 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	603 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_19;
	end

	604 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	605 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	606 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	607 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D;
	end

//ORD5_19
	608 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	609 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	610 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_32_3_S_R_D
	611 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	612 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	613 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_20;
	end

	614 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	615 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	616 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	617 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D_L;
	end

//ORD2_20
	618 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	619 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_20;
	end

	620 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	621 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	622 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	623 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D_L;
	end

//ORD3_20
	624 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	625 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_20;
	end

	626 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	627 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	628 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	629 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D_L;
	end

//ORD4_20
	630 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	631 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_20;
	end

	632 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	633 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	634 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	635 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D_L;
	end

//ORD5_20
	636 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	637 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	638 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end


//CHECK_32_3_S_R_D_L
	639 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	640 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	641 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_21;
	end

	642 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	643 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	644 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	645 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D_L_D;
	end

//ORD2_21
	646 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	647 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_21;
	end

	648 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	649 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	650 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	651 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D_L_D;
	end

//ORD3_21
	652 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	653 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_21;
	end

	654 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	655 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	656 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	657 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D_L_D;
	end

//ORD4_21
	658 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	659 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_21;
	end

	660 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	661 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	662 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	663 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32_3_S_R_D_L_D;
	end

//ORD5_21
	664 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	665 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	666 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end


//CHECK_32_3_S_R_D_L_D
	667 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	668 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	669 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_22;
	end

	670 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	671 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	672 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	673 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_22
	674 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	675 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_22;
	end

	676 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	677 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	678 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	679 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_22
	680 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	681 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_22;
	end

	682 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	683 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	684 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	685 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_22
	686 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	687 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_22;
	end

	688 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	689 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	690 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	691 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_22
	692 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	693 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	694 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end


//MOVE_2
	695 : begin
		op[43:36] <= FIND2;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	696 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0111;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	697 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_32;
	end

	698 : begin
		op[43:36] <= UDSTAR;
		op[35:32] <= 3;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	699 : begin
		op[43:36] <= LRSTAR;
		op[35:32] <= 4;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	700 : begin
		op[43:36] <= UD2;
		op[35:32] <= 5;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	701 : begin
		op[43:36] <= LR2;
		op[35:32] <= 6;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	702 : begin
		op[43:36] <= COMP;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	703 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_LR;
	end

	704 : begin
		op[43:36] <= BS;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	705 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_UD_LR;
	end

	706 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	707 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_UD_LR_2;
	end

	708 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	709 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_UD_LR_LR_2;
	end

	710 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	711 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	712 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_23;
	end

	713 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	714 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	715 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	716 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_23
	717 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	718 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_23;
	end

	719 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	720 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	721 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	722 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_23
	723 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	724 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_23;
	end

	725 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	726 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	727 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	728 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_23
	729 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	730 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_23;
	end

	731 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	732 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	733 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	734 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_23
	735 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	736 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	737 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	738 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE_2_UD_LR
	739 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	740 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_LR_S;
	end

	741 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	742 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	743 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_24;
	end

	744 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	745 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	746 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	747 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_24
	748 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	749 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_24;
	end

	750 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	751 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	752 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	753 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_24
	754 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	755 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_24;
	end

	756 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	757 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	758 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	759 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_24
	760 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	761 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_24;
	end

	762 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	763 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	764 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	765 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_24
	766 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	767 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	768 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	769 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE_2_UD_LR_S
	770 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	771 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1001;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	772 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_LR_S_D;
	end

	773 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	774 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	775 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_25;
	end

	776 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	777 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	778 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	779 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_25
	780 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	781 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_25;
	end

	782 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	783 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	784 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	785 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_25
	786 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	787 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_25;
	end

	788 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	789 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	790 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	791 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_25
	792 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	793 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_25;
	end

	794 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	795 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	796 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	797 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_25
	798 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	799 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	800 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	801 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE_2_UD_LR_S_D
	802 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	803 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	804 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_26;
	end

	805 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	806 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	807 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	808 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_26
	809 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	810 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_26;
	end

	811 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	812 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	813 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	814 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_26
	815 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	816 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_26;
	end

	817 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	818 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	819 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	820 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_26
	821 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	822 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_26;
	end

	823 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	824 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	825 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	826 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_26
	827 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	828 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	829 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	830 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE_2_UD_UD_LR
	831 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	832 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_UD_LR_D;
	end

	833 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	834 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_UD_LR_LR_R;
	end

	835 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	836 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	837 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_27;
	end

	838 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	839 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	840 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	841 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_27
	842 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	843 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_27;
	end

	844 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	845 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	846 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	847 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_27
	848 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	849 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_27;
	end

	850 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	851 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	852 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	853 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_27
	854 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	855 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_27;
	end

	856 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	857 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	858 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	859 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_27
	860 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	861 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	862 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	863 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE_2_UD_UD_LR_D
	864 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	865 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	866 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_28;
	end

	867 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	868 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	869 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	870 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_28
	871 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	872 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_28;
	end

	873 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	874 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	875 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	876 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_28
	877 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	878 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_28;
	end

	879 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	880 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	881 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	882 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_28
	883 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	884 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_28;
	end

	885 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	886 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	887 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	888 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_28
	889 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	890 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	891 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	892 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE2_UD_UD_LR_LR_R
	893 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	894 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	895 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_29;
	end

	896 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	897 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	898 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	899 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_29
	900 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	901 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_29;
	end

	902 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	903 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	904 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	905 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_29
	906 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	907 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_29;
	end

	908 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	909 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	910 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	911 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_29
	912 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	913 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_29;
	end

	914 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	915 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	916 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	917 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_29
	918 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	919 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	920 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	921 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE2_UD_UD_LR_2
	922 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1011;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	923 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_UD_LR_2_L;
	end

	924 : begin
		op[42:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	925 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	926 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_30;
	end

	927 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	928 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	929 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	930 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_30
	931 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	932 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_30;
	end

	933 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	934 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	935 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	936 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_30
	937 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	938 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_30;
	end

	939 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	940 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	941 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	942 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_30
	943 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	944 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_30;
	end

	945 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	946 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	947 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	948 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_30
	949 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	950 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	951 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	952 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE_2_UD_UD_LR_2_L
	953 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	954 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	955 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_31;
	end

	956 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	957 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	958 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	959 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_31
	960 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	961 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_31;
	end

	962 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	963 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	964 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	965 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_31
	966 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	967 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_31;
	end

	968 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	969 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	970 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	971 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_31
	972 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	973 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_31;
	end

	974 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	975 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	976 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	977 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_31
	978 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	979 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	980 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	981 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE_UD_UD_LR_LR_2
	982 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	983 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2_UD_UD_LR_LR_2_R;
	end

	984 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	985 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	986 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_32;
	end

	987 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	988 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	989 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	990 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_32
	991 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	992 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_32;
	end

	993 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	994 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	995 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	996 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_32
	997 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	998 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_23;
	end

	999 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1000 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1001 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1002 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_32
	1003 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1004 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_32;
	end

	1005 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1006 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1007 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1008 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_32
	1009 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1010 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1011 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1012 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE_UD_UD_LR_LR_2_R
	1013 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1014 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1015 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_33;
	end

	1016 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1017 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1018 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1019 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD2_33
	1020 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1021 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_33;
	end

	1022 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1023 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1024 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1025 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD3_33
	1026 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1027 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_33;
	end

	1028 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1029 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1030 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1031 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD4_33
	1032 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1033 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_33;
	end

	1034 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1035 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1036 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1037 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//ORD5_33
	1038 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1039 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1040 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1041 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_2;
	end

//MOVE_3
	1042 : begin
		op[43:36] <= FIND3;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1043 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1011;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1044 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23;
	end

	1045 : begin
		op[43:36] <= UDSTAR;
		op[35:32] <= 3;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1046 : begin
		op[43:36] <= LRSTAR;
		op[35:32] <= 4;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1047 : begin
		op[43:36] <= UD3;
		op[35:32] <= 5;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1048 : begin
		op[43:36] <= LR3;
		op[35:32] <= 6;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1049 : begin
		op[43:36] <= COMP;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	1050 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_UD_LR;
	end

	1051 : begin
		op[43:36] <= BS;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	1052 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_UD_UD_LR;
	end

	1053 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1054 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_R;
	end

	1055 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1056 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_R;
	end

//MOVE_3_U
	1057 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1058 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1059 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_34;
	end

	1060 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1061 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1062 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1063 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD2_34
	1064 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1065 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_34;
	end

	1066 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1067 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1068 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1069 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD3_34
	1070 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1071 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_34;
	end

	1072 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1073 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1074 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1075 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD4_34
	1076 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1077 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_34;
	end

	1078 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1079 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1080 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1081 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD5_34
	1082 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1083 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1084 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1085 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//MOVE_3_UD_LR
	1086 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1087 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_UD_LR_3;
	end

	1088 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1089 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1090 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_35;
	end

	1091 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1092 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1093 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1094 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD2_35
	1095 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1096 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_35;
	end

	1097 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1098 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1099 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1100 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD3_35
	1101 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1102 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_35;
	end

	1103 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1104 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1105 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1106 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD4_35
	1107 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1108 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_35;
	end

	1109 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1110 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1111 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1112 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD5_35
	1113 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1114 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1115 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1116 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//MOVE_3_UD_LR_3
	1117 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1118 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_D;
	end

	1119 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_U;
	end

//MOVE_3_UD_UD_LR
	1120 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1121 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_D;
	end

	1122 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1123 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_UD_UD_LR_LR_3;
	end

//MOVE_3_D
	1124 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1125 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1126 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_36;
	end

	1127 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1128 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1129 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1130 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD2_36
	1131 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1132 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_36;
	end

	1133 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1134 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1135 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1136 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD3_36
	1137 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1138 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_36;
	end

	1139 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1140 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1141 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1142 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD4_36
	1143 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1144 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_36;
	end

	1145 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1146 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1147 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1148 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD5_36
	1149 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1150 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1151 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1152 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//MOVE_3_UD_UD_LR_LR_3;
	1153 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1111;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1154 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_UD_UD_LR_LR_3_S;
	end

	1155 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1156 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1157 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_37;
	end

	1158 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1159 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1160 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1161 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD2_37
	1162 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1163 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_37;
	end

	1164 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1165 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1166 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1167 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD3_37
	1168 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1169 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_37;
	end

	1170 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1171 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1172 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1173 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD4_37
	1174 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1175 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_37;
	end

	1176 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1177 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1178 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1179 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//ORD5_37
	1180 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1181 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1182 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1183 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3;
	end

//MOVE_3_UD_UD_LR_LR_3_S
	1184 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1185 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1186 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_D;
	end

	1187 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_3_R;
	end

//MOVE_23
	1188 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1189 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b0110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1190 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_R;
	end

	1191 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1192 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

	1193 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1001;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1194 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_R;
	end

	1195 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1101;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1196 : begin
		op[43:36] <= JNZ;
		op[35:8] <= 28'b0;
		op[7:0] <= MOVE_23_S_S_S_S_R;
	end

	1197 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1111;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1198 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_L;
	end

	1199 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//MOVE_23_S_S_S_S_R
	1200 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1201 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1202 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_38;
	end

	1203 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1204 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1205 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1206 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

//ORD2_38
	1207 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1208 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_38;
	end

	1209 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1210 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1211 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1212 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

//ORD3_38
	1213 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1214 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_38;
	end

	1215 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1216 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1217 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1218 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

//ORD4_38
	1219 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1220 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_38;
	end

	1221 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1222 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1223 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1224 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

//ORD5_38
	1225 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1226 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1227 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1228 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

//MOVE_23_S_S_S_S_R
	1229 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1230 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1231 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_39;
	end

	1232 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1233 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1234 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1235 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//ORD2_39
	1236 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1237 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_39;
	end

	1238 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1239 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1240 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1241 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//ORD3_39
	1242 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1243 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_39;
	end

	1244 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1245 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1246 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1247 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//ORD4_39
	1248 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1249 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_39;
	end

	1250 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1251 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1252 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1253 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//ORD5_39
	1254 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1255 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1256 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1257 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//MOVE_23_S_S_S_S_S_L
	1258 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1259 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1260 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_40;
	end

	1261 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1262 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1263 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1264 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//ORD2_40
	1265 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1266 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_40;
	end

	1267 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1268 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1269 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1270 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//ORD3_40
	1271 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1272 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_40;
	end

	1273 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1274 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1275 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1276 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//ORD4_40
	1277 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1278 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_40;
	end

	1279 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1280 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1281 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1282 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_S_S_S_U;
	end

//ORD5_40
	1283 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1284 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1285 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_23_S_S_S_S_S_U
	1286 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1287 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1288 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_41;
	end

	1289 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1290 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1291 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1292 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

//ORD2_41
	1293 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1294 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_41;
	end

	1295 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1296 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1297 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1298 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

//ORD3_41
	1299 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1300 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_41;
	end

	1301 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1302 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1303 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1304 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

//ORD4_41
	1305 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1306 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_41;
	end

	1307 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1308 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1309 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1310 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_S_U;
	end

//ORD5_41
	1311 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1312 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1313 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_23_S_S_U
	1314 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1315 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1316 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_42;
	end

	1317 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1318 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1319 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1320 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_R;
	end

//ORD2_42
	1321 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1322 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_42;
	end

	1323 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1324 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1325 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1326 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_R;
	end

//ORD3_42
	1327 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1328 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_42;
	end

	1329 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1330 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1331 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1332 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_R;
	end

//ORD4_42
	1333 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1334 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_42;
	end

	1335 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1336 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1337 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1338 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_R;
	end

//ORD5_42
	1339 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1340 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1341 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_23_S_R
	1342 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1343 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1344 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_43;
	end

	1345 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1346 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1347 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1348 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_R_D;
	end

//ORD2_43
	1349 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1350 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_43;
	end

	1351 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1352 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1353 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1354 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_R_D;
	end

//ORD3_43
	1355 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1356 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_43;
	end

	1357 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1358 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1359 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1360 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_R_D;
	end

//ORD4_43
	1361 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1362 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_43;
	end

	1363 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1364 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1365 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1366 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_23_S_R_D;
	end

//ORD5_43
	1367 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1368 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1369 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_23_S_R_D
	1370 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1371 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1372 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_44;
	end

	1373 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1374 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1375 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1376 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_47_4;
	end

//ORD2_41
	1377 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1378 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_44;
	end

	1379 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1380 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1381 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1382 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_47_4;
	end

//ORD3_44
	1383 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1384 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_44;
	end

	1385 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1386 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1387 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1388 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_47_4;
	end

//ORD4_44
	1389 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1390 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_44;
	end

	1391 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1392 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1393 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1394 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_47_4;
	end

//ORD5_44
	1395 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1396 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1397 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_47_4
	1398 : begin
		op[43:36] <= FIND4;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1399 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1001;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1400 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_47_7;
	end

	1401 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_4;
	end

//CHECK_47_7
	1402 : begin
		op[43:36] <= FIND7;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1403 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1101;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1404 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_S;
	end

	1405 : begin
		op[43:36] <= FIND4;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

//CHECK_4
	1406 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1101;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1407 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74;
	end

	1408 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//CHECK_74
	1409 : begin
		op[43:36] <= FIND7;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1410 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1001;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1411 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S;
	end

	1412 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1413 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S;
	end

	1414 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//CHECK_74_7_S
	1415 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1416 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1001;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1417 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D;
	end

	1418 : begin
		op[43:36] <= FIND7;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1419 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//CHECK_74_S
	1420 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1421 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1422 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

	1423 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1011;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1424 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_S_L;
	end

	1425 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1426 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_S_S_U;
	end

	1427 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1428 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1429 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_45;
	end

	1430 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1431 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1432 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1433 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_S_S_U;
	end

//ORD2_45
	1434 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1435 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_45;
	end

	1436 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1437 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1438 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1439 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_S_S_U;
	end

//ORD3_45
	1440 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1441 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_45;
	end

	1442 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1443 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1444 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1445 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_S_S_U;
	end

//ORD4_45
	1446 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1447 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_45;
	end

	1448 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1449 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1450 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1451 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_S_S_U;
	end

//ORD5_45
	1452 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1453 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1454 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_74_S_S_S_U
	1455 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1456 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1457 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_46;
	end

	1458 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1459 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1460 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1461 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

//ORD2_46
	1462 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1463 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_46;
	end

	1464 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1465 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1466 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1467 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

//ORD3_46
	1468 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1469 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_46;
	end

	1470 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1471 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1472 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1473 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

//ORD4_46
	1474 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1475 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_46;
	end

	1476 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1477 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1478 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1479 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

//ORD5_46
	1480 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1481 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1482 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1483 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

//CHECK_74_S_S_L
	1484 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1485 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1486 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_47;
	end

	1487 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1488 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1489 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1490 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

//ORD2_47
	1491 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1492 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_47;
	end

	1493 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1494 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1495 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1496 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

//ORD3_46
	1497 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1498 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_47;
	end

	1499 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1500 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1501 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1502 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

//ORD4_47
	1503 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1504 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_47;
	end

	1505 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1506 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1507 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1508 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_S_L;
	end

//ORD5_47
	1509 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1510 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1511 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_74_S_L
	1512 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1513 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1514 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_48;
	end

	1515 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1516 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1517 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1518 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D;
	end

//ORD2_48
	1519 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1520 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_48;
	end

	1521 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1522 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1523 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1524 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D;
	end

//ORD3_48
	1525 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1526 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_48;
	end

	1527 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1528 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1529 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1530 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D;
	end

//ORD4_48
	1531 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1532 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_48;
	end

	1533 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1534 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1535 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1536 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D;
	end

//ORD5_48
	1537 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1538 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1539 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_74_7_S_D
	1540 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1541 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1542 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_49;
	end

	1543 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1544 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1545 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1546 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R;
	end

//ORD2_49
	1547 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1548 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_49;
	end

	1549 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1550 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1551 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1552 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R;
	end

//ORD3_49
	1553 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1554 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_49;
	end

	1555 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1556 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1557 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1558 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R;
	end

//ORD4_49
	1559 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1560 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_49;
	end

	1561 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1562 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1563 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1564 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R;
	end

//ORD5_49
	1565 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1566 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1567 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_74_S_D_R
	1568 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1569 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1570 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_50;
	end

	1571 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1572 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1573 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1574 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R_U;
	end

//ORD2_50
	1575 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1576 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_50;
	end

	1577 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1578 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1579 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1580 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R_U;
	end

//ORD3_50
	1581 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1582 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_50;
	end

	1583 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1584 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1585 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1586 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R_U;
	end

//ORD4_50
	1587 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1588 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_50;
	end

	1589 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1590 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1591 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1592 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R_U;
	end

//ORD5_50
	1593 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1594 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1595 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_74_S_D_R_U
	1596 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1597 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1598 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_51;
	end

	1599 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1600 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1601 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1602 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R_U_R;
	end

//ORD2_51
	1603 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1604 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_51;
	end

	1605 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1606 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1607 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1608 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R_U_R;
	end

//ORD3_51
	1609 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1610 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_51;
	end

	1611 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1612 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1613 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1614 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R_U_R;
	end

//ORD4_51
	1615 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1616 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_51;
	end

	1617 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1618 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1619 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1620 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74_7_S_D_R_U_R;
	end

//ORD5_51
	1621 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1622 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1623 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//CHECK_74_S_D_R_U_R
	1624 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1625 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1626 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_52;
	end

	1627 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1628 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1629 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1630 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD2_52
	1631 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1632 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_52;
	end

	1633 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1634 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1635 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1636 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD3_52
	1637 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1638 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_52;
	end

	1639 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1640 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1641 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1642 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD4_52
	1643 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1644 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_52;
	end

	1645 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1646 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1647 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1648 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD5_52
	1649 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1650 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1651 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_4
	1652 : begin
		op[43:36] <= FIND4;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1653 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1101;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1654 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= CHECK_74;
	end

	1655 : begin
		op[43:36] <= UDSTAR;
		op[35:32] <= 3;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1656 : begin
		op[43:36] <= LRSTAR;
		op[35:32] <= 4;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1657 : begin
		op[43:36] <= UD4;
		op[35:32] <= 5;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1658 : begin
		op[43:36] <= LR4;
		op[35:32] <= 6;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1659 : begin
		op[43:36] <= COMP;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	1660 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4_UD_LR;
	end

	1661 : begin
		op[43:36] <= BS;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	1662 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4_UD_UD_LR;
	end

	1663 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1664 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4_U;
	end

	1665 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1666 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4_U;
	end

	1667 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1668 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1669 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_53;
	end

	1670 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1671 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1672 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1673 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD2_53
	1674 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1675 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_53;
	end

	1676 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1677 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1678 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1679 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD3_53
	1680 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1681 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_53;
	end

	1682 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1683 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1684 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1685 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD4_53
	1686 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1687 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_53;
	end

	1688 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1689 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1690 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1691 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD5_53
	1692 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1693 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1694 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1695 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//MOVE_4_UD_LR
	1696 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1697 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4_R;
	end

	1698 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1699 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4_U;
	end

//MOVE_4_D
	1700 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1701 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1702 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_54;
	end

	1703 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1704 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1705 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1706 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD2_54
	1707 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1708 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_54;
	end

	1709 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1710 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1711 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1712 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD3_54
	1713 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1714 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_54;
	end

	1715 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1716 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1717 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1718 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD4_54
	1719 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1720 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_54;
	end

	1721 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1722 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1723 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1724 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD5_54
	1725 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1726 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1727 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1728 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//MOVE_4_R
	1729 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1730 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1731 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_55;
	end

	1732 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1733 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1734 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1735 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD2_55
	1736 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1737 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_55;
	end

	1738 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1739 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1740 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1741 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD3_55
	1742 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1743 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_55;
	end

	1744 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1745 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1746 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1747 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD4_55
	1748 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1749 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_55;
	end

	1750 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1751 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1752 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1753 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD5_55
	1754 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1755 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1756 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1757 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//MOVE_4_U
	1758 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1759 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1760 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_56;
	end

	1761 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1762 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1763 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1764 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD2_56
	1765 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1766 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_56;
	end

	1767 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1768 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1769 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1770 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD3_56
	1771 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1772 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_56;
	end

	1773 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1774 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1775 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1776 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD4_56
	1777 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1778 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_56;
	end

	1779 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1780 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1781 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1782 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//ORD5_56
	1783 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1784 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1785 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1786 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4;
	end

//MOVE_4_UD_UD_LR
	1787 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1788 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4_L;
	end

	1789 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1790 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4_D;
	end

	1791 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_4_L;
	end

//MOVE_7
	1792 : begin
		op[43:36] <= FIND7;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1793 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1794 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47;
	end

	1795 : begin
		op[43:36] <= UDSTAR;
		op[35:32] <= 3;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1796 : begin
		op[43:36] <= LRSTAR;
		op[35:32] <= 4;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1797 : begin
		op[43:36] <= UD7;
		op[35:32] <= 5;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1798 : begin
		op[43:36] <= LR7;
		op[35:32] <= 6;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1799 : begin
		op[43:36] <= COMP;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	1800 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7_UD_LR;
	end

	1801 : begin
		op[43:36] <= BS;
		op[35:32] <= 3;
		op[31:28] <= 5;
		op[27:0] <= 28'b0;
	end

	1802 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7_UD_UD_LR;
	end

	1803 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1804 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7_U;
	end

	1805 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1806 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7_U;
	end

//MOVE_7_L
	1807 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1808 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1809 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_57;
	end

	1810 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1811 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1812 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1813 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD2_57
	1814 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1815 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_57;
	end

	1816 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1817 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1818 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1819 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD3_57
	1820 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1821 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_57;
	end

	1822 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1823 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1824 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1825 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD4_57
	1826 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1827 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_57;
	end

	1828 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1829 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1830 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1831 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD5_57
	1832 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1833 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1834 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1835 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//MOVE_7_UD_LR
	1836 : begin
		op[43:36] <= BS;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1837 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7_R;
	end

//MOVE_7_D
	1838 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1839 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1840 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_58;
	end

	1841 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1842 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1843 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1844 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD2_58
	1845 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1846 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_58;
	end

	1847 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1848 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1849 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1850 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD3_58
	1851 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1852 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_58;
	end

	1853 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1854 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1855 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1856 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD4_58
	1857 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1858 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_58;
	end

	1859 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1860 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1861 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1862 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD5_58
	1863 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1864 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1865 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1866 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//MOVE_7_UD_UD_LR
	1867 : begin
		op[43:36] <= COMP;
		op[35:32] <= 4;
		op[31:28] <= 6;
		op[27:0] <= 28'b0;
	end

	1868 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7_L;
	end

	1869 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1870 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1871 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7_D;
	end

//MOVE_7_R
	1872 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1873 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1874 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_59;
	end

	1875 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1876 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1877 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1878 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD2_59
	1879 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1880 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_59;
	end

	1881 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1882 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1883 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1884 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD3_59
	1885 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1886 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_59;
	end

	1887 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1888 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1889 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1890 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD4_59
	1891 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1892 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_59;
	end

	1893 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1894 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1895 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1896 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD5_59
	1897 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1898 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1899 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1900 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//MOVE_7_U
	1901 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1902 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1903 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_60;
	end

	1904 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1905 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1906 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1907 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD2_60
	1908 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1909 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_60;
	end

	1910 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1911 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1912 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1913 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD3_60
	1914 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1915 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_60;
	end

	1916 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1917 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1918 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1919 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD4_60
	1920 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1921 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_60;
	end

	1922 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1923 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1924 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1925 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//ORD5_60
	1926 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1927 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1928 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1929 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_7;
	end

//MOVE_47
	1930 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1931 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1001;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1932 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D;
	end

	1933 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1934 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L;
	end

	1935 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1011;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	1936 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L;
	end

	1937 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1938 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1939 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_61;
	end

	1940 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1941 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1942 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1943 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L;
	end

//ORD2_61
	1944 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1945 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_61;
	end

	1946 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1947 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1948 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1949 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L;
	end

//ORD3_61
	1950 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1951 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_61;
	end

	1952 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1953 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1954 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1955 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L;
	end

//ORD4_61
	1956 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1957 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_61;
	end

	1958 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1959 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1960 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1961 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L;
	end

//ORD5_61
	1962 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1963 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1964 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_47_L
	1965 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1966 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1967 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_62;
	end

	1968 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1969 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1970 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1971 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L;
	end

//ORD2_62
	1972 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	1973 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_62;
	end

	1974 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1975 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1976 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	1977 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L;
	end

//ORD3_62
	1978 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	1979 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_62;
	end

	1980 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1981 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1982 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	1983 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L;
	end

//ORD4_62
	1984 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	1985 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_62;
	end

	1986 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1987 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1988 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	1989 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L;
	end

//ORD5_62
	1990 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1991 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	1992 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_47_L_L
	1993 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	1994 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	1995 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_63;
	end

	1996 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	1997 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1998 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	1999 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D;
	end

//ORD2_63
	2000 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2001 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_63;
	end

	2002 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2003 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2004 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2005 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D;
	end

//ORD3_63
	2006 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2007 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_63;
	end

	2008 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2009 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2010 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2011 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D;
	end

//ORD4_63
	2012 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2013 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_63;
	end

	2014 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2015 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2016 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2017 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D;
	end

//ORD5_63
	2018 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2019 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2020 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_47_L_L_D
	2021 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2022 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2023 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_64;
	end

	2024 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2025 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2026 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2027 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D_R;
	end

//ORD2_64
	2028 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2029 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_64;
	end

	2030 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2031 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2032 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2033 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D_R;
	end

//ORD3_64
	2034 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2035 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_64;
	end

	2036 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2037 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2038 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2039 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D_R;
	end

//ORD4_64
	2040 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2041 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_64;
	end

	2042 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2043 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2044 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2045 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D_R;
	end

//ORD5_64
	2046 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2047 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2048 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_47_L_L_D_R
	2049 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2050 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2051 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_65;
	end

	2052 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2053 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2054 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2055 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D_R_R;
	end

//ORD2_65
	2056 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2057 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_65;
	end

	2058 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2059 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2060 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2061 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D_R_R;
	end

//ORD3_65
	2062 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2063 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_65;
	end

	2064 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2065 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2066 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2067 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D_R_R;
	end

//ORD4_65
	2068 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2069 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_65;
	end

	2070 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2071 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2072 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2073 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_47_L_L_D_R_R;
	end

//ORD5_65
	2074 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2075 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2076 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_47_L_L_D_R_R
	2077 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2078 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2079 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_66;
	end

	2080 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2081 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2082 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2083 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD2_66
	2084 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2085 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_66;
	end

	2086 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2087 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2088 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2089 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD3_66
	2090 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2091 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_66;
	end

	2092 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2093 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2094 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2095 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD4_66
	2096 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2097 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_66;
	end

	2098 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2099 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2100 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2101 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD5_66
	2102 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2103 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2104 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2105 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//MOVE_S
	2106 : begin
		op[43:36] <= FINDSTAR;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2107 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1111;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	2108 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

	2109 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1011;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	2110 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_S_D;
	end

	2111 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1110;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	2112 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_S_R;
	end

	2113 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2114 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2115 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_67;
	end

	2116 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2117 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2118 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2119 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_S_R;
	end

//ORD2_67
	2120 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2121 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_67;
	end

	2122 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2123 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2124 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2125 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_S_R;
	end

//ORD3_67
	2126 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2127 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_67;
	end

	2128 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2129 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2130 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2131 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_S_R;
	end

//ORD4_67
	2132 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2133 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_67;
	end

	2134 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2135 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2136 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2137 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_S_R;
	end

//ORD5_67
	2138 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2139 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2140 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

//MOVE_S_R
	2141 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2142 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2143 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_68;
	end

	2144 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2145 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2146 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2147 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD2_68
	2148 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2149 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_68;
	end

	2150 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2151 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2152 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2153 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD3_68
	2154 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2155 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_68;
	end

	2156 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2157 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2158 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2159 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD4_68
	2160 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2161 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_68;
	end

	2162 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2163 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2164 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2165 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD5_68
	2166 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2167 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2168 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2169 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//MOVE_S_D
	2170 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2171 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2172 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_69;
	end

	2173 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2174 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2175 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2176 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD2_69
	2177 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2178 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_69;
	end

	2179 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2180 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2181 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2182 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD3_69
	2183 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2184 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_69;
	end

	2185 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2186 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2187 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2188 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD4_69
	2189 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2190 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_69;
	end

	2191 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2192 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2193 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2194 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD5_69
	2195 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2196 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2197 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
	end

//MOVE_5S
	2198 : begin
		op[43:36] <= FIND5;
		op[35:32] <= 2;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2199 : begin
		op[43:36] <= CHECK;
		op[35:32] <= 2;
		op[31:28] <= 4'b1010;
		op[27:4] <= 24'b0;
		op[3:0] <= 4'b0;
	end

	2200 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= FINISH;
	end

	2201 : begin
		op[43:36] <= LEFT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2202 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2203 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_70;
	end

	2204 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2205 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2206 : begin
		op[43:36] <= WL;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2207 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_U;
	end

//ORD2_70
	2208 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2209 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_70;
	end

	2210 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2211 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2212 : begin
		op[43:36] <= WL;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2213 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_U;
	end

//ORD3_70
	2214 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2215 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_70;
	end

	2216 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2217 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2218 : begin
		op[43:36] <= WL;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2219 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_U;
	end

//ORD4_70
	2220 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2221 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_70;
	end

	2222 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2223 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2224 : begin
		op[43:36] <= WL;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2225 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_U;
	end

//ORD5_70
	2226 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2227 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2228 : begin
		op[43:36] <= WL;
		op[35:32] <= 14;
		op[31:28] <= 14;
	end

//MOVE_5S_U
	2229 : begin
		op[43:36] <= UP;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2230 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2231 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_71;
	end

	2232 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2233 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2234 : begin
		op[43:36] <= WU;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2235 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_R;
	end

//ORD2_71
	2236 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2237 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_71;
	end

	2238 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2239 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2240 : begin
		op[43:36] <= WU;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2241 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_R;
	end

//ORD3_71
	2242 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2243 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_71;
	end

	2244 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2245 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2246 : begin
		op[43:36] <= WU;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2247 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_R;
	end

//ORD4_71
	2248 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2249 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_71;
	end

	2250 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2251 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2252 : begin
		op[43:36] <= WU;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2253 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_R;
	end

//ORD5_72
	2254 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2255 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2256 : begin
		op[43:36] <= WU;
		op[35:32] <= 14;
		op[31:28] <= 14;
	end

//MOVE_5S_R
	2257 : begin
		op[43:36] <= RIGHT;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2258 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2259 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_72;
	end

	2260 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2261 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2262 : begin
		op[43:36] <= WR;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2263 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_D;
	end

//ORD2_72
	2264 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2265 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_72;
	end

	2266 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2267 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2268 : begin
		op[43:36] <= WR;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2269 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_D;
	end

//ORD3_72
	2270 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2271 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_72;
	end

	2272 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2273 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2274 : begin
		op[43:36] <= WR;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2275 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_D;
	end

//ORD4_72
	2276 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2277 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_72;
	end

	2278 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2279 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2280 : begin
		op[43:36] <= WR;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2281 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S_D;
	end

//ORD5_72
	2282 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2283 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2284 : begin
		op[43:36] <= WR;
		op[35:32] <= 14;
		op[31:28] <= 14;
	end

//MOVE_5S_D
	2285 : begin
		op[43:36] <= DOWN;
		op[35:32] <= 0;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

	2286 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b001110;//13
		op[3:0] <= 4'b0;
	end

	2287 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD2_73;
	end

	2288 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2289 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2290 : begin
		op[43:36] <= WD;
		op[35:32] <= 10;
		op[31:28] <= 10;
		op[27:0] <= 28'b0;
	end

	2291 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD2_73
	2292 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b011011;//27
		op[3:0] <= 4'b0;
	end

	2293 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD3_73;
	end

	2294 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2295 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2296 : begin
		op[43:36] <= WD;
		op[35:32] <= 11;
		op[31:28] <= 11;
		op[27:0] <= 28'b0;
	end

	2297 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD3_73
	2298 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b101001;//41
		op[3:0] <= 4'b0;
	end

	2299 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD4_73;
	end

	2300 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2301 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2302 : begin
		op[43:36] <= WD;
		op[35:32] <= 12;
		op[31:28] <= 12;
		op[27:0] <= 28'b0;
	end

	2303 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD4_73
	2304 : begin
		op[43:36] <= BS2;
		op[35:32] <= 7;
		op[31:10] <= 22'b0;
		op[9:4] <= 6'b110111;//55
		op[3:0] <= 4'b0;
	end

	2305 : begin
		op[43:36] <= JNZ;
		op[35:12] <= 24'b0;
		op[11:0] <= ORD5_73;
	end

	2306 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2307 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2308 : begin
		op[43:36] <= WD;
		op[35:32] <= 13;
		op[31:28] <= 13;
		op[27:0] <= 28'b0;
	end

	2309 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//ORD5_73
	2310 : begin
		op[43:36] <= INC;
		op[35:32] <= 7;
		op[31:28] <= 7;
		op[27:0] <= 28'b0;
	end

	2311 : begin
		op[43:36] <= SHIFT;
		op[35:32] <= 14;
		op[31:28] <= 14;
		op[27:0] <= 28'b0;
	end

	2312 : begin
		op[43:36] <= WD;
		op[35:32] <= 14;
		op[31:28] <= 14;
	end

	2313 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= MOVE_5S;
	end

//FINISH
	2314 : begin
		op[43:36] <= STORE;
		op[35:32] <= 8;
		op[31:28] <= 0;
		op[27:0] <= 28'b0;
	end

//COMPLETE
	2315 : begin
		op[43:36] <= INC;
		op[35:32] <= 9;
		op[31:28] <= 9;
		op[27:0] <= 28'b0;
	end

//LOOP
	2316 : begin
		op[43:36] <= JMP;
		op[35:12] <= 24'b0;
		op[11:0] <= LOOP;
	end

	endcase
end

endmodule
