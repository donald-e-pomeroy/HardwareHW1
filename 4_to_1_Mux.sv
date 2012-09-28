module 4_to_1_mux(
	input input_lines[3:0],
	input selector_bits[1:0],
	output logic output_line);
	

	always_comb begin
		assign output_line = ((~selector_bit[1])&
		(~selector_bit[0])&input_line[0])
		|
		((~selector_bit[1])&
		(selector_bit[0])&input_line[1])
		|
         	((selector_bit[1])&
		(~selector_bit[0])&input_line[2])
		|
		((selector_bit[1])&
		(selector_bit[0])&input_line[3]);
	end
endmodule
