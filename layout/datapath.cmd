stepsize 1000

| Set up vectors


vector sel S0 S1
vector dividendin dividendin_{7:0}
vector quotient quotient_{7:0}
vector divisorin divisorin_{6:0}
vector remainder remainder_{6:0}

analyzer quotient remainder sign divisorin dividendin add_n load S0 S1 inbit shift clk reset_n
w quotient remainder sign divisorin dividendin add_n load S0 S1 inbit shift clk reset_n

s
h clk
s
l clk
l reset_n
set dividendin 00000000
set divisorin 0000000
set sel 00
l add_n
h load
l inbit
l shift
s

| test register and mux
h clk
s
set dividendin 10101010
set divisorin 0000010
l clk
h reset_n
s
h clk
s
set sel 01
l clk
s
h clk
s
l clk
s
h clk
s
set dividendin 10101010
l clk
s
h clk
s
| test shifter
l clk
s
h inbit
h clk
h shift
s
l clk
s
l shift
h clk
s
set sel 00
l clk
s
h clk
s
l clk
s



