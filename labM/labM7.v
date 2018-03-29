module labM;
reg [31:0] PCin;
reg clk;
wire [31:0] ins, PCp4;

yIF myIF(ins, PCp4, PCin, clk);

initial
begin
//-------------------entry point
PCin = 128;
//--------------------------------run program
repeat(11)
	begin
	//-----fetch an ins
	clk = 1; #1;
	//--------execute the ins
	clk = 0; #1;
	//----view results
	$display("instruction = %h", ins);
	PCin = PCp4;
	end
	$finish;
end
endmodule
