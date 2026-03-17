module synchronous_fifo #(parameter DEPTH = 8, parameter DATA_WIDTH = 2)(input clk, input rst, input [DATA_WIDTH-1 : 0] data_in, input read_en, input write_en, output reg [DATA_WIDTH-1 : 0] data_out, output full, output empty);

localparam pointer_width = $clog2(DEPTH);

reg [DATA_WIDTH-1 : 0]mem [0 : DEPTH-1];
reg [pointer_width:0] wr_ptr; 
reg [pointer_width:0] rd_ptr;

always @(posedge clk or posedge rst) begin
if(rst) begin
wr_ptr <= 0;
rd_ptr <= 0;
end
else begin
if(read_en && (!empty)) begin
data_out <= mem[rd_ptr[pointer_width-1 : 0]];
rd_ptr <= rd_ptr + 1;
end
if(write_en && (!full)) begin
mem[wr_ptr[pointer_width-1 : 0]] <= data_in;
wr_ptr <= wr_ptr + 1;
end
end
end

assign empty = (wr_ptr == rd_ptr);
assign full = (wr_ptr[pointer_width] != rd_ptr[pointer_width]) && (wr_ptr[pointer_width-1 : 0] == rd_ptr[pointer_width-1 : 0]);
endmodule