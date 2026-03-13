module uart_tx(input clk, input rst, input strt_sig, input [7:0] data_in, output reg tx, output reg tx_busy);

parameter idle = 2'b00, start = 2'b01, data = 2'b10, stop = 2'b11;
parameter max_count = 3'b111;

reg[7:0] shift_reg;
reg [2:0] bit_count;
wire baud_tick;

reg [1:0] current_state, next_state; 

always @(posedge clk or posedge rst) begin
if (rst) begin
current_state <= idle;
bit_count <= 0;
end
else current_state <= next_state;
end

baud_rate_generator br(clk, rst, current_state!=idle, baud_tick);

always @(*) begin
case(current_state)
idle: next_state = strt_sig? start:idle;
start: begin 
if(baud_tick) next_state = data;
else next_state = start;
end
data: begin 
if(baud_tick) next_state = (bit_count == max_count)? stop:data;
else next_state = data;
end
stop: begin 
if(baud_tick) next_state = idle;
else next_state = stop;
end
default: next_state = idle;
endcase
end

always @(posedge clk or posedge rst) begin
if(rst) begin 
tx <= 1;
tx_busy <= 0;
end
else begin
case(current_state) 
start: begin
tx_busy <= 1;
tx <= 0;
if(baud_tick) begin
shift_reg <= data_in;
bit_count <= 0;
end
end
data: begin
if(baud_tick) begin
tx <= shift_reg[0];
shift_reg <= shift_reg >> 1;
bit_count <= bit_count + 1;
end
end
stop: begin
tx <= 1;
tx_busy <= 1;
end
default: begin
tx <= 1;
tx_busy <= 0;
end
endcase
end
end

endmodule
