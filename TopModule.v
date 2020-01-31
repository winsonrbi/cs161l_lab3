`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:01 01/31/2020 
// Design Name: 
// Module Name:    TopModule 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "alu_control.v"
`include "control_unit.v"

module TopModule(
	input wire [5:0]  instr_op,
	input wire [5:0] instruction_5_0 , 
	output reg reg_dst,
	output reg branch,
	output reg mem_read,
	output reg mem_to_reg,
	output reg mem_write,
	output reg alu_src,
	output reg reg_write,
   output reg [3:0] alu_out  
    );
wire [1:0] alu_op;
wire reg_dst_wire;
wire branch_wire;
wire mem_read_wire;
wire mem_to_reg_wire;
wire mem_write_wire;
wire alu_src_wire;
wire reg_write_wire;
wire [3:0]alu_out_wire;

control_unit control_unit_inst(
	.instr_op(instr_op_wire),
	.reg_dst(reg_dst_wire),
	.branch(branch_wire),
	.mem_read(mem_read_wire),
	.mem_to_reg(mem_to_reg_wire),
	.mem_write(mem_write_wire),
	.alu_src(alu_src_wire),
	.reg_write(reg_write_wire),
	.alu_op(alu_op)
);
alu_control alu_control_inst(
	.alu_op(alu_op),
	.instruction_5_0(instruction_5_0),
	.alu_out(alu_out_wire)
);
always@ (*) begin
	reg_dst = reg_dst_wire;
	branch = branch_wire;
	mem_read = mem_read_wire;
	mem_to_reg = mem_to_reg_wire;
	mem_write = mem_write_wire;
	alu_src = alu_src_wire;
	reg_write = reg_write_wire;
	alu_out = alu_out_wire;
	
end

endmodule
