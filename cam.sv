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
   input [ADDR_WIDTH - 1 :0 ] 	       read_index_i,
   input 	       write_enable_i,
   input [ADDR_WIDTH - 1 :0 ] 	       write_index_i,
   input [WIDTH - 1 :0]        write_data_i,
   input 	       search_enable_i, 
   input [WIDTH - 1:0]        search_data_i,
   
   output        read_valid_o,
   output [WIDTH - 1 : 0] read_value_o,
   output        search_valid_o,
   output [ADDR_WIDTH - 1:0]  search_index_o
   ); // End Input Defs
   
   //Decoder
   //Put inputs on wires inside of the CAM
   wire [ADDR_WIDTH - 1 : 0] read_index;
   wire [WIDTH - 1 : 0] write_data_i;

   wire [WIDTH- 1 : 0] dec_read_enable;
   wire [width -1 : 0] dec_write_enable;
   wire [width -1 : 0] dec_compare_enable;

   cam_dec_rev decoder(.read_enable_i, 
.read_index_i, 
.write_enable_i,
.write_index_i,
.write_data_i,
.search_enable_i,
.search_data_i,
.data_o(dec_data_o),
.data_addr_o(dec_addr_o));
   
  //Memory Generation
  //Makin 32 of these.	

row row1(.clk, .rst_i, ., .write_enable_i, .search_enable_i, .search_data_i);
   
row row2()

row row3()

row row4()
//   priority_encoder4 priority_en(,,);
   
//   32_to_1_Mux mux(,,);
   
endmodule // cam
