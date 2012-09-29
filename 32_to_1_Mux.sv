module ThirtyTwoToOneMux(
	input [31:0] input_lines,
	input [4:0]  selector_bits,
	output logic output_line);
   
	logic muxZeroOut;
	logic muxOneOut;	
	logic muxTwoOut;
	logic muxThreeOut;

	logic[3:0] muxOutputs;

	eightToOneMux mux0(
		.input_lines(input_lines[7:0]),
		.selector_bits(selector_bits[2:0]),
		.output_line(muxZeroOut));

	eightToOneMux mux1(
		.input_lines(input_lines[15:8]),
		.selector_bits(selector_bits[2:0]),
		.output_line(muxOneOut));

	eightToOneMux mux2(
		.input_lines(input_lines[23:16]),
		.selector_bits(selector_bits[2:0]),
		.output_line(muxTwoOut));

	eightToOneMux mux3(
		.input_lines(input_lines[31:24]),
		.selector_bits(selector_bits[2:0]),
		.output_line(muxThreeOut));

	always_comb begin
		muxOutputs[0] = muxZeroOut;
		muxOutputs[1] = muxOneOut;
		muxOutputs[2] = muxTwoOut;
		muxOutputs[3] = muxThreeOut;
	end

	fourToOneMux mux4(
		.input_lines(muxOutputs),
		//.input_lines[1](muxOneOut),
		//.input_lines[2](muxTwoOut),
		//.input_lines[3](muxThreeOut),
		.selector_bits(selector_bits[4:3]),
		.output_line(output_line));
endmodule // 32_to_1_Mux

			

	
	
	
