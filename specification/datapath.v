//
// EECE 479: Project Verilog File: datapath.v
//
// This is the stub for the datapath block.  Please start with this
// template when writing your Verilog code.
//
// Names:  Derrick Wilson
// Number:  76674068
//

module datapath(        remainder,              // output (7 bits)
                        quotient,               // output (8 bits)
                        sign,                   // output 
                        divisorin,              // input (7 bits)
                        dividendin,             // input (8 bits)
                        load,                   // input
                        add,                    // input
                        shift,                  // input
                        inbit,                  // input
                        sel,                    // input (2 bits)
                        clk,                    // clock input
                        reset);                 // async reset 

// Outputs
output [6:0] remainder;
output [7:0] quotient;
output sign;

// Inputs
input [6:0] divisorin;
input [7:0] dividendin;
input load;
input add;
input shift;
input inbit;
input [1:0] sel;
input clk;
input reset;

reg[7:0] divisor_q;
reg[7:0] adder_out;
reg sign;
reg[15:0] mux_out;
reg[15:0] shift_out;
reg[15:0] remainder_q;
reg[6:0] remainder;
reg[7:0] quotient;


// 8-Bit Divisor Register Module
always @(posedge clk or posedge reset) begin
        if (reset == 1 ) begin
                // async reset
                divisor_q = 0;
        end
        else if (load == 1) begin
                // load register selected
                divisor_q[7] = 1'b0;
                divisor_q[6:0] = divisorin;
        end
end

// 8-Bit Adder/Subtractor Module
always @(add or divisor_q or remainder_q) begin
        if (add == 1) begin
                adder_out = remainder_q[15:8] + divisor_q; 
        end
        else begin
                adder_out = remainder_q[15:8] + ~divisor_q + 1; 
        end
        sign = adder_out[7];
end

// 16-bit 3-to-1 Mux Module
always @(sel or dividendin or adder_out or remainder_q) begin
        case(sel)
                0: begin
                        mux_out[15:8] = 8'b00000000;
                        mux_out[7:0] = 8'b00000000;
                end
                1: begin
                        mux_out[15:8] = adder_out;
                        mux_out[7:0] = remainder_q[7:0];
                end
                2: begin
                        mux_out[15:8] = 8'b00000000;
                        mux_out[7:0] = dividendin;
                end
                3: begin
                        mux_out[15:8] = remainder_q[15:8];
                        mux_out[7:0] = remainder_q[7:0];
                end
        endcase
end

// Shift/No Shift Module
always @(shift or inbit or mux_out) begin
        if (shift == 1) begin
                shift_out[15:1] = mux_out[14:0];
                shift_out[0] = inbit;
        end
        else begin
                shift_out = mux_out;
        end
end

// 16-Bit Remainder Register
always @(posedge clk or posedge reset) begin
        if (reset == 1 ) begin
                // async reset
                remainder_q = 0;
        end
        else begin
                remainder_q = shift_out;
        end
        remainder = remainder_q[15:9];
        quotient = remainder_q[7:0];
end

endmodule
