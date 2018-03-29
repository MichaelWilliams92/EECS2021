module LabL;
reg signed [31:0] a, b, expect;
reg ctrl, ok; 
wire signed [31:0] z; 
wire cout;

yArith my_adder(z, cout, a, b, ctrl); 

initial
begin

repeat(10)
begin
a = $random;
b = $random;
ctrl = $random % 2;
#1;

if(ctrl === 0)
expect = a + b;
else
expect = a - b;
#1;

if(expect === z)
$display("PASS: a=%d b=%d ctrl=%d z=%d expect=%d", a, b, ctrl, z, expect);
else
$display("FAIL: a=%d b=%d ctrl=%d z=%d expect=%d", a, b, ctrl, z, expect);
end

$finish;

end
endmodule


