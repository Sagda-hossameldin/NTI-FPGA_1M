module shift3 (
 input wire clk,
 input wire   d,
 output reg   q
 );

wire q1;
wire q2;

DFF dff1 (.clk(clk), .d(d), .q(q1));

DFF dff2 (.clk(clk), .d(q1), .q(q2));

DFF dff3 ( .clk(clk), .d(q2), .q(q));

endmodule