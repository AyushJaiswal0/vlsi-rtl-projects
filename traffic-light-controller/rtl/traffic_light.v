module traffic_light(
input clk, 
input rst, 
output reg A_G, A_Y, A_R,
output reg B_G, B_Y, B_R
);

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
reg [1:0] current_state, next_state;

always @(posedge clk or posedge rst) begin
if(rst) current_state <= S0;
else current_state <= next_state;
end

always @(*) begin
case(current_state) 
S0: next_state = S1;
S1: next_state = S2;
S2: next_state = S3;
S3: next_state = S0;
default: next_state = S0;
endcase
end

always @(posedge clk or posedge rst) begin
if(rst) begin
A_R <= 1;
A_Y <= 0;
A_G <= 0;
B_R <= 0;
B_Y <= 0;
B_G <= 1;
end
else begin
case(current_state)  
S0: begin 
A_R <= 1;
A_Y <= 0;
A_G <= 0;
B_R <= 0;
B_Y <= 0;
B_G <= 1;
end
S1: begin 
A_R <= 1;
A_Y <= 0;
A_G <= 0;
B_R <= 0;
B_Y <= 1;
B_G <= 0;
end 
S2: begin 
A_R <= 0;
A_Y <= 0;
A_G <= 1;
B_R <= 1;
B_Y <= 0;
B_G <= 0;
end 
S3: begin 
A_R <= 0;
A_Y <= 1;
A_G <= 0;
B_R <= 1;
B_Y <= 0;
B_G <= 0;
end 
default: begin 
A_R <= 1;
A_Y <= 0;
A_G <= 0;
B_R <= 0;
B_Y <= 0;
B_G <= 1;
end
endcase
end
end
endmodule