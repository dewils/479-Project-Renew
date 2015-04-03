stepsize 1
analyzer Q D reset_n clk clk_n
vector clock clk clk_n
set clock 01
s
s
l reset_n
s
h reset_n
s
l D
s
h D
set clock 10
s
l D
s
h D
s
l D
s
s
set clock 01
h D
s
l D
s
s
s
h D
s
set clock 10
l D
s
s
s
s
s
set clock 01
s
s
s
s
s
set clock 10
s
s
s
s
s