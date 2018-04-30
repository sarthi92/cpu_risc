module comparator(zero,rega,regb);
output zero;
input [15:0]rega,regb;
assign zero=(rega==regb);
endmodule
