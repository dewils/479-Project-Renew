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

reg[2:0] curr_state;
reg[2:0] next_state;
reg load;
reg[1:0] sel;
reg shift;
reg inbit;
reg add;
reg valid;
reg repitiion_counter;

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
always @(curr_state or start) begin
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
				if(valid == 1) begin
					next_state <= 4;
				end
				else begin
					next_state <= 1;
				end
			end
			3: begin
				if(valid == 1) begin
					next_state <= 4;
				end
				else begin
					next_state <= 1;
				end
			end
			4: begin
				next_state <= 4;
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
			valid <= 0;
			repitiion_counter <= 0;
		end
		1: begin
			load <= 0;
			sel <= 1;
			shift <= 0;
			inbit <= 1'bz;
			add <= 0;
			valid <= 0;
			repitiion_counter <= repitiion_counter + 1;
		end
		2: begin
			load <= 0;
			sel <= 1;
			shift <= 1;
			inbit <= 0;
			add <= 1;
			if(repitiion_counter == 9) begin
				valid <= 1;
			end
			else begin
				valid <= 0;
			end
		end
		3: begin
			load <= 0;
			sel <= 3;
			shift <= 1;
			inbit <= 1;
			add <= 1'bz;
			if(repitiion_counter == 9) begin
				valid <= 1;
			end
			else begin
				valid <= 0;
			end
		end
		4: begin
			load <= 0;
			sel <= 3;
			shift <= 0;
			inbit <= 1'bz;
			add <= 1'bz;
			valid <= 1;
		end
	endcase
end

endmodule
