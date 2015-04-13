stepsize 1000

| Set up vectors

analyzer remainder outbit reg1_out X add_out mux_out outbit divisorin S0 S1 add_n C inbit shift clk reset_n
vector sel S0 S0_n S1 S1_n
vector sft shift shift_n
vector clock clk clk_n

s
set clock 10
s
set clock 01
s
l reset_n
set clock 10
s
set clock 01
s
set clock 10
s
h reset_n
l divisorin
l C
l add_n
l inbit
set sft 01
set sel 0101
w remainder outbit reg1_out X add_out mux_out outbit divisorin S0 S1 add_n C inbit shift clk reset_n
set clock 01
s
set clock 10
s
set clock 01
h divisorin
s
set clock 10
s
set clock 01
set sel 0110
s
set clock 10
s
set clock 01
s
set clock 10
s
set clock 01
l divisorin
s
set clock 10
s
set clock 01
s
set clock 10
s
set clock 01
set sel 1010
s
set clock 10
s
set clock 01
s
set clock 10
s
set clock 01
l divisorin
s
set clock 10
s
set clock 01
h add_n
s
set clock 10
s
set clock 01
s


