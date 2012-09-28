// Enabled flip-flop with comparator logic
module flipflop
(
    input clk,
    input data_i,
    input write_enable_i,
    input compare_enable_i,
    input compare_i,
    output reg data_o,
    output match_o
);

   always_ff @(negedge clk) begin
      if (write_enable_i) data_o <= data_i;
   end

   logic match;
   
   always_comb begin
      match = compare_enable_i & (compare_i ~^ data_o);
   end

   assign match_o = match;
  
endmodule



