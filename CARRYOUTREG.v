module CARRYOUTREG (CARRYOUT,CLK,CECARRYIN,RSTCARRYIN,QCARRYOUT,CARRYOUT_mux);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter CARRYOUTREG = 1;

input  CARRYOUT;
input CLK,CECARRYIN,RSTCARRYIN;
output reg  QCARRYOUT;
output   CARRYOUT_mux;


always @(posedge CLK or posedge RSTCARRYIN)begin

if (RSTTYPE == SYNC ) begin
    if (CLK && RSTCARRYIN ) begin
        QCARRYOUT <= 1'b0;
    end
    else if (CECARRYIN) QCARRYOUT <= CARRYOUT;
end

else begin
    if (RSTCARRYIN) QCARRYOUT <= 1'b0;
    else if (CECARRYIN) QCARRYOUT <= CARRYOUT;
end

end

assign CARRYOUT_mux = (CARRYOUTREG == 0) ? CARRYOUT : QCARRYOUT;

endmodule