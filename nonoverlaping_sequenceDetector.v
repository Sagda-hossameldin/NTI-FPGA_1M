module nonoverlaping_sequenceDetector (
input wire         clk,
input wire         rst,
input wire          in,
output reg moore_check,
output reg mealy_check
);
// sequence to be detected 110101

reg check_c
reg [2:0] current_state, next_state;

localparam [2:0] S0=000;
localparam [2:0] S1=001;
localparam [2:0] S2=010;
localparam [2:0] S3=011;
localparam [2:0] S4=100;
localparam [2:0] S5=101;
localparam [2:0] S6=110;

always @ (posedge clk) begin

if(rst) begin
moore_check <= 0;
mealy_check <= 0;
current_state <= S0;
end
else begin
moore_check <= check_c;
current_state <= next_state;
end
end

//moore block
always @ (*) begin
check_c = 0;

case (current_state)

S0 : begin
check_c =0;
if(in==1) next_state = S1;
else next_state = S0;
end

S1 :begin
if(in==1) next_state = S2;
else next_state = S0;
end 

S2 :begin
if(in==0) next_state = S3;
else next_state = S2;
end 

S3 :begin
if(in==1) next_state = S4;
else next_state = S0;
end 

S4 :begin
if(in==0) next_state = S5;
else next_state = S2;
end

S5 :begin
if(in==1) next_state = S6;
else next_state = S0;
end 

S6 : begin
check_c = 1;
next_state = S0;
end

default : begin
next_state = S0;
 check_c =0;
end 
endcase

end

// mealy block
always @ (*) begin
mealy_check = 0;

case (current_state)

S0 : begin
mealy_check =0;
if(in==1) next_state = S1;
else next_state = S0;
end

S1 :begin
mealy_check =0;
if(in==1) next_state = S2;
else next_state = S0;
end 

S2 :begin
mealy_check =0;
if(in==0) next_state = S3;
else next_state = S2;
end 

S3 :begin
mealy_check =0;
if(in==1) next_state = S4;
else next_state = S0;
end 

S4 :begin
mealy_check =0;
if(in==0) next_state = S5;
else next_state = S2;
end

S5 :begin
if(in==1) begin
mealy_check = 1;
next_state = S0;
end
else begin
mealy_check = 0;
next_state = S0;
end
end 

default : begin
next_state = S0;
mealy_check=0;
end 
endcase

end

endmodule