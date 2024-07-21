`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2024 02:39:26 PM
// Design Name: 
// Module Name: cla_32bit
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


module cla_32bit(
    input i_clk,
    input [31:0]    in1,
    input [31:0]    in2,
    
    output [32:0]   out
    );
    
    wire [15:0] sum0_1, sum0_2, sum0_3, sum0_4, sum0_5, sum0_6, sum1;
    wire c_1_0, c_1_1;
    wire c_out;
    wire [15:0] imme1_0, imme1_1, imme1_2, imme1_3, imme2_0, imme2_1, imme2_2, imme2_3, imme2_4, imme1_4;
    
    cla_16bit CLA0 (.i_clk(i_clk), .in_1(in1[15:0]), .in_2(in2[15:0]),  .c_in(1'b0), .c_out(c_1_0), .sum(sum0_1));
    
    FF_16bit F1_1(.i_clk(i_clk), .i_data(in1[31:16]), .o_data(imme1_0));
    FF_16bit F1_2(.i_clk(i_clk), .i_data(in2[31:16]), .o_data(imme2_0));
    
    FF_16bit F2_2(.i_clk(i_clk), .i_data(imme1_0), .o_data(imme1_1));
    FF_16bit F2_3(.i_clk(i_clk), .i_data(imme2_0), .o_data(imme2_1));
    
    FF_16bit F3_2(.i_clk(i_clk), .i_data(imme1_1), .o_data(imme1_2));
    FF_16bit F3_3(.i_clk(i_clk), .i_data(imme2_1), .o_data(imme2_2));
    
    FF_16bit F4_2(.i_clk(i_clk), .i_data(imme1_2), .o_data(imme1_3));
    FF_16bit F4_3(.i_clk(i_clk), .i_data(imme2_2), .o_data(imme2_3));
 
    FF_16bit F5_2(.i_clk(i_clk), .i_data(imme1_3), .o_data(imme1_4));
    FF_16bit F5_3(.i_clk(i_clk), .i_data(imme2_3), .o_data(imme2_4));
    
    FF_carry F1_4(.i_clk(i_clk), .i_data(c_1_0), .o_data(c_1_1));
    FF_16bit F1_3(.i_clk(i_clk), .i_data(sum0_1), .o_data(sum0_2));        
    FF_16bit F2_1(.i_clk(i_clk),. i_data(sum0_2), .o_data(sum0_3));
    FF_16bit F3_1(.i_clk(i_clk), .i_data(sum0_3), .o_data(sum0_4));
    FF_16bit F4_1(.i_clk(i_clk), .i_data(sum0_4), .o_data(sum0_5));
    FF_16bit F5_1(.i_clk(i_clk), .i_data(sum0_5), .o_data(sum0_6));


    cla_16bit CLA1(.i_clk(i_clk), .in_1(imme1_4), .in_2(imme2_4), .c_in(c_1_1), .c_out(c_out), .sum(sum1));
    assign out = {sum1[15] , sum1, sum0_6};
    
endmodule
