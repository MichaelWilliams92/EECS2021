module yAdder(z, cout, a, b, cin);
parameter SIZE = 32;
parameter SIZE2 = 1;
integer i;

output [SIZE - 1:0] z;
output [SIZE2 - 1:0] cout;
input [SIZE - 1:0] a, b;
input [SIZE2 - 1:0] cin;
wire [SIZE - 1:0] in, out;

yAdder1 mine[SIZE -1:0] (z, out, a, b, in);

assign in[0] = cin;
assign in[1] = out[0];
assign in[31:2] = out[31:1];

endmodule
