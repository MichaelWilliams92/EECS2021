module labK;
reg a, b;  //register without size means 1 ibt
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
			#1 $display("a=%b b=%b z=%b", a, b, z);
		end
	end
         $finish;
end

endmodule
