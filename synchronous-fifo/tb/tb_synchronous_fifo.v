module tb_synchronous_fifo;

reg clk, rst, read_en, write_en;
reg [1:0] data_in;
wire full, empty;
wire [1:0] data_out;

reg [1:0] reference_queue[7:0];
reg [1:0]expected_data;
reg [2:0] wr_pt = 0;
reg [2:0] rd_pt = 0;
reg [1:0] temp;

synchronous_fifo fifo1(clk, rst, data_in, read_en, write_en, data_out, full, empty);
 
initial clk = 1;
always #10 clk = ~clk;

task write_data;
begin
if(!full) begin
write_en = 1;
temp = $random & 2'b11;
data_in = temp;
@(posedge clk);
reference_queue[wr_pt] = temp;
wr_pt = wr_pt + 1;
write_en = 0;
end
end
endtask

task read_data;
begin
if(!empty) begin
read_en = 1;
@(posedge clk);
#1;
expected_data = reference_queue[rd_pt];
if(fifo1.data_out != expected_data) $display("Error");
rd_pt = rd_pt + 1;
read_en = 0;
end
end
endtask


initial begin
rst = 1; read_en = 0; write_en = 0; 

$monitor("time = %t, wr_ptr = %b, rd_ptr = %b, data_in = %b, data_out = %b, full = %b, empty = %b, reference_queue = %b", $time, fifo1.wr_ptr, fifo1.rd_ptr, data_in, data_out, full, empty, expected_data);

repeat(2)@(posedge clk);
@(posedge clk) rst = 0;

repeat(8) write_data();

repeat(5) read_data();

write_data(); read_data();
repeat(3) read_data();

repeat(2) @(posedge clk);
 $stop;

end

endmodule
