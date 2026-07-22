module debouncing (
input wire clk,
input wire rst,
input wire sw,
output reg debounced_out
);

reg m_tick;
reg [2:0] current_state, next_state;
reg [9:0] count;




localparam ZERO =3'b000;
localparam WAIT1_1 =3'b001;
localparam WAIT1_2 =3'b010;
localparam WAIT1_3 =3'b011;
localparam WAIT0_3 =3'b100;
localparam WAIT0_2 =3'b101;
localparam WAIT0_1 =3'b110;
localparam ONE =3'b111;

// m_tick=10us generation assuming clk period = 10ns
always @ (posedge clk or posedge rst) begin
if (rst) begin
count <= 0;
m_tick <= 0;
end
else if (count==999) begin
m_tick <=1;
count <= 0;
end
else count <= count+1;
end

// NEXT STATE LOGIC
always @ (posedge clk or posedge rst) begin
if (rst) begin
current_state <= ZERO;
debounced_out <= 0;
end
else current_state <= next_state;
end


always @ (*) begin

debounced_out =0;

case (current_state)

ZERO : begin
if (sw==0) next_state = ZERO;
else next_state = WAIT1_1;
end

WAIT1_1 : begin
if (sw==0) next_state = ZERO;
else if ((sw)&&(m_tick==0)) next_state = WAIT1_1;
else next_state = WAIT1_2;
end

WAIT1_2 :begin
if (sw==0) next_state = ZERO;
else if ((sw)&&(m_tick==0)) next_state = WAIT1_2;
else next_state = WAIT1_3;
end

WAIT1_3 :begin
if (sw==0) next_state = ZERO;
else if ((sw)&&(m_tick==0)) next_state = WAIT1_3;
else next_state = ONE;
end

ONE : begin
// mynfa3sh akhleeh b 1 hena bas ... msh shart ba3d kda yb2aa b 1 w momken ylatch kman w ehna mish 3ayzeen kda , tool ma hya msh initialized lazem a3mlha assign fe kol state
debounced_out =1;
if (sw==1) next_state = ONE;
else next_state = WAIT0_1;
end

WAIT0_1 : begin
debounced_out =1;
if (sw==1) next_state = ONE;
else if ((sw==0)&&(m_tick==0)) next_state = WAIT0_1;
else next_state = WAIT0_2;
end

WAIT0_2 :begin
debounced_out =1;
if (sw==1) next_state = ONE;
else if ((sw==0)&&(m_tick==0)) next_state = WAIT0_2;
else next_state = WAIT0_3;
end

WAIT0_3 : begin
debounced_out =1;
if (sw==1) next_state = ONE;
else if ((sw==0)&&(m_tick==0)) next_state = WAIT0_3;
else next_state = ZERO;
end

endcase
end
endmodule
