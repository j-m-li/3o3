//
// This software is dedicated to the public domain.
//

`timescale 1ns / 1ns

`define assert(a, b) \
	case (a !== b) \
	1'b0: begin end \
	default: begin \
		$display("assertion FAILED %h !== %h", a, b); \
		$finish; \
	end \
	endcase

module test_bench;

reg clk;
reg rst;

wire [1:0] mosi;
wire [1:0] miso;
wire [1:0] sck;

reg [1:0] r  = 2'b11;

top dut (
	.I_clk(clk),
	.I_rst(rst),

	.O_mosi(mosi),
	.I_miso(miso),
	.O_sck(sck)
);


initial begin
	$monitor("%t: %h %b %b %b", $time, rst, mosi, miso, r);
	rst = 0;
	#100
	compare33_3(r, 6'b000010, 6'b000001);
	$display("R %h", r);
	`assert(rst, 0);
	$finish;
end

initial begin
	clk = 0;
	#5
	forever clk = #5 ~clk;
end
endmodule

`include "top.v"

