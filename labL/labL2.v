module LabL;
reg [0:1] a, b; 
reg c;
wire [0:1] z;

yMux2 test(z, a, b, c);

initial
begin
a = 1;
b = 3;
c = 0;



#1 $display("a=%b b=%b c=%b z=%b", a, b, c, z);

$finish;

end
endmodule


