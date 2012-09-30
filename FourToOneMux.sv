module FourToOneMux(
	input [3:0] input_lines,
	input [1:0] selector_bits,
	output logic output_line);
	
	
	always_comb begin
		assign output_line = ((~selector_bits[1])&
		(~selector_bits[0])&input_lines[0])
		|
		((~selector_bits[1])&
		(selector_bits[0])&input_lines[1])
		|
         	((selector_bits[1])&
		(~selector_bits[0])&input_lines[2])
		|
		((selector_bits[1])&
		(selector_bits[0])&input_lines[3]);
	end
endmodule
