//Leonard Robinson

module cam_decoder #(parameter WIDTH = 32,
		     parameter ADDR_WIDTH = 5,
	             parameter DEPTH = (1<<ADDR_WIDTH)
		    )
   //End Parameter Defs
   (
    input 			read_enable_i,
    input [ADDR_WIDTH - 1 : 0] 	read_index_i,
    input 			write_enable_i,
    input [ADDR_WIDTH - 1 : 0] 	write_index_i,
    input 			search_enable_i,
    
    output logic [DEPTH - 1 :0 ] write_enable_o, 
    output logic [DEPTH - 1 :0 ] read_enable_o,
    output logic [DEPTH - 1 :0 ] search_enable_o
    );

   logic [DEPTH -1 : 0] 	en_addr_read;//Enabled Address Read
   logic [DEPTH -1 : 0] 	en_addr_write;//Enabled Address Write
   
   always_comb begin      
	for(int iter = 0; iter < DEPTH; iter++) begin
		en_addr_read[iter] = (iter == read_index_i);
		en_addr_write[iter] = (iter == write_index_i);

		read_enable_o[iter] = en_addr_read[iter] & read_enable_i;
		write_enable_o[iter] = en_addr_write[iter] & write_enable_i;
		search_enable_o[iter] = search_enable_i;
	end // end for
 
   end // always_comb begin
      
endmodule // cam_decoder
