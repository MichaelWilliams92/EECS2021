module LabL;
reg [31:0] a, b, expect;
reg cin, ok; 
wire [31:0] z; 
wire cout;

yAdder #(.SIZE(32), .SIZE2(1)) my_adder(z, cout, a, b, cin); 

initial
begin
cin = 0;

repeat(5)
begin
a = $random;
b = $random;
expect = a + b + cin;
ok = 0;
#1;
if(expect === z)
	ok = 1;
$display("a=%b b=%b cin=%b z=%b ok=%b", a, b, cin, z, ok);
end

$finish;

end
endmodule


