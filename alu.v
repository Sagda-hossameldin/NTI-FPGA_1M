module alu #(parameter width=8)(
input wire [width-1:0] in_a,
input wire [width-1:0] in_b,
input wire [2:0] opcode,
output reg [width-1:0] alu_out,
output reg a_is_zero
);

always @ (*) begin

if(in_a)begin
a_is_zero=0;
end
else begin
a_is_zero=1;
end

case (opcode)
3'b000 : alu_out=in_a;
3'b001 : alu_out=in_a;
3'b010 : alu_out=in_a+in_b;
3'b011 : alu_out=in_a&in_b;
3'b100 : alu_out=in_a^in_b;
3'b101 : alu_out=in_b;
3'b110 : alu_out=in_a;
3'b111 : alu_out=in_a;
default : alu_out=0;
endcase
end


endmodule
