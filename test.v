`timescale 1ps/1ps

module test;
	reg clk, rst_n;
	reg [4:0] btn;
	wire [11:0] seg;
	top top0(clk, rst_n, seg, btn);
	always #50 clk = ~clk;
	initial begin
		$dumpfile("top_test.vcd");
		$dumpvars(0, top0);
		$dumplimit(1000000);
		$monitor($stime, "clk:%b rst:%b", clk, rst_n);
		rst_n = 0;
		clk = 0;
		btn = 0;
	# 150
		rst_n = 1;
	# 1000000
	$finish;
	end
endmodule

