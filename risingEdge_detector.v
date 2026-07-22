module risingEdge_detector (
input wire clk,
input wire rst,
input wire level,
output reg moore_tick
);

reg [1:0] present_state;
reg [1:0] next_state;
localparam ZERO = 2'b00;
localparam EDGE = 2'b01;
localparam ONE = 2'b11;



always @(posedge clk or posedge rst) begin
if (rst) begin
present_state <= ZERO;
moore_tick <= 0;
end
else present_state <= next_state;
end

// moore block
always @(*) begin
case(present_state)
ZERO : begin
if(level==0) begin
next_state = ZERO;
moore_tick =0;
end
else begin
next_state = EDGE;
moore_tick =1;
end
end

EDGE : begin
next_state = ONE;
moore_tick =1; // NOT SURE
end

ONE : begin
if(level==1) begin
next_state = ONE;
moore_tick =0;
end
else begin
next_state = ZERO;
moore_tick =0;
end
end

default : begin
next_state = ZERO;
moore_tick =0;
end
endcase
end

endmodule
