stepsize 1000

| Set up vectors

vector dividendin dividendin_{7:0}
vector quotient quotient_{7:0}

vector sel sel_{1:0}

| An initial clock pulse to get things going
| as in the specification (verilog) test bench

s
h clk
s
l clk

| Start the process by asserting reset_n and waiting one clock cycle

l reset_n
s
h clk
s
h reset_n
l clk



set dividendin 11111111

set sel 00
l shift
l inbit
s

h clk
w dividendin sel shift inbit clk
w quotient
s
l clk
s
h clk
s
set sel 01
l clk
s
h clk
s
set sel 10
l clk
s
h clk
s
set sel 11
l clk
s
h clk
s
set sel 01
l clk
s
h clk
s
set dividendin 00000000
l clk
s
h clk
s
set sel 10
l clk
s
h clk
s
l clk
s
h clk
s
exit


