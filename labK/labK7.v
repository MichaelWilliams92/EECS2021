module labK;

reg a, b, c;
wire  AandNotC, BandC, z, temp, expect,temp2, cNot;
integer i, j, k;

reg flag;

not (temp,  c);
and(AandNotC, a, temp);
and(BandC, b, c);
or(z, AandNotC, BandC);

//assign AandNotC = temp;
//and(temp, b, c);
//assign BandC = temp;
//or(temp, AandC, BandC);
//assign z = temp;

initial
begin
                     
			 flag = $value$plusargs("a=%b", a);
			 flag = $value$plusargs("b=%b", b);
			 flag = $value$plusargs("c=%b", c);
                //look up how to use flag to detec if an argument is missing
			 
		//expect = ...
			 //wait for z
			//if (expect == z)
			#1	$display(" a=%b b=%b c=%b z=%b", a, b, c, z);
                        
			//else
				//$display("FAIL: a=%b b=%b, z=%b", a, b, z)
			$finish;
end
endmodule
