all: import gen
import:
	ghdl -i --workdir=work --work=work ../src/*.vhd ../sim/*.vhd
gen:
	ghdl -m --workdir=work --work=work counter_tb

run:
	./counter_tb --stop-time=2us --wave=counter.ghw 

view: 
	gtkwave counter.ghw -a counter.sav
