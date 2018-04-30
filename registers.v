module registers(rega,regb,regaSelect,regbSelect,wadd,wdata,write,reset);
output reg [15:0]rega,regb;
input [15:0]wdata;
input [2:0]wadd,regaSelect,regbSelect;
input write,reset;
reg [15:0]regs[7:0];
always @(*)
begin
$monitor("%d %d %d %d %d %d %d %d",regs[0],regs[1],regs[2],regs[3],regs[4],regs[5],regs[6],regs[7]);
if(reset)
begin
regs[0]<=16'd0;
regs[1]<=16'd1;
regs[2]<=16'd2;
regs[3]<=16'd0;
regs[4]<=16'd0;
regs[5]<=-16'd3;
regs[6]<=16'd0;
regs[7]<=16'd0;
rega<=16'd0;
regb<=16'd0;
end
else
begin
rega<=regs[regaSelect];
regb<=regs[regbSelect];
if(write)
regs[wadd]<=wdata;
end
end
endmodule
