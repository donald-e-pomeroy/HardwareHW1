module FourToOneMux(
		    input [3:0]  input_lines,
		    input [1:0]  selector_bits,
		    output logic output_line);
	
   always_comb begin
      case (selector_bits)
	2'b00: output_line = input_lines[0];
	2'b01: output_line = input_lines[1];
	2'b10: output_line = input_lines[2];
	2'b11: output_line = input_lines[3];  
      endcase
   end
endmodule
