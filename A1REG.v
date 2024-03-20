module A1REG (A1,CLK,CEA,RSTA,QA1,A_mux1);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter A1REG = 1;

input [17:0] A1;
input CLK,CEA,RSTA;
output reg [17:0] QA1;
output  [17:0] A_mux1;


always @(posedge CLK or posedge RSTA)begin

if (RSTTYPE == SYNC ) begin
    if (CLK && RSTA ) begin
        QA1 <= 18'b0;
    end
    else if (CEA) QA1 <= A1;
end

else begin
    if (RSTA) QA1 <= 18'b0;
    else if (CEA) QA1 <= A1;
end

end

assign A_mux1 = (A1REG == 0) ? A1 : QA1;

endmodule