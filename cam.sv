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
   
   output logic			read_valid_o,
   output [WIDTH - 1 : 0] 	read_value_o,
   output 			search_valid_o,
   output [ADDR_WIDTH - 1 : 0 ] search_index_o
   ); // End Input Defs
   
   //Put inputs on wires inside of the CAM
   wire [ADDR_WIDTH - 1 : 0 ] 	read_index;
   
   wire [WIDTH - 1 : 0] 	dec_write_enable;
   
   typedef logic [31:0] 	ThirtyTwoInput;
   ThirtyTwoInput [WIDTH - 1 : 0] row_out_into_mux;
   

   wire [ADDR_WIDTH - 1 : 0 ] 	selector_bits;
   wire [WIDTH - 1 : 0] 	input_line;
   
   logic [WIDTH - 1 : 0] 	match;   
   logic [WIDTH - 1 : 0] 	readlogic;
   
   
   //Decoder
   cam_decoder decoder(.*,.write_enable_o(dec_write_enable));
   
   //Memory Generation
   generate 
      for (genvar j = 0; j < WIDTH; j++) begin
         row		 membit(.clk(clk_i),
				.reset(rst_i),
				.data_i(write_data_i),//Connect All Input Bits to All Row bits
				.write_enable_i(dec_write_enable[j]),
				.search_enable_i,
				.search_data_i,//Connect All the Data Ports!
				.data_o(row_out_into_mux[j]),//output read line
				.match_o(match[j]),
				.read_valid_o(readlogic[j])
				);
      end                
   endgenerate

   always_comb begin
      read_valid_o = readlogic[read_index_i];
   end

   ThirtyTwoByThirtyTwoMux mux(.data_i(row_out_into_mux),.selector_bits(read_index_i),.data_o(read_value_o) );
   
   
   //Search Functionality - P.E.
   priority_encoder priority_en(.data_i(match),.data_o(search_index_o),.valid_o(search_valid_o));
   
endmodule // cam
