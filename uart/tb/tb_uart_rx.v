`timescale 1ns/1ps
module tb_uart_rx;

reg clk, rst, rx;
wire [7:0] data_out;
wire data_valid;

uart_rx rx1(clk, rst, rx, data_out, data_valid);

initial clk = 1;
always #10 clk = ~clk;

initial begin
rst = 1; rx = 1;
@(posedge clk) rst = 0;

repeat(20) @(posedge clk);

rx = 0; repeat(5208) @(posedge clk);
 
rx = 1; repeat(5208) @(posedge clk);
rx = 0; repeat(5208) @(posedge clk);
rx = 0; repeat(5208) @(posedge clk);
rx = 1; repeat(5208) @(posedge clk);
rx = 1; repeat(5208) @(posedge clk);
rx = 0; repeat(5208) @(posedge clk);
rx = 1; repeat(5208) @(posedge clk);
rx = 0; repeat(5208) @(posedge clk);

rx = 1; repeat(5208) @(posedge clk);

repeat(60000) @(posedge clk);
 $stop;
end
endmodule