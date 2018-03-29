module LabL;
reg a, b, cin, expect; 
wire z, cout;
integer i, j, k;

yAdder1 my_adder(z, cout, a, b, cin); 

initial
begin
	for(i = 0; i < 2; i = i + 1)
	begin
  		for(j = 0; j < 2; j = j + 1)
		begin
			for(k = 0; k < 2; k = k + 1)
			begin
			a = i; b = j; cin = k;
			#1;
			expect = a+b+cin;
			if(expect !=cout || expect !=z) 
			$display("a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
			
			end
		end
	end

$finish;

end
endmodule


