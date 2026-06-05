`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 15:04:44
// Design Name: 
// Module Name: tlc_top
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

module tlc_top(
    input clk,
    input reset,
    input emergency,
    output [2:0] NS,
    output [2:0] EW
);

wire slow_clk;

clock_divider cd (
    .clk(clk),
    .reset(reset),
    .slow_clk(slow_clk)
);

fsm_controller fsm (
    .clk(clk),
    .reset(reset),
    .emergency(emergency),
    .NS(NS),
    .EW(EW)
);

endmodule
