stepsize 1000
analyzer Q D reset_n clk
vector clock clk clk_n
s
set clock 10
s
set clock 01
l reset_n
s
set clock 10
s
set clock 01
h reset_n
l D
w Q
w D clk
s
set clock 10
s
set clock 01
h D
s
set clock 10
s
l D
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

