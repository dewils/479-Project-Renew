stepsize 1000

vector S0_bus S0 S0_n 
vector S1_bus S1 S1_n
vector D D0 D1 D2
w Y S0 S1 D
set D 100
set S0_bus 01
set S1_bus 01
s
set S0_bus 01
set S1_bus 10
s
set S0_bus 10
set S1_bus 01
s
set S0_bus 10
set S1_bus 10
s
set D 010
set S0_bus 01
set S1_bus 01
s
set S0_bus 01
set S1_bus 10
s
set S0_bus 10
set S1_bus 01
s
set S0_bus 10
set S1_bus 10
s
set D 001
set S0_bus 01
set S1_bus 01
s
set S0_bus 01
set S1_bus 10
s
set S0_bus 10
set S1_bus 01
s
set S0_bus 10
set S1_bus 10
s
exit
