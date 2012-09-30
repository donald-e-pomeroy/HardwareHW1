// Name: Leonard Robinson
// 
// Date Created:
// Date Modified:
module cam #(parameter WIDTH = 32,parameter ADDR_WIDTH = 5)
   //End Parameter Defs
  (
   input 	       clk_i, 
   input 	       rst_i,
   input 	       read_enable_i, 
   input [4:0] 	       read_index_i,
   input 	       write_enable_i,
   input [4:0] 	       write_index_i,
   input [31:0]        write_data_i,
   input 	       search_enable_i, 
   input [31:0]        search_data_i,
   
   output        read_valid_o,
   output [31:0] read_value_o,
   output        search_valid_o,
   output [4:0]  search_index_o
   ); // End Input Defs
   
   //Decoder
   //Put inputs on wires inside of the CAM
   wire [ADDR_WIDTH - 1 : 0] read_index;
   wire [WIDTH - 1 : 0] write_data_i;
   wire [WIDTH- 1 : 0] search_data_i;

   cam_decoder decoder(.read_enable_i, .read_index_i, .write_enable_i,.write_index_i,.write_data_i,.search_enable_i,.search_data_i);
   
  //Memory Generation
  //Makin 32 of these.	

row mem_row(.clk, .rst_i, .decoder(data_o), .write_enable_i, .search_enable_i, .search_data_i);
   
//   priority_encoder priority_en(,,);
   
//   32_to_1_Mux mux(,,);
   
endmodule // cam
