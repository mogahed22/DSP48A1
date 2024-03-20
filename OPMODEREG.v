module OPMODEREG (OPMODE,CLK,CEOPMODE,RSTOPMODE,QOPMODE,OPMODE_mux);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter OPMODEREG = 1;

input  [7:0]OPMODE;
input CLK,CEOPMODE,RSTOPMODE;
output reg  [7:0] QOPMODE;
output   [7:0] OPMODE_mux;


always @(posedge CLK or posedge RSTOPMODE)begin

if (RSTTYPE == SYNC ) begin
    if (CLK && RSTOPMODE ) begin
        QOPMODE <= 8'b0;
    end
    else if (CEOPMODE) QOPMODE <= OPMODE;
end

else begin
    if (RSTOPMODE) QOPMODE <= 8'b0;
    else if (CEOPMODE) QOPMODE <= OPMODE;
end

end

assign OPMODE_mux = (OPMODEREG == 0) ? OPMODE : QOPMODE;

endmodule