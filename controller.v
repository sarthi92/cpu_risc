module controller(chazard,dhazard,aluSelect,ifir,idir,exir,zero);
output reg chazard,dhazard;
output reg [1:0]aluSelect;
input [15:0]ifir,idir,exir;
input zero;
always @(*)
begin
aluSelect=2'b00;
if(exir[15:14]==2'b01||exir[15:14]==2'b10)//data forwarding to handle RAW hazard
    begin
    if(idir[13:11]==exir[7:5])
    aluSelect[1]<=1'd1;
    if(idir[10:8]==exir[7:5])
    aluSelect[0]<=1'd1;
    end
if(ifir[15:14]==2'b11 && (idir[15:14]==2'b01 || idir[15:14]==2'b10) && (ifir[13:11]==idir[7:5]||ifir[10:8]==idir[7:5]))//handling RAW+Control Hazard
dhazard<=1'd1;
else
begin
dhazard<=1'd0;
if(ifir[15:14]==2'b11 && zero)//handling Control Hazard
chazard<=1'd1;
else
chazard<=1'd0;
end
end
endmodule
