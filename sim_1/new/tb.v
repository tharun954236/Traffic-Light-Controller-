`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 15:05:44
// Design Name: 
// Module Name: tb
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


module tb;

reg clk;
reg reset;
reg emergency;
wire [2:0] NS;
wire [2:0] EW;

tlc_top uut (
    .clk(clk),
    .reset(reset),
    .emergency(emergency),
    .NS(NS),
    .EW(EW)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    emergency = 0;

    #20 reset = 0;

    // Let FSM run
    #200;

    // Trigger emergency
    emergency = 1;
    #50;
    emergency = 0;

    #200;

    $stop;
end

endmodule