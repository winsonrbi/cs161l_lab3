`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:34:52 01/31/2020
// Design Name:   control_unit
// Module Name:   /home/csmajs/wbi002/Lab3/lab3_control_tb.v
// Project Name:  Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lab3_control_tb;

	// Inputs
	reg [5:0] instr_op;

	// Outputs
	wire reg_dst;
	wire branch;
	wire mem_read;
	wire mem_to_reg;
	wire [1:0] alu_op;
	wire mem_write;
	wire alu_src;
	wire reg_write;

	// Instantiate the Unit Under Test (UUT)
	control_unit uut (
		.instr_op(instr_op), 
		.reg_dst(reg_dst), 
		.branch(branch), 
		.mem_read(mem_read), 
		.mem_to_reg(mem_to_reg), 
		.alu_op(alu_op), 
		.mem_write(mem_write), 
		.alu_src(alu_src), 
		.reg_write(reg_write)
	);

	initial begin
		instr_op = 5'b000000;
		#200;
        if( reg_dst != 1'b1) $display("R-FORMAT reg_dst wrong");
        if(branch != 1'b0) $display("R-FORMAT Branch is wrong");
        if(mem_read != 1'b0) $display("R-FORMAT mem_read is wrong");
        if(mem_to_reg != 1'b0) $display("R-FORMAT mem_to_reg is wrong");
        if(alu_op != 2'b10)$display("R-FORMAT alu op is wrong");
        if(mem_write != 1'b0) $display ("R-Format mem_write is wrong");
        if(alu_src != 1'b0) $display("R-Format alu_src is wrong");
        if(reg_write != 1'b1) $display("R-Format reg_write is wrong");
		// ---------------------------------------------
		// Testing LW need to test different instructions as the instruct set is small
		// --------------------------------------------- 
		instr_op = 5'b100011; //testing lw
		#200;
        if( reg_dst != 1'b0) $display("lw reg_dst wrong");
        if(branch != 1'b0) $display("lw Branch is wrong");
        if(mem_read != 1'b1) $display("lw mem_read is wrong");
        if(mem_to_reg != 1'b1) $display("lw mem_to_reg is wrong");
        if(alu_op != 2'b00)$display("lw alu op is wrong");
        if(mem_write != 1'b0) $display ("lw mem_write is wrong");
        if(alu_src != 1'b1) $display("lw alu_src is wrong");
        if(reg_write != 1'b1) $display("lw reg_write is wrong");
		// ---------------------------------------------
		// Testing BRANCH as it is the only one that trigger branch instruction
		// --------------------------------------------- 
		instr_op = 5'b00100; //testing BRANCH
		#200;
        if(branch != 1'b1) $display("BRANCH Branch is wrong");
        if(mem_read != 1'b0) $display("BRANCH mem_read is wrong");
        if(alu_op != 2'b01)$display("BRANCH alu op is wrong");
        if(mem_write != 1'b0) $display ("BRANCH mem_write is wrong");
        if(alu_src != 1'b1) $display("BRANCH alu_src is wrong");
        if(reg_write != 1'b0) $display("BRANCH reg_write is wrong");
        //-------
        // TESTING IM //need to test different instruction
        //-----------
        instr_op = 5'b00010; //testing lw
		  #200;
        if( reg_dst != 1'b0) $display("lw reg_dst wrong");
        if(branch != 1'b0) $display("lw Branch is wrong");
        if(mem_read != 1'b0) $display("lw mem_read is wrong");
        if(mem_to_reg != 1'b0) $display("lw mem_to_reg is wrong");
        if(alu_op != 2'b10)$display("lw alu op is wrong");
        if(mem_write != 1'b0) $display ("lw mem_write is wrong");
        if(alu_src != 1'b1) $display("lw alu_src is wrong");
        if(reg_write != 1'b1) $display("lw reg_write is wrong");

	end
      
endmodule

