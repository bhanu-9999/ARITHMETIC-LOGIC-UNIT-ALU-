module alu_tb();

	reg [7:0] a_in,b_in;
	reg [2:0] command_in;
	reg en;
	wire [15:0] d_out;
	
	parameter ADD = 3'b000, //ADDITION
			  SUB = 3'b001, //SUBTRACTION
			  AND = 3'b010, //LOGICAL AND 
			  OR = 3'b011, //LOGICAL OR
			  NOT = 3'b100; //LOGICAL NOT 
	
	reg [4*8:0] out;
	
	alu dut(a_in,b_in,command_in,en,d_out);
	
	task inputs(input [7:0]x,y);
	 begin
	  a_in=x;
	  b_in=y;
	 end
	endtask
	
	always@(command_in)
	 begin 
	  case(command_in)
	   ADD : out = "ADD";
	   SUB : out = "SUB";
	   AND : out = "AND";
	   OR : out = "OR";
	   NOT : out = "NOT";
	  endcase
	 end
	
	initial 
	  begin
	   en=1;
	   inputs(8'd12,8'd10);command_in=ADD;#20;
	   inputs(8'd15,8'd10);command_in=SUB;#20;
	   inputs(8'd2,8'd3);command_in=AND;#20;
	   inputs(8'd4,8'd9);command_in=OR;#20;
	   a_in=8'd5; command_in=NOT;#20;
	   #10;
	  end
	 
	initial 
	$monitor($time,"input a_in=%d,b_in=%d,command_in=%s,en=%d, output d_out=%d",a_in,b_in,out,en,d_out);
	
	initial 
	#200 $finish;
endmodule