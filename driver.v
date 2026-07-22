module driver #(parameter width=8) (
input wire [width-1:0]  data_in,
input wire              data_en,
output reg [width-1:0] data_out
);

always @ (*) begin
if (data_en) begin
data_out = data_in;
end
else begin
data_out=1'bz;
end
end

endmodule 
