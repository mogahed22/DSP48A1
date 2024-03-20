module B0REG (CLK,CEB,RSTB,QB,B_mux0,BINPUT,BCASCADED);

parameter SYNC = 1'b0;
parameter ASYNC = 1'b1;
parameter RSTTYPE = SYNC ;
parameter B0REG = 0;
parameter DIRECTION = "DIRECT";

input [17:0]  BINPUT , BCASCADED;
input CLK,CEB,RSTB;
output reg [17:0] QB;
output  [17:0] B_mux0;
wire [17:0] B ;

assign B = (DIRECTION == "DIRECT") ? BINPUT : (DIRECTION == "CASCADED") ? BCASCADED : 18'b0 ;

always @(posedge CLK or posedge RSTB)begin

    if (RSTTYPE == SYNC ) begin
        if (CLK && RSTB ) begin
            QB <= 18'b0;
        end
        else if (CEB) QB <= B;
    end

    else begin
        if (RSTB) QB <= 18'b0;
        else if (CEB) QB <= B;
    end

end

assign B_mux0 = (B0REG==0)? B : QB;

endmodule