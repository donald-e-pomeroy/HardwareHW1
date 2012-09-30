//Leonard Robinson

module cam_decoder #(parameter WIDTH = 32,
		    parameter ADDR_WIDTH = 5
		    )
   //End Parameter Defs
   (
    input 			read_enable_i,
    input [ADDR_WIDTH - 1 : 0] 	read_index_i,
    input 			write_enable_i,
    input [ADDR_WIDTH - 1 : 0] 	write_index_i,
    input [WIDTH - 1 : 0] 	write_data_i, 
    input 			search_enable_i,
    input [WIDTH - 1 : 0] 	search_data_i,

    output logic [WIDTH - 1 :0] data_o, 
    output logic [WIDTH - 1 :0] data_adr
    );

   logic [ADDR_WIDTH -1 :0] 	enabled_address;
   logic [WIDTH -1 : 0 ] 	enabled_data;
   
   always_comb begin      
      if(read_enable_i) begin
	 enabled_address = read_index_i;
      end
      
      else if(write_enable_i) begin
	 enabled_data = write_data_i;
	 enabled_address = write_address
      end
      
      else if(search_enable_i)begin
	 enabled_data = search_data_i;
      end
      
      else ;
 
   end // always_comb begin
   
   assign data_o = enabled_data;
   assign data_adr = enabled_address;
   
   
endmodule // cam_decoder
