module eightToOneMux(
	input [7:0]input_lines,
	input [2:0]selector_bits,
	output logic output_line);
	logic muxZerOut;
	logic muxOneOut;

	fourToOneMux mux0(
		.input_lines(input_lines[3:0]),
		.selector_bits(selector_bits[1:0]),
		.output_line(muxZeroOut));

	fourToOneMux mux1(
		.input_lines(input_lines[7:4]),
		.selector_bits(selector_bits[1:0]),
		.output_line(muxOneOut));

	always_comb begin
		assign output_line =  
			(muxOneOut & selector_bits[2])
			|
			(muxZeroOut & (~selector_bits[2]));
	end
endmodule
	

	
