// 2 Segment Style FSM
module fsm_2 (
  input wire a,
  input wire b,
  input wire clk,
  input wire reset,
  
  output reg y0,
  output reg y1
);

  // State Encoding
  localparam [1:0] S0 = 2'b00,
                   S1 = 2'b01,
	               S2 = 2'b10;
  
  // Signals/Registers declaration 
  reg [1:0] present_state, next_state;
 // reduction mostly made by conditional statments and assign statments
  // State_Register  -- 1st segment
  always@(posedge clk, negedge reset)
    begin
 //State_Register
     present_state <= (!reset) ? S0 : next_state;
  
  // Next State Logic & Output logic (both Moore and Mealy)  -- 2nd segment
  always@(*)
    begin
// intializing output to idle state
y0 = 1'b0;
y1 = 1'b1;
	  case(present_state)
	    S0: 
		  begin
		    next_state = (!a) ? S0 : ( (b) ? S2 : S1) ;
		    y0 = (b); // not sure
		  end
	    
		S1:
		    next_state = (!a) ? S1 : S0 ;

		S2:
		  begin
		    y1 = 1'b0;
            y0 = 1'b0;
		    next_state = S0;
		  end
		  
	    default : next_state = S0;
	  endcase
	end
endmodule
