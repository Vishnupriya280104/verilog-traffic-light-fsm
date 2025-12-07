`timescale 1ns/1ps

module traffic_light (
    input  clk,
    input  rst,
    output reg red,
    output reg yellow,
    output reg green
);

    // State encoding
    parameter RED    = 2'b00;
    parameter GREEN  = 2'b01;
    parameter YELLOW = 2'b10;

    reg [1:0] state, next_state;
    reg [3:0] timer;   // to count cycles

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RED;
            timer <= 0;
        end else begin
            state <= next_state;
            timer <= (state != next_state) ? 0 : timer + 1;
        end
    end

    // Next state logic
    always @(*) begin
        next_state = state;

        case (state)
            RED: begin
                if (timer == 9)
                    next_state = GREEN;
            end

            GREEN: begin
                if (timer == 9)
                    next_state = YELLOW;
            end

            YELLOW: begin
                if (timer == 4)
                    next_state = RED;
            end

            default: next_state = RED;
        endcase
    end

    // Output logic (Moore FSM)
    always @(*) begin
        red    = 0;
        green  = 0;
        yellow = 0;

        case (state)
            RED:    red    = 1;
            GREEN:  green  = 1;
            YELLOW: yellow = 1;
        endcase
    end

endmodule
