module riscTop(ifir,idir,exir,ifpc,baddr,aluSelect,chazard,dhazard,zero,pcin,pcout,beqin,result,aluout,exout,rega,regb,ain,bin,insout,write,clk,reset);
input clk,reset;
output [15:0]ifir,idir,exir,ifpc,baddr;
output [1:0]aluSelect;
output chazard,dhazard,zero;
output [15:0]pcin,pcout,beqin,result,aluout,exout;
output [15:0]rega,regb,ain,bin,insout;
output write;
assign write=exir[15]^exir[14];//enables writeback on ADD,AND

adder PCINC(pcin,pcout,2'd2);//normally increments pc by 2 bytes
adder PCBEQ(beqin,ifpc,baddr);//increments pc by pc-relative branch address
shifter SHIFT(baddr,result);//left shifts branch address by 1 unit
signExtend EXTEND(result,ifir[7:0]);//transforms 8-bit branch address into 16-bit
pc PC(pcout,pcin,beqin,chazard,dhazard,clk,reset);//pc register
comparator EQ(zero,rega,regb);//compares regiter values rega & regb
alu ALU(aluout,ain,bin,exout,aluSelect,idir[15:14]);//datapath alu
insMemory MEM(insout,pcout,reset);//instruction memory
registers REGS(rega,regb,ifir[13:11],ifir[10:8],exir[7:5],exout,write,reset);//register file
decodePipe P1(ifir,ifpc,insout,pcin,chazard,dhazard,clk,reset);//IF-ID Pipe
executePipe P2(idir,ain,bin,ifir,rega,regb,dhazard,clk,reset);//ID-EX Pipe
writebackPipe P3(exir,exout,idir,aluout,clk,reset);//EX-WB Pipe
controller CONTROL(chazard,dhazard,aluSelect,ifir,idir,exir,zero);//Control, Hazard Detection & Forwarding Unit
endmodule
