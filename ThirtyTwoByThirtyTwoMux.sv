typedef logic [31:0] thirtyTwoInput;

module ThirtyTwoByThirtyTwoMux(input thirtyTwoInput [31:0] data_i, 
	input [4:0] selector_bits,
	output logic[31:0] data_o);

	generate
		for(genvar iter=0;iter<32;iter++)begin
				ThirtyTwoToOneMux muxArray[iter](
					.input_lines(data_i[iter]),
					.selector_bits(selector_bits),
					.output_line(data_o[iter]));
		end
	endgenerate
	
endmodule	 
