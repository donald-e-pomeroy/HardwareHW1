// Name: Leonard Robinson
// 
// Date Created:
// Date Modified:
module cam #(parameter WIDTH = 32,parameter ADDR_WIDTH = 5)
   //End Parameter Defs
  (
   input 			clk_i, 
   input 			rst_i,
   input 			read_enable_i, 
   input [ADDR_WIDTH - 1 : 0 ] 	read_index_i,
   input 			write_enable_i,
   input [ADDR_WIDTH - 1 : 0 ] 	write_index_i,
   input [WIDTH - 1 : 0 ] 	write_data_i,
   input 			search_enable_i, 
   input [WIDTH - 1 : 0 ] 	search_data_i,
   
   output 			read_valid_o,
   output [WIDTH - 1 : 0] 	read_value_o,
   output 			search_valid_o,
   output [ADDR_WIDTH - 1 : 0 ] search_index_o
   ); // End Input Defs
   
   //Put inputs on wires inside of the CAM
   wire [ADDR_WIDTH - 1 : 0 ] 	read_index;
   
   wire [WIDTH - 1 : 0] 	dec_read_enable;
   wire [WIDTH - 1 : 0] 	dec_write_enable;
   wire [WIDTH - 1 : 0] 	dec_search_enable;
   
   wire [ADDR_WIDTH - 1 : 0 ] 	selector_bits;
   wire [WIDTH - 1 : 0] 	input_line;
   
   logic [WIDTH - 1 : 0] 	match;   
   logic [WIDTH - 1 : 0] 	readlogic;
   
   
   //Decoder
   cam_decoder decoder(.*,.read_enable_o(dec_read_enable),.write_enable_o(dec_write_enable),.search_enable_o(dec_search_enable));
   
   //Memory Generation
   generate 
      for (genvar j = 0; j < WIDTH; j++) begin
         row		 membit(.clk(clk_i),
				.reset(rst_i),
				.data_i(write_data_i),//Connect All Input Bits to All Row bits
				.write_enable_i(),
				.search_enable_i(),
				.search_i(search_data_i[j]),
				.data_o(data_o[j]),//output read line
				.match_o(match[j])
				);
      end                
   endgenerate

   ThirtyTwoByThirtyTwoMux mux(.input_lines(),.selector_bits(read_index_i),.data_o(read_value_o) );
   
   
   //Search Functionality - P.E.
   priority_encoder priority_en(.data_i(match),.data_o(search_index_o),.valid_o(search_valid_o));
   
endmodule // cam
