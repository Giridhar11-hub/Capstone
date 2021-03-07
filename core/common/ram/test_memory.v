`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2021 11:34:14 PM
// Design Name: 
// Module Name: test_memory
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


module test_memory();
parameter RAM_WIDTH = 32;
parameter RAM_ADDR_BITS = 9;

reg							clk;
reg							ram_enable;
reg							write_enable;
reg 	[RAM_ADDR_BITS-1:0]	address;
reg 	[RAM_WIDTH-1:0] 	input_data;
wire	[RAM_WIDTH-1:0] 	output_data;

memory
#(
	.RAM_WIDTH 		(RAM_WIDTH 		),
	.RAM_ADDR_BITS 	(RAM_ADDR_BITS 	),
	.DATA_FILE 		("data_file.mem")
)
bram_inst
(
	.clock			(clk			),
	.ram_enable		(ram_enable		),
	.write_enable	(write_enable	),
	.address		(address		),
	.input_data		(input_data		),
	.output_data    (output_data	)
);
	
initial
begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial
begin
	
	ram_enable		= 1;
	write_enable	= 0;
	address			= 0;
	input_data		= 0;


	$display("Reading data from BRAM");
	repeat(1) @(posedge clk);
	for (address = 0; address < 32; address = address +1)
	begin
		@(posedge clk);
		$display ("ADDR: %d, DATA: %d", address, output_data);
	end
	
	repeat(2) @(posedge clk);
	$finish;
end

endmodule

