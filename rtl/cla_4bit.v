`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2024 12:45:56 PM
// Design Name: 
// Module Name: cla_4bit
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


module cla_4bit(
    input   [3:0] a,
    input   [3:0] b,
    input        c_in,
    
    output  [3:0] sum,
    output      c_out
    );
    wire [3:0] gen;
    wire [3:0] pro;
    wire [3:0] carry;
    pg_gen pg_gen0(.a(a[0]), .b(b[0]), .p(pro[0]), .g(gen[0]));
    pg_gen pg_gen1(.a(a[1]), .b(b[1]), .p(pro[1]), .g(gen[1]));
    pg_gen pg_gen2(.a(a[2]), .b(b[2]), .p(pro[2]), .g(gen[2]));
    pg_gen pg_gen3(.a(a[3]), .b(b[3]), .p(pro[3]), .g(gen[3]));
    
    assign carry[0] = gen[0] | (pro[0] & c_in);
    assign carry[1] = gen[1] | (pro[1] & carry[0]);
    assign carry[2] = gen[2] | (pro[2] & carry[1]);
    assign carry[3] = gen[3] | (pro[3] & carry[2]);
    
    assign sum[0] = pro[0] ^ c_in;
    assign sum[1] = pro[1] ^ carry[0];
    assign sum[2] = pro[2] ^ carry[1];
    assign sum[3] = pro[3] ^ carry[2];
    assign c_out = carry[3];
    
endmodule
