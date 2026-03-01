module TB_detector;
reg clk, rst, x;
wire z;
seqDetector detector1(clk, rst, x, z);

initial clk = 0;
always #5 clk = ~clk;

initial begin
rst = 1; x = 1;
#10 rst = 0; 
@(negedge clk) x = 1;
@(negedge clk) x = 1;
@(negedge clk) x = 1;
@(negedge clk) x = 0;
@(negedge clk) x = 1;
@(negedge clk) x = 0;
@(negedge clk) x = 1;
@(negedge clk) x = 1;
@(negedge clk) x = 1;

@(posedge clk);
$stop;
end
endmodule