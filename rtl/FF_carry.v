`timescale 1ns / 1ps



module FF_carry(
    input       i_clk,
    input       i_data,
    
    output reg      o_data
    );
    
    always@(posedge i_clk)begin
        o_data <= i_data;
    end
endmodule
