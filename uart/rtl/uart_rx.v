module uart_rx(input clk, input rst, input rx, output reg [7:0] data_out, output reg data_valid);
parameter idle = 3'b000, start = 3'b001, data = 3'b010, stop = 3'b011, done = 3'b100;

reg[7:0] shift_reg;
reg [2:0] bit_count;
reg [3:0] baud_tick_count;
wire baud16_tick;

reg prev_rx, rx_sync1, rx_sync2;

reg [2:0] current_state, next_state; 

// 2-FF-Synchronizer
always @(posedge clk) begin
rx_sync1 <= rx;
rx_sync2 <= rx_sync1;
prev_rx <= rx_sync2;
end

// state register
always @(posedge clk or posedge rst) begin
if (rst) begin
current_state <= idle;
end
else current_state <= next_state;
end

baud16_rate_generator br(clk, rst, current_state!=idle, baud16_tick);

// oversampling counter
always @(posedge clk or posedge rst) begin
    if (rst) baud_tick_count <= 0;

    else if (current_state == idle) baud_tick_count <= 0;

    else if (baud16_tick) begin
        if (baud_tick_count == 15) baud_tick_count <= 0;
        else baud_tick_count <= baud_tick_count + 1;
    end
end

// next state logic
always @(*) begin
case(current_state)
idle: next_state = (prev_rx & (~rx_sync2))? start:idle;
start: begin 
if(baud_tick_count == 4'b1111 && baud16_tick) begin 
next_state = data;
end
else next_state = start;
end
data: begin 
if(baud_tick_count == 4'b1111 && baud16_tick) begin
next_state = (bit_count == 3'b111)? stop:data;
end
else next_state = data;
end
stop: begin 
if(baud_tick_count == 4'b1111 && baud16_tick) begin
next_state = rx_sync2 ? done:idle;
end
else next_state = stop;
end
done : next_state = idle;
default: next_state = idle;
endcase
end

// output logic
always @(posedge clk or posedge rst) begin
if(rst) begin 
data_out <= 0;
data_valid <= 0;
bit_count <= 0;
shift_reg <= 0;
end
else begin
case(current_state)
idle: begin 
data_valid <= 0;
bit_count <= 0;
end
start: begin
bit_count <= 0;
end
data: begin
if(baud_tick_count == 4'b0111 && baud16_tick) begin
shift_reg[bit_count] <= rx_sync2;
end
if(baud_tick_count == 4'b1111 && baud16_tick) bit_count <= bit_count + 1;
end
done: begin
data_valid <= 1;
data_out <= shift_reg;
bit_count <= 0; 
end
endcase
end
end

endmodule
