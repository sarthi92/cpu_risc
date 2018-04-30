module executePipe(insout,regaout,regbout,insin,rega,regb,dhazard,clk,reset);
output reg [15:0]insout,regaout,regbout;
input [15:0]insin,rega,regb;
input dhazard,clk,reset;

always @(*)
begin
if(reset)
begin
insout<=16'd0;
regaout<=16'd0;
regbout<=16'd0;
end
end

always @(clk)
begin
if(!reset)
begin
if(dhazard)
begin
insout<=16'd0;//bubble (nop)
regaout<=16'd0;
regbout<=16'd0;
end
else
begin
insout<=insin;//normal op
regaout<=rega;
regbout<=regb;
end
end
end

endmodule
