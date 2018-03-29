module labM;
reg [31:0] PCin;
reg clk, RegDst, RegWrite, ALUSrc;
reg [2:0] op;
wire [31:0] ins, PCp4, z, wd, rd1, rd2, imm;
wire [25:0] jTarget;
wire zero;

yIF myIF(ins, PCp4, PCin, clk);
yID myID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
yEX myEx(z, zero, rd1, rd2, imm, op, ALUSrc);
assign wd = z;

initial
begin
//-------------------entry point
PCin = 128;
//--------------------------------run program
repeat(11)
	begin
	//-----fetch an ins
	clk = 1; #1;
	//--------set control signals
	RegDst = 0;
	RegWrite = 0;
	ALUSrc = 1;
	op = 2;

	if(ins[31:26] === 0) //Rtype
	begin
		RegDst = 1;
		RegWrite = 1;
		ALUSrc = 0;
	end
	else if (ins[31:26] === 2)//J-Type
	begin
		RegDst = 0;
		RegWrite = 1;
		ALUSrc = 1;
	end
	//--------------------------------------Execute the ins
	clk = 0;
	//--------------------------------View Results
	$display("%h: rd1:%2d rd2:%2d imm:%h jTarget:%h z:%2d zero:1d", ins, rd1, rd2, imm, jTarget, z, zero);
	//Add statement to prepare for next instructions
	PCin = PCp4;
	end
	$finish;
end
endmodule
