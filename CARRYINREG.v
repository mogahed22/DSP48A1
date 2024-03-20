module CARRYINREG (CARRYIN,CLK,CECARRYIN,RSTCARRYIN,QCARRYIN,CARRYIN_mux);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter CARRYINREG = 1;

input  CARRYIN;
input CLK,CECARRYIN,RSTCARRYIN;
output reg  QCARRYIN;
output   CARRYIN_mux;


always @(posedge CLK or posedge RSTCARRYIN)begin

if (RSTTYPE == SYNC ) begin
    if (CLK && RSTCARRYIN ) begin
        QCARRYIN <= 1'b0;
    end
    else if (CECARRYIN) QCARRYIN <= CARRYIN;
end

else begin
    if (RSTCARRYIN) QCARRYIN <= 1'b0;
    else if (CECARRYIN) QCARRYIN <= CARRYIN;
end

end

assign CARRYIN_mux = (CARRYINREG == 0) ? CARRYIN : QCARRYIN;

endmodule