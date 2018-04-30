module writebackPipe(insout,dout,insin,din,clk,reset);
output reg [15:0]insout,dout;
input [15:0]insin,din;
input clk,reset;

always @(*)
begin
if(reset)
begin
insout<=16'd0;
dout<=16'd0;
end
end

always @(clk)
begin
if(!reset)
begin
insout<=insin;
dout<=din;
end
end

endmodule