module labM;
reg [31:0] memIn, address;
reg clk, read, write;

integer i;

wire [31:0] memOut;

mem data(memOut, address, memIn, clk, read, write);

initial
begin

write = 1; read = 0; memIn = 32'h12345678; address = 16;
#1 clk = 1;
#1 clk = 0;

write = 1; read = 0; memIn = 32'h89abcdef; address = 24;
#1 clk = 1;
#1 clk = 0;

write = 1; read = 0; memIn = 32'h12345678; address = 13;
#1 clk = 1;
#1 clk = 0;

write = 0;  read = 1; address = 16;

repeat(3)
begin
#1 $display("Address %d contains %h", address, memOut);
address = address + 4;
end

end
endmodule




