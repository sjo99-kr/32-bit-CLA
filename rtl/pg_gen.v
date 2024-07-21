`timescale 1ns / 1ps



module pg_gen(
    input   a,
    input   b,
    
    output  p,
    output  g,
    output  s
    );
    
    assign p = a ^ b;
    assign g = a & b;
endmodule
