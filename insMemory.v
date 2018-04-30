module insMemory(insout,pcin,reset);
output reg [15:0]insout;
input [15:0]pcin;
input reset;
reg [7:0]mem[99:0];
always @(*)
begin
if(reset)
begin
mem[0]<=8'b01_010_011;mem[1]<=8'b_001_00000;//add r1,r2,r3
mem[2]<=8'b01_011_100;mem[3]<=8'b_001_00000;//add r1,r3,r4
mem[4]<=8'b01_100_100;mem[5]<=8'b_101_00000;//add r5,r4,r4
mem[6]<=8'b11_001_100;mem[7]<=8'b_00000100;//beq r1,r4,#04
mem[8]<=8'b10_110_111;mem[9]<=8'b_101_00000;//and r5,r6,r7
mem[10]<=8'b00_000_000;mem[11]<=8'b_000_00000;//nop
mem[12]<=8'b01_110_111;mem[13]<=8'b_101_00000;//add r5,r6,r7
mem[14]<=8'b00_000_000;mem[15]<=8'b_000_00000;//nop
mem[16]<=8'b00_000_000;mem[17]<=8'b_000_00000;//nop
mem[18]<=8'b00_000_000;mem[19]<=8'b_000_00000;//nop
mem[20]<=8'b00_000_000;mem[21]<=8'b_000_00000;//nop
insout<={mem[16'd10],mem[16'd11]};//nop
end
else
begin
insout<={mem[pcin],mem[pcin+16'd1]};
end
end
endmodule
