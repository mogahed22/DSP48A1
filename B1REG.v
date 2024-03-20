module B1REG (B1,CLK,CEB,RSTB,QB1,B_mux1);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter B1REG = 1;

input [17:0] B1;
input CLK,CEB,RSTB;
output reg [17:0] QB1;
output  [17:0] B_mux1;


always @(posedge CLK or posedge RSTB)begin

if (RSTTYPE == SYNC ) begin
    if (CLK && RSTB ) begin
        QB1 <= 18'b0;
    end
    else if (CEB) QB1 <= B1;
end

else begin
    if (RSTB) QB1 <= 18'b0;
    else if (CEB) QB1 <= B1;
end

end

assign B_mux1 = (B1REG == 0) ? B1 : QB1;

endmodule