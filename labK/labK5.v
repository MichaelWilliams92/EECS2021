module labK;
reg a, b, expect;  //register without size means 1 ibt
wire z, tmp;
integer i, j;

not (tmp, b);
and (z, a, tmp);

initial
begin
	for(i = 0; i < 2; i = i + 1)
	begin
		for(j = 0; j < 2; j = j + 1)
		begin
			 a = i;  b = j;
			expect = i & ~b;
			#1; //wait for z
			if (expect == z)
				$display("PASS: a=%b b=%b z=%b", a, b, z);
			else
				$display("FAIL: a=%b b=%b, z=%b", a, b, z);
			
		end
	end
        $display(tmp);
         $finish;
end

endmodule
