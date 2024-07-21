`timescale 1ns / 1ps


module FF_16bit(
    input               i_clk,
    input [15:0]        i_data,
    output reg [15:0]   o_data
    );
    
    always@(posedge i_clk)begin
        o_data <= i_data;
    end
endmodule
