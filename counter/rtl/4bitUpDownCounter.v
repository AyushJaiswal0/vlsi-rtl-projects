module upDownCounter(input clk, input arst, input en, input dir, output reg [3:0]q);
always @(posedge clk or posedge arst) begin
if(arst)
q <= 4'b0000;
else if(en) begin
if(dir)
q <= q + 1;
else
q <= q - 1;
end
end
endmodule
