stepsize 1000

| Set up vectors

analyzer quotient outbit dividendin S0 S1 inbit shift clk reset_n
vector sel S1 S1_n S0 S0_n
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
l dividendin
l inbit
set sft 01
set sel 0101
w quotient outbit dividendin S0 S1 inbit shift clk reset_n
set clock 01
s
set clock 10
s
h dividendin
set clock 01
s
set clock 10
s
l dividendin
set clock 01
s
set clock 10
s
| test mux
h dividendin
set clock 01
s
set clock 10
s
set sel 0110
set clock 01
s
set clock 10
s
l dividendin
set clock 01
s
set clock 10
s
set sel 1001
set clock 01
s
set clock 10
s
set clock 01
| test shifter
set sel 0101
s
set clock 10
s
set clock 01
s
set clock 10
s
set clock 01
set sel 0110
s
set clock 10
s
set clock 01
h inbit
s
set clock 10
s
set clock 01
set sft 10
s
set clock 10
s
set clock 01
s
set clock 10
s
set clock 01
s
set clock 10
s
set clock 01
s

