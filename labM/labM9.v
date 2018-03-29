module labM;
reg [31:0] PCin;
reg RegDst, RegWrite, ALUSrc, clk, Mem2Reg, MemRead, MemWrite;
reg [2:0] op;
wire [31:0] ins, PCp4, z, wd, rd1, rd2, imm, memOut, wb;
wire [25:0] jTarget;
wire zero;

yIF myIF(ins, PCp4, PCin, clk);
yID myID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
yEX myEx(z, zero, rd1, rd2, imm, op, ALUSrc);
yDM myDM(memOut, z, rd2, clk, MemRead, MemWrite);
yWB myWB(wb, z, memOut, Mem2Reg);
assign wd = wb;

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
	Mem2Reg = 0;
	MemRead = 0;
	MemWrite = 0;
	op = 2;

	if(ins[31:26] === 0) //Rtype
	begin
		RegDst = 1;
		RegWrite = 1;
		ALUSrc = 0;
		
		if(ins[5:0] === 100101)
		begin
			op = 2;
		end
	end

	 if (ins[31:26] === 6'b000100)//J-Type
	begin
		op = 6;
		ALUSrc = 0;
	end

	if(ins[31:26] === 6'b100011)
	begin
		RegWrite = 1;
		Mem2Reg = 1;
		MemRead = 1;
	end

	if(ins[31:26] === 6'b101011)
	begin
		RegWrite = 0;
		MemWrite = 1;
	end		
	//--------------------------------------Execute the ins
	clk = 0; #1;
	//--------------------------------View Results
	$display("%h: rd1=%2d rd2=%2d z=%3d zero=%b wb=%2d", ins, rd1, rd2, z, zero, wb);
	//Add statement to prepare for next instructions
	PCin = PCp4;
	end
	$finish;
end
endmodule
