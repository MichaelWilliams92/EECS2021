module labK;

reg a, b, cIN;
reg[1:0] expect;
wire z, cOUT, aXORb, aANDb, temp;  
integer i, j, k;

xor(aXORb, a, b);
xor(z, cIN, aXORb);

and(aANDb, a, b);
and(temp, cIN, aXORb);
or(cOUT, temp, aANDb);

initial
begin
 
for(i = 0; i < 2; i = i + 1)
begin
	for(j = 0; j < 2; j = j + 1)
	begin
		for(k = 0; k < 2; k = k + 1)
		begin

		#1 a = i; b = j; cIN = k;
		#1 expect = a + b + cIN;
                #1; //wait for z

		if(expect[0] === z && expect[1] === cOUT)
		#5 $display("PASS: a=%b b=%b Cin=%b Cout=%b z=%b", a, b, cIN, cOUT, z);
		else
		#5 $display("FAIL: a=%b b=%b Cin=%b Cout=%b z=%b", a, b, cIN, cOUT, z);
		

		end
	end
end

$finish;

end
endmodule

