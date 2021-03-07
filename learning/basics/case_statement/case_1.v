`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2021 02:40:29 PM
// Design Name: 
// Module Name: case_1
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


module case_1(


    );
    reg a;
    reg b;
    reg c;
    reg [3:0]k=4'b0000;
    always @(*)
    begin
        case({a,b,c})
            3'b000 : k<=1'b1001;
            3'b001 : k<=2;
            3'b101 : k<=1;
            default:k<=5;
        endcase
    end
    
    initial
    begin
    a<=1'b0;
    b<=1'b0;
    c<=1'b0;
    #10;
    a<=1'b0;
    b<=1'b0;
    c<=1'b1;
    #10;
    a<=1'b1;
    b<=1'b0;
    c<=1'b1;
    #10;
    a<=1'b0;
    b<=1'b0;
    c<=1'b0;
    #10;
    a<=1'b1;
    b<=1'b1;
    c<=1'b0;
    #10;
    end

    
    
    
    
    
endmodule
