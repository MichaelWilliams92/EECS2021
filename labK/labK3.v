module labK;
reg a, b;  //register without size means 1 ibt
wire notOutput, lowerInput, tmp, z;

not (notOutput, b);
and (z, a, lowerInput);
assign lowerInput = notOutput;

initial
begin
	 a = 1;  b = 1;
	#5 $display("a=%b b=%b z=%b", a, b, z);
         $finish;
end

endmodule
