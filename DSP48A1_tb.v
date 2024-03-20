module DSP48A1_tb();

//parameters
parameter SYNCD_tb = 1'b0;
parameter ASYNCD_tb = 1'b1;
parameter RSTTYPED_tb = SYNCD_tb ;
parameter A0REGD_tb = 0 ;
parameter A1REGD_tb = 1;
parameter B0REGD_tb = 0;
parameter B1REGD_tb = 1;
parameter DIRECTIOND_tb = "DIRECT";
parameter CREGD_tb = 1;
parameter DREGD_tb = 1;
parameter PREGD_tb = 1;
parameter CARRYOUTREGD_tb = 1;
parameter CARRYINREGD_tb = 1;
parameter OPMODEREGD_tb = 1;
parameter MREGD_tb = 1;

parameter CARRYINSEL_tb = "OPMODE5";


//regs decleration
reg [17:0] AIN_tb,BIN_tb,DIN_tb,BCIN_tb;
reg [47:0] CIN_tb,PCIN_tb;
reg [7:0] OPMODEIN_tb;
reg CARRYININ_tb,PCLK_tb,PCE_tb,PRST_tb;
reg [47:0] XIN0_tb , ZIN0_tb;


//wires decleration
wire [47:0] P_tb,PCOUT_tb;
wire [35:0] M_tb;
wire [17:0] BCOUT_tb;
wire CARRYOUTOUT_tb,CARRYOUTOUTOFF_tb;

DSP48A1 #(.SYNCD(SYNCD_tb),.ASYNCD(ASYNCD_tb),.RSTTYPED(RSTTYPED_tb),.A0REGD(A0REGD_tb),.A1REGD(A1REGD_tb),.B0REGD(B0REGD_tb),
.B1REGD(B1REGD_tb),.DIRECTIOND(DIRECTIOND_tb),.CREGD(CREGD_tb),.DREGD(DREGD_tb),.PREGD(PREGD_tb),.CARRYINREGD(CARRYINREGD_tb),
.CARRYOUTREGD(CARRYOUTREGD_tb),.OPMODEREGD(OPMODEREGD_tb),.MREGD(MREGD_tb),.CARRYINSEL(CARRYINSEL_tb)) DSP48A1_tb (.AIN(AIN_tb),.BIN(BIN_tb)
,.DIN(DIN_tb),.BCIN(BCIN_tb),.CIN(CIN_tb),.PCIN(PCIN_tb),.OPMODEIN(OPMODEIN_tb),.CARRYININ(CARRYININ_tb),.PCLK(PCLK_tb),
.PCE(PCE_tb),.PRST(PRST_tb),.XIN0(XIN0_tb),.ZIN0(ZIN0_tb),
.P(P_tb),.PCOUT(PCOUT_tb),.M(M_tb),.BCOUT(BCOUT_tb),.CARRYOUTOUT(CARRYOUTOUT_tb),.CARRYOUTOUTOFF(CARRYOUTOUTOFF_tb));

initial begin
    forever begin
        PCLK_tb = 0;
        #1 PCLK_tb = ~PCLK_tb;
    end
    
end

initial begin
    AIN_tb = 18'b111100000000000000;
    BIN_tb = 18'b000011110000000000;
    DIN_tb = 18'b000000001111000000;
    BCIN_tb = 18'b000000000000111100;
    CIN_tb = 48'b111111111111111111110000000000000000000011111111;
    PCIN_tb = 48'b000000000000000000001111111111111111111100000000;
    XIN0_tb = 48'b0;
    ZIN0_tb = 48'b0;
    repeat (10000) begin
    OPMODEIN_tb = $random;
    CARRYININ_tb = $random;
    PCE_tb = $random;
    PRST_tb = $random;
    @(negedge PCLK_tb);
    end
    $stop;
    end
endmodule