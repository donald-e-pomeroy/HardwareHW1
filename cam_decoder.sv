//Leonard Robinson

module cam_decoder_rev #(parameter WIDTH = 32,
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
    input [WIDTH - 1 : 0] 	search_data_i, 
    
    output logic [DEPTH - 1 :0 ] write_enable_o, 
    output logic [DEPTH - 1 :0 ] read_enable_o,
    output logic [DEPTH - 1 :0 ] compare_enable_o
    );

   logic [DEPTH -1 : 0] 	en_addr_read;//Enabled Address Read
   logic [DEPTH -1 : 0] 	en_addr_write;//Enabled Address Write
   logic [DEPTH -1 : 0] 	en_addr_search;//Enabled Address Search
   
   always_comb begin      
	for(int iter = 0; iter < DEPTH; iter++) begin
		en_addr_read[iter] = (iter == read_index_i);
		en_addr_write[iter] = (iter == write_index_i);
		en_addr_search[iter] = (iter == search_data_i);//Correct?
		read_enable_o[iter] = en_addr_read[iter] & read_enable_i;//Read enable necessary?
		write_enable_o[iter] = en_addr_write[iter] & write_enable_i;
		compare_enable_o[iter] = en_addr_search[iter] & search_enable_i;
	end // end for
 
   end // always_comb begin
      
endmodule // cam_decoder
