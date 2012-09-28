// Name: Leonard Robinson
// 
// Date Created:
// Date Modified:
module cam#(parameter DATA_WIDTH = 32,
	    parameter ADDR_WIDTH = 5,
	    parameter DEPTH = (1 << ADDR_WIDTH),
	    parameter SIZE = (DEPTH*DATA_WIDTH))
   //End Parameter Defs
  (
   input 	       clk_i, 
   input 	       rst_i,
   input 	       read_i, 
   input [4:0] 	       read_index_i,
   input 	       write_i,
   input [4:0] 	       write_index_i,
   input [31:0]        write_data_i,
   input 	       search_i, 
   input [31:0]        search_data_i,
   
   output logic        read_valid_o,
   output logic [31:0] read_value_o,
   output logic        search_valid_o,
   output logic [4:0]  search_index_o,
   ); // End Input Defs
   
   //MUX
   wire [SIZE - 1 : 0 ] all_data;
   32_to_1_Mux mux();
//32_to_1_Mux(
//	input[31:0] input_lines,
//	input[4:0] selector_bits,
//	output logic output_line),//
   
   
   //Decoder
   //Put inputs on wires inside of the CAM
   wire [ADDR_WIDTH - 1 : 0] read_index;
   wire [DEPTH - 1 : 0] write_data_i;
   wire [DEPTH - 1 : 0] search_data_i;

   cam_decoder decoder(.read_i, .read_index_i, .write_i,.write_index_i,.write_data_i,.search_i,.search_data_i);
   


   //Priority Encoder
   priority_encoder pe();
   


   //Memory
   generate
     
      flipflop ff(.clk, ., write_i, );
   
   endgenerate
     


   
   

endmodule // cam
