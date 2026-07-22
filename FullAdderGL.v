module full_adder_GL (
input wire  in1,
input wire  in2,
input wire  cin,
output wire  sum,
output wire  cout

);

wire s1;
wire c1;
wire c2;

xor (s1,in1,in2);
xor (sum,s1,cin);
and (c1,cin,s1);
and (c2,in1,in2);
or (cout,c1,c2);

// OR

/*
module full_adder_B (
input wire  in1,
input wire  in2,
input wire  cin,
output wire  sum,
output wire  cout

);
reg s1;
reg c1;
reg c2;

always @ (*) begin 
s1 = in1 ^ in2;
sum = s1 ^ cin;
c1 = cin & s1;
c2 = in1 & in2;
cout = c1 | c2;
end
endmodule
*/ 