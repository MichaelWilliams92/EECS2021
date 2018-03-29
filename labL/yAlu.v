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
