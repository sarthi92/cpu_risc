`timescale 1ns / 1ps
module tb_risc();
reg clk,reset;
wire [15:0]ifir,idir,exir,ifpc,baddr;
wire [1:0]aluSelect;
wire chazard,dhazard,zero;
wire [15:0]pcin,pcout,beqin,result,aluout,exout;
wire [15:0]rega,regb,ain,bin,insout;
wire write;
riscTop uut(ifir,idir,exir,ifpc,baddr,aluSelect,chazard,dhazard,zero,pcin,pcout,beqin,result,aluout,exout,rega,regb,ain,bin,insout,write,clk,reset);
initial
begin
clk=1'd0;
reset=1'd1;
#11 reset=1'd0;
end
always #10 clk=~clk;
endmodule
