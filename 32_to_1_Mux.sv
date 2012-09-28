module 32_to_1_Mux(
	input[31:0] input_lines;
	input[4:0] selector_bits;
	output logic output_line);

	output logic 8_to_1_Mux_0_out;
	output logic 8_to_1_Mux_1_out;	
	output logic 8_to_1_Mux_2_out;
	output logic 8_to_1_Mux_3_out;
	

	8_to_1_Mux mux0(
		.input_lines[7:0](input_lines[7:0]),
		.selector_bits[2:0](selector_bits[2:0]),
		.output_line(8_to_1_Mux_0_out));

	8_to_1_Mux mux1(
		.input_lines[7:0](input_lines[15:8]),
		.selector_bits[2:0](selector_bits[2:0]),
		.output_line(8_to_1_Mux_1_out));

	8_to_1_Mux mux2(
		.input_lines[7:0](input_lines[23:16]),
		.selector_bits[2:0](selector_bits[2:0]),
		.output_line(8_to_1_Mux_2_out));

	8_to_1_Mux mux3(
		.input_lines[7:0](input_lines[31:24]),
		.selector_bits[2:0](selector_bits[2:0]),
		.output_line(8_to_1_Mux_3_out));

	4_to_1_Mux mux4(
		.input_lines[0](8_to_1_Mux_0_out),
		.input_lines[1](8_to_1_Mux_1_out),
		.input_lines[2](8_to_1_Mux_2_out),
		.input_lines[3](8_to_1_Mux_3_out),
		.selector_bits[1:0](selector_bits[4:3]),
		.output_line(output_line));
endmodule
			

	
	
	
