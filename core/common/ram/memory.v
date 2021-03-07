`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2021 11:14:44 PM
// Design Name: 
// Module Name: memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module memory#(
        parameter RAM_WIDTH 		= 32,
		parameter INIT_START_ADDR 	= 0,
		parameter DATA_FILE 		= "data_file.mem",
		parameter INIT_END_ADDR		= 32,
		parameter RAM_ADDR_BITS 	= 9
	)(
    input clock,
    input ram_enable,
    input write_enable,
    input [31:0] input_data,
    output reg [31:0] output_data,
    input [8:0] address
    );
reg [RAM_WIDTH-1:0] ram_name [(2**RAM_ADDR_BITS)-1:0];

initial
      $readmemh(DATA_FILE, ram_name, INIT_START_ADDR, INIT_END_ADDR);

   always @(posedge clock)
      if (ram_enable) begin
         if (write_enable)
            ram_name[address] <= input_data;
         output_data <= ram_name[address];
      end

endmodule
