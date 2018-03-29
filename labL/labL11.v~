module labL;
reg signed [31:0] a, b;
reg signed [31:0] expect, zero;
reg [2:0] op;
wire ex;
wire [31:0] z;
reg ok, flag;

yAlu mine(z, ex, a, b, op);

initial
begin
	repeat(10)
	begin
	  a = $random;
	  b = $random;
	  flag = $value$plusargs("op=%d", op);

	  if(op === 0)
		expect = a & b;
	  else if(op === 1)
		expect = a | b;
	  else if (op === 2)
		expect = a + b;
	  else if (op === 6)
		expect = a - b;
	  else if (op === 3'b111)
		expect = (a < b) ? 1 : 0;

	  zero = (expect == 0) ? 1 : 0;

	  #1;

	  if(z === expect)
		ok = 1;
	  else
		ok = 0;

	$display("ok=%b a=%b b=%b z=%b expect=%b op=%d", ok, a, b, z, expect, op);

	if(zero !== ex)
		$display("ZERO FAIL: ok=%b a=%b b=%b z=%b expect=%b op=%d", ok, a, b, z, expect, op);

	end
end
endmodule
	  
	
