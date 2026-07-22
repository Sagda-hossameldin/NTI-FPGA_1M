module counter #(parameter cwidth=5)(
input wire          clk,
input wire          rst,
input wire         enab,
input wire         load,
input wire [cwidth-1:0] cnt_in,
reg output [cwidth-1:0] cnt_out
);

reg [cwidth-1:0] count;

always @ (posedge clk or posedge rst) begin

if (rst) cnt_out <= 0;
else cnt_out <= count;

end

always @ (*) begin

count =0;

 if (load) count = cnt_in;

else if (enab) count = count+1;

end


endmodule