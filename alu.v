module alu(result,ain,bin,exout,select,op);
output reg [15:0]result;
input [15:0]ain,bin,exout;
input [1:0]op,select;
always @(*)
begin
case(select)
2'b00:
    begin
    case(op)
    2'b01:result<=ain+bin;
    2'b10:result<=ain&bin;
    endcase
    end
2'b01:
    begin
    case(op)
    2'b01:result<=ain+exout;
    2'b10:result<=ain&exout;
    endcase
    end
2'b10:
    begin
    case(op)
    2'b01:result<=exout+bin;
    2'b10:result<=exout&bin;
    endcase
    end
2'b11:
    begin
    case(op)
    2'b01:result<=exout+exout;
    2'b10:result<=exout&exout;
    endcase
    end
default:
    result<=ain+bin;
endcase
end
endmodule
