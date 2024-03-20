module MREG (M,CLK,CEM,RSTM,QM,M_mux);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter MREG = 1;

input [47:0] M;
input CLK,CEM,RSTM;
output reg [47:0] QM;
output  [47:0] M_mux;


always @(posedge CLK or posedge RSTM)begin

if (RSTTYPE == SYNC ) begin
    if (CLK && RSTM ) begin
        QM <= 47'b0;
    end
    else if (CEM) QM <= M;
end

else begin
    if (RSTM) QM <= 47'b0;
    else if (CEM) QM <= M;
end

end

assign M_mux = (MREG == 0) ? M : QM;

endmodule