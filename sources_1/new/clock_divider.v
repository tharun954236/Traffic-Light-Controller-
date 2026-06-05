`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 15:03:35
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clk,
    input reset,
    output reg slow_clk
);

reg [25:0] count;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
        slow_clk <= 0;
    end else begin
        count <= count + 1;
        if (count == 26'd50000000) begin // adjust for simulation
            slow_clk <= ~slow_clk;
            count <= 0;
        end
    end
end

endmodule
