module LabL;
reg [31:0] a, b, expect; 
reg c;
wire [31:0] z;

yMux #(.SIZE(32)) my_mux(z, a, b, c);

initial
begin
	repeat(10)   //repeat(10)
	begin
			a = $random;
			b = $random;
			c = $random % 2;
			#1;

			if(c == 0)
			expect = a;
			
			else
			expect = b;

			if(expect == z)
			$display("PASS: a=%b b=%b c=%b z=%b", a, b, c, z);

			if(expect != z)
			$display("FAIL: a=%b b=%b c=%b z=%b", a, b, c, z);
	end

$finish;

end
endmodule


