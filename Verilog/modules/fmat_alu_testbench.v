`define ALU_ADD    3'b000
`define ALU_SUB    3'b001
`define ALU_AND    3'b010
`define ALU_OR     3'b011
`define ALU_NOT    3'b100
`define ALU_LSHIFT 3'b101
`define ALU_RSHIFT 3'b110

module fmat_alu_testbench();
// Declare inputs as regs and outputs as wires

	reg clk;			// Clock
	reg[3:0]  alu_opcode_i;// 4-Bit Opcode
	reg[7:0]  a_i;		    // Input #1 
	reg[7:0]  b_i;		    // Input #2
	wire[7:0] z_o;		    // Output #1
	wire  ovrflw_o;     // Overflow output

// Initialize all variables
initial begin        
	clk = 1;       // initial value of clock
	// add
	#10 a_i = 1;b_i = 2;alu_opcode_i = `ALU_ADD;
	#10 a_i = 127;b_i = 127;alu_opcode_i = `ALU_ADD;
	#10 a_i = 5;b_i = -3;alu_opcode_i = `ALU_ADD;
	#10 a_i = -5;b_i = 3;alu_opcode_i = `ALU_ADD;
	// sub
	#10 a_i = 1;b_i = 2;alu_opcode_i = `ALU_SUB;
	#10 a_i = -127;b_i = -127;alu_opcode_i = `ALU_SUB;
	#10 a_i = 5;b_i = -3;alu_opcode_i = `ALU_SUB;
	#10 a_i = -3;b_i = 5;alu_opcode_i = `ALU_SUB;
	// and
	#10 a_i = 1;b_i = 2;alu_opcode_i = `ALU_AND;
	#10 a_i = 127;b_i = 127;alu_opcode_i = `ALU_AND;
	#10 a_i = 5;b_i = -3;alu_opcode_i = `ALU_AND;
	#10 a_i = -5;b_i = 3;alu_opcode_i = `ALU_AND;
	// or
	#10 a_i = 1;b_i = 2;alu_opcode_i = `ALU_OR;
	#10 a_i = 127;b_i = 127;alu_opcode_i = `ALU_OR;
	#10 a_i = 5;b_i = -3;alu_opcode_i = `ALU_OR;
	#10 a_i = -5;b_i = 3;alu_opcode_i = `ALU_OR;
	// not
	#10 a_i = 1;b_i = 2;alu_opcode_i = `ALU_NOT;
	#10 a_i = 127;b_i = 127;alu_opcode_i = `ALU_NOT;
	#10 a_i = 5;b_i = -3;alu_opcode_i = `ALU_NOT;
	#10 a_i = -5;b_i = 3;alu_opcode_i = `ALU_NOT;
	// lshift
	#10 a_i = 127;b_i = 3;alu_opcode_i = `ALU_LSHIFT;
	#10 a_i = 100;b_i = 1;alu_opcode_i = `ALU_LSHIFT;
	#10 a_i = 5;b_i = 3;alu_opcode_i = `ALU_LSHIFT;
	#10 a_i = -5;b_i = 2;alu_opcode_i = `ALU_LSHIFT;
	// rshift
	#10 a_i = 127;b_i = 3;alu_opcode_i = `ALU_RSHIFT;
	#10 a_i = 100;b_i = 1;alu_opcode_i = `ALU_RSHIFT;
	#10 a_i = 5;b_i = 3;alu_opcode_i = `ALU_RSHIFT;
	#10 a_i = -5;b_i = 2;alu_opcode_i = `ALU_RSHIFT;
end

 // Clock generator
always begin
   #5  clk = ~clk; // Toggle clock every 5 ticks
						// this makes the clock cycle 10 ticks
	
end

// the following creates an instance of our program_counter register.
//   I copied this code verbatim from the walkthough.v that was
//   generated by Quartus when I created the .v file from the .bdf.

fmat_alu	b2v_inst(
	.clk(clk),
	.alu_opcode_i(alu_opcode_i),
	.a_i(a_i),
	.b_i(b_i),
	.z_o(z_o),
	.ovrflw_o(ovrflw_o_alu));


endmodule
