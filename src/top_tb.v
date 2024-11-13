//
// This software is dedicated to the public domain.
//

`timescale 1ns / 1ns

`define assert(a, b) \
	if (a !== b) begin \
		$display("assertion FAILED %h !== %h", a, b); \
		$finish; \
	end

module test_bench;

reg clk;
reg rst;

wire [0:1] mosi;
wire [0:1] miso;
wire [0:1] sck;

top dut (
	.I_clk(clk),
	.I_rst(rst),

	.O_mosi(mosi),
	.I_miso(miso),
	.O_sck(sck)
);

initial begin
	$monitor("%t: %h %b %b %b", $time, rst, mosi, miso, sck);
	rst = 0;
	#100
	$finish;
end

initial begin
	clk = 0;
	#5
	forever clk = #5 ~clk;
end
endmodule

`include "top.v"

