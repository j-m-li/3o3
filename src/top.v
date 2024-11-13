// 
// This software is dedicated to the public domain.
//

module top (
	input I_clk,
	input I_rst,

	output reg [1:0] O_mosi,
	output reg [1:0] O_sck,
	input [1:0] I_miso
);

localparam ZERO = 2'b00;
localparam PLUS = 2'b01;
localparam MINUS = 2'b10;

reg [1:0] x;

always @(posedge I_clk) begin

	if (I_rst) begin
		O_mosi <= 0;
	end else begin
		O_mosi <= I_clk;
	end
end

always @(*) begin
	x <= ZERO;
	if (!I_rst) begin
		case (I_miso)
		PLUS: x <= PLUS;
		MINUS: x <= PLUS;
		default: x <= ZERO;
		endcase
	end	
end

endmodule

