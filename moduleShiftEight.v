module shift3_sel (
 input wire       clk,
 input wire [1:0] sel,
 input wire [7:0]   d,
 output reg [7:0]q_out
 );

wire q1;
wire q2;
wire q3;

DFF8 dff1 (.clk(clk), .d(d), .q(q1));

DFF8 dff2 (.clk(clk), .d(q1), .q(q2));

DFF8 dff3 (.clk(clk), .d(q2), .q(q3));

always @(*) begin
case (sel)
2'b00 : q_out=d;
2'b01 : q_out=q1;
2'b10 : q_out=q2;
2'b11 : q_out=q3;
default : q_out=0;

endcase
end

endmodule
