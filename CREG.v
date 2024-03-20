module CREG (C,CLK,CEC,RSTC,QC,Cmux);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter CREG = 1;

input [47:0] C;
input CLK,CEC,RSTC;
output reg [47:0] QC;
output  [47:0] Cmux;


always @(posedge CLK or posedge RSTC)begin

    if (RSTTYPE == SYNC ) begin
        if (CLK && RSTC ) begin
            QC <= 18'b0;
        end
        else if (CEC) QC <= C;
    end

    else begin
        if (RSTC) QC <= 18'b0;
        else if (CEC) QC <= C;
    end

end

assign Cmux = (CREG==0)? C : QC;

endmodule