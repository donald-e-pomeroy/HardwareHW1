all: 
	make run
	make view
	make gtkwave

test:
	vcs -full64 -sverilog +lint=all,noVCDE .sv -o testcase

run:
	vcs -full64 -sverilog +lint=all,noVCDE cam_decoder.sv cam.sv cam_test.sv -o test

view:
	dve -full64 -vpd vcdplus.vpd &

gtkwave:
	vcs -vpd2vcd vcdplus.vpd waveform.vcd
	gtkwave waveform.vcd &
