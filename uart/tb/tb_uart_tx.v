`timescale 1ns/1ps
module tb_uart_tx;

reg clk, rst, strt_sig;
reg [7:0] data_in;
wire tx, tx_busy;

uart_tx transmission(clk, rst, strt_sig, data_in, tx, tx_busy);

initial clk = 1;
always #10 clk = ~clk;

initial begin
rst = 1; strt_sig = 0; data_in = 8'b00000000;
@(posedge clk) rst = 0; strt_sig = 1; data_in = 8'b11101010;
@(posedge clk) strt_sig = 0; 

repeat(60000) @(posedge clk);
 $stop;
end
endmodule