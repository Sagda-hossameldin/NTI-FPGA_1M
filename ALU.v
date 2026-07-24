module ALU #(parameter width=8) (
input wire    [width-1:0] in_a,
input wire    [width-1:0] in_b,
input wire        [2:0] opcode,
input wire              alu_en,
output reg [width-1:0] alu_out,
output reg            a_is_zero
);

always @(*) begin
if (in_a==0) begin
 a_is_zero =1;
end
else begin
 a_is_zero =0;
end
end

always @(*) begin
if (!alu_en) begin
alu_out = 'b0;
end
else begin
case (opcode)
3'b000 : alu_out = in_a + in_b;
3'b001 : alu_out = in_a - in_b;
3'b010 : alu_out = in_a & in_b;
3'b011 : alu_out = in_a ^ in_b;
3'b100 : alu_out = in_a | in_b;
3'b101 : alu_out = in_a;
default : alu_out ='b0;
endcase
end
end
endmodule
