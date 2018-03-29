module labM;
reg [31:0] d, e;
reg clk, enable, flag;
wire [31:0] z;

register #(32) mine(z, d, clk, enable);

initial

begin

	flag = $value$plusargs("enable=%b", enable);
	clk = 0;


end

initial
begin
	repeat (20)
	#2 d = $random;	
	
	$finish;
end

always
begin
	if(clk === 1)
	e = d;

	#5 clk = ~clk;
		
end

initial
$monitor("%5d: clk=%b, d=%d, z=%d, expect=%d", $time, clk, d, z, e);

endmodule
