module A0REG (A0,CLK,CEA,RSTA,QA0,A_mux0);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter A0REG = 0;

input [17:0] A0;
input CLK,CEA,RSTA;
output reg [17:0] QA0;
output  [17:0] A_mux0;


always @(posedge CLK or posedge RSTA)begin

if (RSTTYPE == SYNC ) begin
    if (CLK && RSTA ) begin
        QA0 <= 18'b0;
    end
    else if (CEA) QA0 <= A0;
end

else begin
    if (RSTA) QA0 <= 18'b0;
    else if (CEA) QA0 <= A0;
end

end

assign A_mux0 = (A0REG == 0) ? A0 : QA0;

endmodule