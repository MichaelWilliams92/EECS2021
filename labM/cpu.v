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

module yIF(ins, PCp4, PCin, clk);
output [31:0] ins, PCp4;
input [31:0] PCin;
input clk;

wire [31:0] address, memIn;
wire ex;

register #(32) mine(address, PCin, clk, 1);
mem data(ins, address, memIn, clk, 1, 0);
yAlu test(PCp4, ex, address, 4, 2);

endmodule

module yID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
output [31:0] rd1, rd2, imm;
output [25:0] jTarget;
input [31:0] ins, wd;
input RegDst, RegWrite, clk;

wire [4:0] wn, rn1, rn2, rd;

assign rn1 = ins[25:21];
assign rn2 = ins[20:16];
assign imm = ins[15:0];
assign jTarget = ins[25:0];
assign rd = ins[15:11];

yMux #(16) se(imm[31:16], 0, 18'b1111111111111111, ins[15]);
rf ID(rd1, rd2, rn1, rn2, wn, wd, clk, RegWrite);
yMux #(5) xe(wn, rn2, ins[15:11], RegDst);

//mem data(memOut, address, memIn, clk, read, write); 
endmodule

module yEX(z, zero, rd1, rd2, imm, op, ALUSrc);
output [31:0] z;
output zero;
input [31:0] rd1, rd2, imm;
input [2:0] op;
input ALUSrc;

wire [31:0] b;

yMux #(32) me(b, rd2, imm, ALUSrc);
yAlu zxc(z, zero, rd1, b, op);
endmodule

module yDM(memOut, exeOut, rd2, clk, MemRead, MemWrite);
output [31:0] memOut;
input [31:0] exeOut, rd2;
input clk, MemRead, MemWrite;
mem dmem(memOut, exeOut, rd2, clk, MemRead, MemWrite);
endmodule

module yWB(wb, exeOut, memOut, Mem2Reg);
output [31:0] wb;
input [31:0] exeOut, memOut;
input Mem2Reg;
yMux #(32) muxwb(wb, exeOut, memOut, Mem2Reg);
endmodule
