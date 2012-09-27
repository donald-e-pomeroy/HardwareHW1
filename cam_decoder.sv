//Leonard Robinson

module cam_decoder#(parameter DATA_WIDTH = 32,
		    parameter ADDR_WIDTH = 5,
		    parameter DEPTH = (1<<ADDR_WIDTH),
		    parameter SIZE = (DEPTH*DATA_WIDTH))
   //End Parameter Defs
   (
    input 			 read_i,
    input [ADDR_WIDTH - 1 : 0] 	 read_index_i,
    input 			 write_i,
    input [ADDR_WIDTH - 1 : 0] 	 write_index_i,
    input [DEPTH - 1 : 0] 	 write_data_i, 
    input 			 search_i,
    input [DEPTH -1 : 0 ] 	 search_data_i,

    output logic [DEPTH - 1 : 0] read_enable_o,
    output logic [DEPTH - 1 : 0] write_enable_o,
    output logic [DEPTH - 1 : 0] search_enable_o
    );

   logic [DEPTH - 1 : 0] 	enable;
   always_comb begin

   end
   
endmodule // cam_decoder
