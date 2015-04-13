stepsize 1000

| Set up vectors

analyzer quotient dividendin D1 D2 S0 S1  
vector sel S0 S0_n S1 S1_n
s
set sel 0101
l dividendin
l D1
l D2
w S1 S0 dividendin D1 D2 quotient
s
h dividendin
l D1
l D2
s
l dividendin
l D1
l D2
s
set sel 0110
l dividendin
h D1
l D2
s
l dividendin
l D1
l D2
s
set sel 1001
l dividendin
l D1
h D2
s
l dividendin
l D1
l D2
s


