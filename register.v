module register #(parameter width=8) (
input wire                 clk,
input wire                 rst,
input wire                load,
input wire [width-1:0] data_in,
output reg [width-1:0] data_out
);

always @(posedge clk) begin
if(rst) begin
data_out <= 'b0;
end
else if(load) begin
data_out <= data_in;
end
end
endmodule
