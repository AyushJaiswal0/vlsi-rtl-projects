`timescale 1ns/1ps
module TB_upDownCounter;
wire [3:0]q;
reg clk, arst, en, dir;
upDownCounter my_module(clk,arst,en,dir,q);

initial 
begin
clk = 1'b0 ; arst = 1'b1; en = 1'b0 ; dir = 1'b0;
#10 
clk = 1'b1 ; arst = 1'b0; en = 1'b0 ; dir = 1'b1;
#10
clk = 1'b0 ; arst = 1'b0; en = 1'b1 ; dir = 1'b1;
#10 
clk = 1'b1 ; arst = 1'b0; en = 1'b1 ; dir = 1'b1;
#10 
clk = 1'b0 ; arst = 1'b0; en = 1'b1 ; dir = 1'b1;
#10 
clk = 1'b1 ; arst = 1'b0; en = 1'b1 ; dir = 1'b1;
#10 
clk = 1'b0 ; arst = 1'b0; en = 1'b1 ; dir = 1'b1;
#10 
clk = 1'b1 ; arst = 1'b0; en = 1'b1 ; dir = 1'b1;
#10 
clk = 1'b0 ; arst = 1'b1; en = 1'b1 ; dir = 1'b0;
#10 
clk = 1'b1 ; arst = 1'b1; en = 1'b1 ; dir = 1'b0;
#10 
clk = 1'b0 ; arst = 1'b0; en = 1'b1 ; dir = 1'b0;
#10 
clk = 1'b1 ; arst = 1'b0; en = 1'b0 ; dir = 1'b0;
#10 
clk = 1'b0 ; arst = 1'b0; en = 1'b0 ; dir = 1'b0;
#10 
clk = 1'b1 ; arst = 1'b0; en = 1'b1 ; dir = 1'b0;
#10 
clk = 1'b0 ; arst = 1'b0; en = 1'b1 ; dir = 1'b1;
#10 
clk = 1'b1 ; arst = 1'b0; en = 1'b1 ; dir = 1'b0;

end
endmodule
