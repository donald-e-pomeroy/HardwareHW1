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
    input [DATA_WIDTH - 1 : 0] 	 write_data_i, 
    input 			 search_i,
    input [DATA_WIDTH - 1 : 0] 	 search_data_i,

    output logic , 
    output logic [],
    output logic [DATA_WIDTH -1 :0] data
    );

   
   logic [DATA_WIDTH -1 : 0 ] 	enable;
   
   always_comb begin
      
      if(read_i);
      
      else if(write_i);
      
      else if(search_i);

      else;
 
      
   end // always_comb begin
   
   
   
endmodule // cam_decoder
