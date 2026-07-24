module SIPO #(parameter width=20)(
input wire                       clk,
input wire                      rstn,
input wire                  shift_en,
input wire                 serial_in,
output reg   [width-1:0] parallel_out
); 


always @ (posedge clk or negedge rstn) begin

if (!rstn) begin
parallel_out <= 'b0;
end

else if(shift_en) begin 
parallel_out <= {serial_in , parallel_out[width-1:1]};
end
end

endmodule