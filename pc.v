module pc(pcout,pcin,beqin,chazard,dhazard,clk,reset);
output reg [15:0]pcout;
input [15:0]pcin,beqin;
input chazard,dhazard,clk,reset;

always @(*)
begin
if(reset)
begin
pcout<=16'd0;
end
end

always @(clk)
begin
if(!reset)
begin
if(dhazard)
pcout<=pcout;//stall
else if(chazard)
pcout<=beqin;//branch
else
pcout<=pcin;//normal op
end
end

endmodule
