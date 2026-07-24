module PISO #(parameter width=20)(
input wire                     clk,
input wire                    rstn,
input wire [width-1:0] parallel_in,
output reg              serial_out,
output reg                      en,
output reg                   valid
); 

reg [width-1:0] shiftReg;
integer i;

always @(posedge clk or negedge rstn) begin
valid <=0;
if(!rstn)begin 
serial_out <= 0;
en <= 0;
end
else begin 
en <= 1; // does it has to be lowered again to prevent overwrite in shiftReg befor all the data is out? 
shiftReg <= parallel_in;
end
for (i=0; i<width; i=i+1) begin
en <= 0;
serial_out <= shiftReg[i];
valid <=1;
end
valid <=0;
serial_out <= 0;
end














/*integer i=0;
always @(posedge clk or negedge rstn) begin

if(!rstn)begin 
serial_out <=0;
end

dataout <= datain[i];
i++;   //need confirmation (may be not correct)
end*/

endmodule
