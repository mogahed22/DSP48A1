module DREG (D,CLK,CED,RSTD,QD,Dmux);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter DREG = 1;

input [17:0] D;
input CLK,CED,RSTD;
output reg [17:0] QD;
output  [17:0] Dmux;


always @(posedge CLK or posedge RSTD)begin

    if (RSTTYPE == SYNC ) begin
        if (CLK && RSTD ) begin
            QD <= 18'b0;
        end
        else if (CED) QD <= D;
    end

    else begin
        if (RSTD) QD <= 18'b0;
        else if (CED) QD <= D;
    end

end

assign Dmux = (DREG==0)? D : QD;

endmodule