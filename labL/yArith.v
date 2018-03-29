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
