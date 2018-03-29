module yMux1(z, a, b, c);
output z;
input a, b, c;

wire notC, upper, lower;

not my_not(notC, c);
and upperAnd(upper, a, notC);
and lowerAnd(lower, c, b);
or my_or(z, upper, lower);

endmodule
module yMux(z, a, b, c);
parameter SIZE = 2;
output [SIZE - 1:0] z;
input [SIZE - 1:0] a, b;
input c;

yMux1 mine[SIZE - 1:0](z, a, b, c);


endmodule 
module yMux4to1(z, a0, a1, a2, a3, c);
parameter SIZE = 2;
output [SIZE - 1:0] z;
input [SIZE - 1:0] a0, a1, a2, a3;
input [1:0] c;
wire [SIZE - 1 :0] zLo, zHi;

yMux #(SIZE) lo(zLo, a0, a1, c[0]);
yMux #(SIZE) hi(zHi, a2, a3, c[0]);
yMux #(SIZE) final(z, zLo, zHi, c[1]);


endmodule 
module yAdder1(z, cout, a, b, cin);
output z, cout;
input a, b, cin;

xor left_xor(tmp, a, b);
xor right_xor(z, cin, tmp);
and left_and(outL, a, b);
and right_and(outR, tmp, cin);
or my_or(cout, outR, outL);

endmodule
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
module yArith(z, cout, a, b, ctrl);
//if ctrl = 1, use not b
output signed [31:0] z;
output cout;
input signed [31:0] a, b;
input ctrl;
wire signed [31:0] notB, tmp;
wire cin;

xor xorB[31:0](notB, b, ctrl); //using xor will make notB = b is ctrl = 0, else it will
				//negate the value when ctrl = 1 to simuulate subtraction 
yAdder mine1(z, cout, a, notB, ctrl);
	
endmodule
module yAlu(z, ex, a, b, op);
input [31:0] a, b;
input [2:0] op;
output [31:0] z;
output ex;
wire [31:0] z_arith, z_and, z_or, z_slt;
wire tmp;
wire[15:0] or16;
wire[7:0] or8;
wire[3:0] or4;
wire[1:0] or2;
wire cout;

assign z_slt[31:1] = 0;
assign ex = 0;  //not supported


xor (tmp, a[31], b[31]);
assign z_slt[0] = (tmp === 1) ? a[31] : z_arith[31];


yArith my_arith[31:0] (z_arith, ex, a, b, op[2]);

and my_and[31:0] (z_and, a, b);
or my_or[31:0] (z_or, a, b);

yMux4to1 #(.SIZE(32)) my_mux(z, z_and, z_or, z_arith, z_slt, op[1:0]);

or or_16[15:0] (or16, z[31:16], z[15:0]);
or or_8[7:0]   (or8, or16[15:8], or16[7:0]); 
or or_4[3:0]   (or4, or8[7:4], or8[3:0]);
or or_2[1:0]   (or2, or4[3:2], or4[1:0]);
nor nor_1      (ex, or2[1], or2[0]);

endmodule
