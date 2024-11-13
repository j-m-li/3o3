// 
// This software is dedicated to the public domain.
//
// https://homepage.cs.uiowa.edu/~jones/ternary/arith.shtml#addahead
//


task adder333_3 (
	output reg [1:0] O_s,
	output reg [1:0] O_c,
	input [5:0] I_a,
	input [5:0] I_b
);

reg [1:0] c_0;
reg [1:0] c_1;
reg [1:0] c_2;
reg [1:0] c_10;

begin
end
endtask

// meaning 
// - = <
// 0 = =
// + = >
task adder33_p (
	output reg [1:0] O_c,
	input [1:0] I_a,
	input [1:0] I_b
);

begin
	case (I_b)
	2'b10: begin
		case (I_a)
		2'b10:   O_c = 2'b10; // --
		default: O_c = 2'b10; // -0
		2'b01:   O_c = 2'b10; // -+
		endcase
	end
	default: begin
		case (I_a)
		2'b10:   O_c = 2'b10; // 0-
		default: O_c = 2'b00; // 00
		2'b01:   O_c = 2'b01; // 0+
		endcase
	end
	2'b01: begin
		case (I_a)
		2'b10:   O_c = 2'b01; // +-
		default: O_c = 2'b01; // +0
		2'b01:   O_c = 2'b01; // ++
		endcase
	end
	endcase	
end
endtask

