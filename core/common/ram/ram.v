`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 01:16:35 AM
// Design Name: 
// Module Name: ram
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




module ram(
    we,
    oe,
    clk,
    prt_en_1,
    prt_en_0,
    data_in1,
    address,
    //data_out0,
    );
    input we;
    input oe;
    input clk;
    input prt_en_1;
    input prt_en_0;
    input [31:0] data_in1;
    input [31:0] address;
    reg [31:0] data_out0;
    
   
   
 parameter RAM_DEPTH = 1 << 8;
 
 
 //reg [31:0] data_out;
 reg [31:0] mem [RAM_DEPTH-1:0];
 
 //write is enabled
 always @ (posedge clk)
 begin : MEM_WRITE
    if (prt_en_1==1 && we==1) 
        mem[address] <= data_in1;
 end

//buffer state
 //assign data = (oe &&  ! we) ? data_out : 8'bz; 
 
 
 //read
 always @ (posedge clk)
 begin : MEM_READ
    if ( prt_en_0==1 && oe==1) 
        begin
        data_out0 <= mem[address]; 
        end 
    else 
        data_out0 <= 32'b1;  
 end 
 
 
 
 endmodule
 
 module load_tb;
    reg we;
    reg oe;
    reg clk;
    reg prt_en_1;
    reg prt_en_0;
    reg [31:0]data_in1;
    reg [31:0] address;
    reg [31:0] data_out0;
    
    integer i;
    
  ram load_inst(
        we,
        oe,
        clk,
        prt_en_1,
        prt_en_0,
        data_in1,
        address,
        //data_out0
    );
  always
        #5 clk = ~clk;
       
 initial
 begin
    clk=1;
    we=0;
    oe=0;
    prt_en_0 = 0;
    prt_en_1 = 0;
    data_in1=32'b00000000000000000000000000000000;
    address=32'b00000000000000000000000000000000;
    #10
    //read
    we=0;
    oe=1;
    prt_en_0 = 1;
    data_out0=32'b11110000000000000000000000000011;
    address=32'b00000000000000000000000000000011;
 
    #10
    we=1;
    oe=0;
    //write
    prt_en_1 = 1;
    data_in1=32'b00000000000000000000000000101111;
    address=32'b10000000000000000000000000101111;
    
    //test
    
    
   end
endmodule
 
 
 
      
    


 

