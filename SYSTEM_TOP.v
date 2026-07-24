module SYSTEM_TOP #(parameter width=20 , parameter width_addr=8 , parameter depth=256)(
input  wire                       clk,
input  wire                      rstn,
input  wire                     wr_en,
input  wire                     rd_en,
input  wire [width_addr-1:0]     addr,
input  wire      [width-1:0] data_inn,
output wire           [7:0] data_outt,
output wire                    flag_a
);

wire             [width-1:0] trans; 
wire [width-1:0] parallel_out_sipo;
wire                        piso_v;
wire                       piso_en;
wire               serial_out_piso;

RAM_256 RAM_TOP(.clk(clk), .rstn(rstn), .wr_en(wr_en), .rd_en(rd_en), .address(addr), .data_in(data_inn), .data_out(trans), .valid(piso_en));

PISO PISO_TOP (.clk(clk), .rstn(rstn), .parallel_in(trans), .serial_out(serial_out_piso),.en(piso_en), .valid(piso_v));

SIPO SIPO_TOP (.clk(clk), .rstn(rstn), .shift_en(piso_v), .serial_in(serial_out_piso), .parallel_out(parallel_out_sipo));

ALU ALU_TOP ( .in_a(parallel_out_sipo[15:8]), .in_b(parallel_out_sipo[7:0]), .opcode(parallel_out_sipo[18:16]), .alu_en(parallel_out_sipo[19]), .alu_out(data_outt), .a_is_zero(flag_a));

endmodule