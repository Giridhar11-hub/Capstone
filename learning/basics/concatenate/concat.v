`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2021 02:21:05 PM
// Design Name: 
// Module Name: concat
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


module concat(

    );
    reg [3:0] a=4'b0110;
    reg [3:0] c=4'b1010;
    wire [7:0] k;
    assign k={a,c};
    initial
    begin 
    #5;
    $display("the ans is %h",k);
    end
    
endmodule
