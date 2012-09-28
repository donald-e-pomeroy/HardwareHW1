module 8_to_1_Mux(
	input input_lines[7:0];
	input selector_bits[3:0];
	output logic output_line);
	output logic 4_to_1_Mux_0_out;
	output logic 4_to_1_Mux_1 out;

	4_to_1_Mux mux0(
		.input_lines[3:0](input_lines[3:0]),
		.selector_bits[1:0](selector_bits[1:0]),
		.output_line(4_to_1_Mux_0_out));

	4_to_1_Mux mux1(
		.input_lines[3:0](input_lines[7:4]),
		.selector_bits[1:0](selector_bits[1:0]),
		.output_line(4_to_1_Mux_1_out));

	always_comb begin
		assign output_line =  
			(4_to_1_Mux_1_out & selector_bits[2])
			|
			(4_to_1_Mux_0_out & (~selector_bits[2]));
	end
endmodule
	

	

