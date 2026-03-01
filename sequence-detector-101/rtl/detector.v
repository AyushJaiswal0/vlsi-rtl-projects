module seqDetector(input clk, input rst, input x, output reg z);
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

reg [1:0] current_state, next_state;

always @(posedge clk or posedge rst) begin
if(rst) current_state <= S0;
else current_state <= next_state;
end

always @(*) begin
case(current_state)
S0: next_state = (x)? S1:S0;
S1: next_state = (!x)? S2:S1;
S2: next_state = (x)? S3:S0;
S3: next_state = (!x)? S2:S1;
default : next_state = S0;
endcase
end

always @(posedge clk or posedge rst) begin
if(rst) z <= 0;
else z <= (next_state == S3);
end

endmodule
