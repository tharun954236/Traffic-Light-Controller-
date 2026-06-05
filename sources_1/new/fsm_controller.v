`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 15:02:11
// Design Name: 
// Module Name: fsm_controller
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

module fsm_controller(
    input clk,
    input reset,
    input emergency,
    output reg [2:0] NS,
    output reg [2:0] EW
);

// State encoding
parameter S0 = 2'b00; // NS Green, EW Red
parameter S1 = 2'b01; // NS Yellow, EW Red
parameter S2 = 2'b10; // NS Red, EW Green
parameter S3 = 2'b11; // NS Red, EW Yellow

reg [1:0] state, next_state;

// State register
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end

// Next state logic
always @(*) begin
    if (emergency) begin
        next_state = S0;  // Priority to NS road
    end else begin
        case(state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end
end

// Output logic
always @(*) begin
    case(state)
        S0: begin
            NS = 3'b100; // Green
            EW = 3'b001; // Red
        end
        S1: begin
            NS = 3'b010; // Yellow
            EW = 3'b001; // Red
        end
        S2: begin
            NS = 3'b001; // Red
            EW = 3'b100; // Green
        end
        S3: begin
            NS = 3'b001; // Red
            EW = 3'b010; // Yellow
        end
        default: begin
            NS = 3'b001;
            EW = 3'b001;
        end
    endcase
end

endmodule