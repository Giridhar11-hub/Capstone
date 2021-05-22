`timescale 1ns / 1ps
//`include "globals.vh"

module imm_generator(
    
    input wire [31:7] INSTR,
    input wire [2:0] IMM_TYPE,
    output reg [31:0] IMM
    
    );
    
    wire [31:0] i_type;
    wire [31:0] s_type;
    wire [31:0] b_type;
    wire [31:0] u_type;
    wire [31:0] j_type;
    wire [31:0] r_type;
    
    assign i_type = { {20{INSTR[31]}}, INSTR[31:20] };
    assign s_type = { {20{INSTR[31]}}, INSTR[31:25], INSTR[11:7] };
    assign b_type = { {19{INSTR[31]}}, INSTR[31], INSTR[7], INSTR[30:25], INSTR[11:8], 1'b0 };
    assign u_type = { INSTR[31:12], 12'h000 };
    assign j_type = { {11{INSTR[31]}}, INSTR[31], INSTR[19:12], INSTR[20], INSTR[30:21], 1'b0 };
    assign r_type = { 27'b0, INSTR[19:15] };
    
    always @(*)
    begin
       case (IMM_TYPE)
           3'b000: IMM = i_type; 
           `I_TYPE: IMM = i_type;
           `S_TYPE: IMM = s_type;
           `B_TYPE: IMM = b_type;
           `U_TYPE: IMM = u_type;
           `J_TYPE: IMM = j_type;
           `CSR_TYPE: IMM = r_type;
           3'b111: IMM = i_type;
       endcase
    end
    
endmodule
