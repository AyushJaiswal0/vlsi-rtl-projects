`timescale 1ns/1ps
module tb_traffic_light;

reg clk, rst;
wire A_G, A_Y, A_R, B_G, B_Y, B_R;

traffic_light mylight(clk, rst, A_G, A_Y, A_R, B_G, B_Y, B_R);

initial clk = 1;
always #10 clk = ~clk;

initial begin
rst = 1;

@(posedge clk) rst = 0;

repeat(20) @(posedge clk);
$stop;

end

endmodule
