module RAM_256 #(parameter width=20 , parameter width_addr=8 , parameter depth=256)(
input wire                      clk,
input wire                     rstn,
input wire                    wr_en,
input wire                    rd_en,
input wire[width_addr-1:0]  address,
input wire     [width-1:0]  data_in,
output reg     [width-1:0] data_out,
output reg                     valid
);

reg [width_addr-1:0] mem [0:depth-1];

integer i;

always @ (posedge clk or negedge rstn) begin
valid <= 0;
if (!rstn) begin 
data_out <= 'b0;
// reset the memory by for loop to make all the location's data is zero
for (i=0; i<depth; i=i+1) begin
mem[i] = 'b0;
end
end
else if (wr_en) begin
mem[address] <= data_in;
end
else if (rd_en) begin
data_out <= mem[address];
valid<=1;
end
end

endmodule
