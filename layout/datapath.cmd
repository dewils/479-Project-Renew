stepsize 1000

| Set up vectors

vector divisorin divisorin_{6:0}
vector dividendin dividendin_{7:0}
vector remainder remainder_{6:0}
vector quotient quotient_{7:0}

vector sel sel_{1:0}

| An initial clock pulse to get things going
| as in the specification (verilog) test bench

l load
l add_n
set sel 00
l shift
l inbit

s
h clk
s
l clk
s

| Start the process by asserting reset_n and waiting one clock cycle

l reset_n
s
h clk
s
l clk
s

h reset_n
set divisorin 0000000
set dividendin 00000001


s
w quotient remainder
w load add_n sel shift inbit clk load
h clk
s
l clk
s
set sel 01
s
h clk
s
l clk
set sel 10
s
h clk
s
l clk
s
set sel 01
s
h clk
s
l clk
s
l inbit
h shift
s
h clk
s
l clk
s
s
h clk
s
l clk
s
s
h clk
s
l clk
s




h load
s
h clk
s
l clk
s
set sel 10
s
h clk
s
l clk
s
h clk
s
l clk
exit
