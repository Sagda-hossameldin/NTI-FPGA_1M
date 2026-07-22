module full_adder_B (
input wire  in1,
input wire  in2,
input wire  cin,
output reg  sum,
output reg  cout

);

assign {cout,sum} = in1+in2+cin;

//OR 
/*
wire [1:0] SUM;
assign SUM = in1+in2+cin;
assign cout = SUM[1];
assign sum = SUM[0];
*/
endmodule