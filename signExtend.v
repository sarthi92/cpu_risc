module signExtend(result,din);
output [15:0]result;
input [7:0]din;
assign result=(din[7]&1'd1)?{8'hff,din}:{8'h00,din};
endmodule
