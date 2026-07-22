module control (
input wire         zero,
input wire [2:0]  phase,
input wire [2:0] opcode,
output reg          sel,
output reg           rd,
output reg        ld_ir,
output reg         halt,
output reg       inc_pc,
output reg        ld_ac,
output reg        ld_pc,
output reg           wr,
output reg       data_e
); 

always @ (*) begin
sel=0;
rd=0;
ld_ir=0;
halt=0;
inc_pc=0;
ld_ac=0;
ld_pc=0;
wr=0;
data_e=0;

case(phase)

3'b000 : sel=1;
3'b001 : 
begin
sel=1;
rd=1;
end
3'b010 : 
begin
sel=1;
rd=1;
ld_ir=1;
end
3'b011 :
 begin
sel=1;
rd=1;
ld_ir=1;
end
3'b100 : halt =(opcode==000);
3'b101 : rd =((opcode==010)||(opcode==011)||(opcode==100)||(opcode==101));
3'b110 :
 begin
rd =((opcode==010)||(opcode==011)||(opcode==100)||(opcode==101));
inc_pc = ((opcode==001)&&zero);
ld_pc = (opcode==111);
data_e = (opcode==110);
end
3'b111 : 
begin 
rd=((opcode==010)||(opcode==011)||(opcode==100)||(opcode==101));
ld_ac = ((opcode==010)||(opcode==011)||(opcode==100)||(opcode==101));
ld_pc = (opcode==111);
wr = (opcode==110);
data_e = (opcode==110);
end
default : begin
sel=0;
rd=0;
ld_ir=0;
halt=0;
inc_pc=0;
ld_ac=0;
ld_pc=0;
wr=0;
data_e=0;
end 
endcase

end

endmodule
