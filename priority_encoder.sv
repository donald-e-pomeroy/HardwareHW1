//
//
//
//

module priority_encoder(input[31:0] data_i,output logic[4:0] data_o, output valid_o);
	always_comb begin
		casex(data_i)
			32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1: data_o= 5'b00000; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx10: data_o= 5'b00001; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxx100: data_o= 5'b00010; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxx1000: data_o= 5'b00011; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxxxxxxxx10000: data_o= 5'b00100; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxxxxxxx100000: data_o= 5'b00101; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxxxxxx1000000: data_o= 5'b00110; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxxxxx10000000: data_o= 5'b00111; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxxxx100000000: data_o= 5'b01000; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxxx1000000000: data_o= 5'b01001; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxxx10000000000: data_o= 5'b01010; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxxx100000000000: data_o= 5'b01011; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxxx1000000000000: data_o= 5'b01100; valid_o='1;
			32'bxxxxxxxxxxxxxxxxxx10000000000000: data_o= 5'b01101; valid_o='1;
			32'bxxxxxxxxxxxxxxxxx100000000000000: data_o= 5'b01110; valid_o='1;
			32'bxxxxxxxxxxxxxxxx1000000000000000: data_o= 5'b01111; valid_o='1;
			32'bxxxxxxxxxxxxxxx10000000000000000: data_o= 5'b10000; valid_o='1;
			32'bxxxxxxxxxxxxxx100000000000000000: data_o= 5'b10001; valid_o='1;
			32'bxxxxxxxxxxxxx1000000000000000000: data_o= 5'b10010; valid_o='1;
			32'bxxxxxxxxxxxx10000000000000000000: data_o= 5'b10011; valid_o='1;
			32'bxxxxxxxxxxx100000000000000000000: data_o= 5'b10100; valid_o='1;
			32'bxxxxxxxxxx1000000000000000000000: data_o= 5'b10101; valid_o='1;
			32'bxxxxxxxxx10000000000000000000000: data_o= 5'b10110; valid_o='1;
			32'bxxxxxxxx100000000000000000000000: data_o= 5'b10111; valid_o='1;
			32'bxxxxxxx1000000000000000000000000: data_o= 5'b11000; valid_o='1;
			32'bxxxxxx10000000000000000000000000: data_o= 5'b11001; valid_o='1;
			32'bxxxxx100000000000000000000000000: data_o= 5'b11010; valid_o='1;
			32'bxxxx1000000000000000000000000000: data_o= 5'b11011; valid_o='1;
			32'bxxx10000000000000000000000000000: data_o= 5'b11100; valid_o='1;
			32'bxx100000000000000000000000000000: data_o= 5'b11101; valid_o='1;
			32'bx1000000000000000000000000000000: data_o= 5'b11110; valid_o='1;
			32'b10000000000000000000000000000000: data_o= 5'b11111; valid_o='1;
			default:                              data_o= '0;       valid_o='0;
		endcase // casex (data_i)
	end // always_comb
endmodule

