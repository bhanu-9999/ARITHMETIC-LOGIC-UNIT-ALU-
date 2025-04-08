module alu(input [7:0]a_in,b_in,
		   input [2:0]command_in,
		   input en,
		   output [15:0]d_out);
	
	reg [15:0]out;
	
	parameter ADD = 3'b000, //ADDITION
			  SUB = 3'b001, //SUBTRACTION
			  AND = 3'b010, //LOGICAL AND 
			  OR = 3'b011, //LOGICAL OR
			  NOT = 3'b100; //LOGICAL NOT 
			  
	always@(*)
	 begin
	  case(command_in)
	   ADD : out = a_in + b_in;
	   SUB : out = a_in - b_in;
	   AND : out = a_in & b_in;
	   OR : out = a_in | b_in;
	   NOT : out = ~a_in;
	   default : out = 16'b0;
	  endcase
	 end
	assign d_out = en ? out:0;
endmodule
