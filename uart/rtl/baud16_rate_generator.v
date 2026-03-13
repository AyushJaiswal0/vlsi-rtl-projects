module baud16_rate_generator(input clk, input rst, input enable, output reg baud_tick);
parameter baud_rate = 9600;
parameter clk_freq = 50_000_000;
localparam baud_div = clk_freq / (baud_rate * 16);

reg [8:0] baud_count;

always @(posedge clk or posedge rst) begin
if(rst) begin 
baud_tick <= 0;
baud_count <= 0;
end
else begin
baud_tick <= 0;
if(!enable) baud_count <= 0;
else if(baud_count == baud_div-1) begin
baud_tick <= 1;
baud_count <= 0;
end
else baud_count <= baud_count+1;
end
end
endmodule
