module memory #(parameter AWIDTH=5 , parameter DWIDTH=8 , parameter DEPTH=32)(
input wire                    clk,
input wire                     wr,
input wire                     rd,
input wire                   addr,
/*input wire [DWIDTH-1 : 0] data_in,
reg output [DWIDTH-1 : 0] data_out*/ //how to make it bidirectional
inout wire [DWIDTH-1 : 0] data
);


reg [AWIDTH-1 : 0] Bmemory [0 : DEPTH-1]

// wirte operation
always @ (posedge clk) begin
if (wr) Bmemory[addr] <= data;
end


// are we testing the racing condition or is there a high priority for one of them

//read operation
assign data = rd ? Bmemory[addr];

endmodule