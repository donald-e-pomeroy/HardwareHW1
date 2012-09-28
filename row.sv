// A row of 32 flipflops
module row #(parameter WIDTH=32)
(
 input 			clk,
 input [WIDTH-1:0] 	data_i,
 input 			write_enable_i,
 input 			compare_enable_i,
 input [WIDTH-1:0] 	compare_i,
 output reg [WIDTH-1:0] data_o,
 output 		match_o
);

   logic [WIDTH-1:0]      match;

   generate 
      for (genvar j = 0; j < WIDTH; j++) begin
         flipflop membit(.clk,
                         .data_i(data_i[j]),
                         .write_enable_i,
                         .compare_enable_i,
                         .compare_i(compare_i[j]),
                         .data_o(data_o[j]),
                         .match_o(match[j])
                        );
      end                
   endgenerate

   logic combined;
   always_comb begin
      // combined is true when all bits of match are true
      combined = &match;
   end
   assign match_o = combined;
    
endmodule

