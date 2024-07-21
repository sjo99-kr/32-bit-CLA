`timescale 1ns / 1ps


module FF_4bit(
    input   [3:0]    i_data,
    input            i_clk,
    
    
    output reg [3:0]     o_data
    );
    
    always@(posedge i_clk)begin
        o_data <= i_data;
        
    end
endmodule
