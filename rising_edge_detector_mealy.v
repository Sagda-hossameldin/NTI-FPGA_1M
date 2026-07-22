module risingEdge_detector_mealy (
input wire clk,
input wire rst,
input wire level,
output reg mealy_tick
);

reg present_state;
reg next_state;

always @(posedge clk or posedge rst) begin
if (rst) begin
present_state <= 0;
mealy_tick <= 0;
end
else present_state <= next_state;
end


//mealy block
always @(*) begin
case(present_state)
1'b0 : begin
if(level==0) begin
next_state = 0;
mealy_tick =0;
end
else begin
next_state = 1;
mealy_tick =1;
end
end

1'b1 : begin
if(level==1) begin
next_state = 1;
mealy_tick =0;
end
else begin
next_state = 0;
mealy_tick =0;
end
end

default : begin
next_state = 0;
mealy_tick =0;
end
endcase
end

endmodule
