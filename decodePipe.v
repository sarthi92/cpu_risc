module decodePipe(insout,pcout,insin,pcin,chazard,dhazard,clk,reset);
output reg [15:0]insout,pcout;
input [15:0]insin,pcin;
input chazard,dhazard;
input clk,reset;

always @(*)
begin
if(reset)
begin
insout<=16'd0;
pcout<=16'd0;
end
end

always @(clk)
begin
if(!reset)
begin
if(dhazard)
begin
insout<=insout;//stall
pcout<=pcout;
end
else if(chazard)
begin
insout<=16'd0;//bubble (nop)
pcout<=16'd0;
end
else
begin
insout<=insin;//normal op
pcout<=pcin;
end
end
end

endmodule