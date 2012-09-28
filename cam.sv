// Name: Leonard Robinson
// 
//
//
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
   
   output logic        read_valid _ o,
   output logic [31:0] read_value_o,
   
   output logic        search_valid_o,
   output logic [4:0]  search_index_o,
   ); // End Input Defs
   
   //MUX
   wire [SIZE - 1 : 0 ] all_data;
   //Insert MUX Here
   
   //Decoder
   //Put inputs on wires inside of the CAM
   wire [ADDR_WIDTH - 1 : 0] read_index;
   wire [DEPTH - 1 : 0] write_data_i;
   wire [DEPTH - 1 : 0] search_data_i;

   cam_decoder decoder(.write_i, .search_i, );
   


   //Priority Encoder




   //Generator
      

   end
   
   

  endmodule