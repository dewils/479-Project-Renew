//
// EECE 479: Project Verilog File: controller.v
//
// This is the stub for the controller block.  Please start with this
// template when writing your Verilog code.
//
// Names:  Derrick Wilson
// Number:  76674068
//

module controller(	load,		// output
					add,		// output
					shift,		// output
					inbit,		// output
					sel,		// output (2 buts)
					valid,		// output
					start,		// input
					sign, 		// input
					clk,		// clock input
					reset);		// async reset

output load;
output add;
output shift;
output inbit;
output [1:0] sel;
output valid;

input start;
input sign;
input clk;
input reset;

reg[1:0] curr_state;
reg[1:0] next_state;
reg load;
reg[1:0] sel;
reg shift;
reg inbit;
reg add;
reg valid;
reg [7:0] repition_counter;

// State Register
always @(posedge clk or posedge reset)
begin
	if (reset == 1) begin
		curr_state <= 0;
	end
	else begin
		curr_state <= next_state;
	end
end

// Next State Logic
always @(curr_state or start or sign) begin
	if (start == 1) begin
		next_state <= 0;
	end
	else begin
		case (curr_state)
			0: begin
				next_state <= 1;
			end
			1: begin
				if (sign == 1) begin
					next_state <= 2;
				end
				else begin
					next_state <= 3;
				end
			end
			2: begin
				next_state <= 1;
			end
			3: begin
				next_state <= 1;
			end
		endcase
	end
end

// Output Logic
always @(curr_state) begin
	case(curr_state)
		0: begin
			load <= 1;
			sel <= 2;
			shift <= 1;
			inbit <= 0;
			add <= 1'bz;
			repition_counter = 0;
		end
		1: begin
			load <= 0;
			sel <= 1;
			shift <= 0;
			inbit <= 1'bz;
			add <= 0;
			repition_counter = repition_counter;
		end
		2: begin
			load <= 0;
			sel <= 1;
			shift <= 1;
			inbit <= 0;
			add <= 1;
			repition_counter = repition_counter + 1;
		end
		3: begin
			load <= 0;
			sel <= 3;
			shift <= 1;
			inbit <= 1;
			add <= 1'bz;
			repition_counter = repition_counter + 1;
		end
	endcase
end

always @(repition_counter) begin
	if (repition_counter == 8) begin
		valid = 1;
	end
	else begin
		valid = 0;
	end
end
endmodule
