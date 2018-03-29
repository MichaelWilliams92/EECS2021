module labM;
reg [31:0] wd;
reg [4:0] rn1, rn2, wn;
reg clk, w, flag;

integer i;

wire [31:0] rd1, rd2;

rf myRF(rd1, rd2, rn1, rn2, wn, wd, clk, w);

initial
begin
flag = $value$plusargs("w=%b", w);
for(i = 0; i < 32; i = i + 1)
begin
	clk = 0;
	wd = i * i;
	wn = 1;
	clk = 1;
	#1;
end

repeat(10)
begin
rn1 = $random;
rn2 = $random;

#1 $display("rn1=%d rn2=%d rd1=%d rd2=%d", rn1, rn2, rd1, rd2); 
end

end
endmodule




