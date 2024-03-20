module PREG (P,CLK,CEP,RSTP,QP,P_mux);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter PREG = 1;

input [47:0] P;
input CLK,CEP,RSTP;
output reg [47:0] QP;
output  [47:0] P_mux;


always @(posedge CLK or posedge RSTP)begin

if (RSTTYPE == SYNC ) begin
    if (CLK && RSTP ) begin
        QP <= 36'b0;
    end
    else if (CEP) QP <= P;
end

else begin
    if (RSTP) QP <= 48'b0;
    else if (CEP) QP <= P;
end

end

assign P_mux = (PREG == 0) ? P : QP;

endmodule