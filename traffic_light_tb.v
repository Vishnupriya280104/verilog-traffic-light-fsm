`timescale 1ns/1ps

module traffic_light_tb;

    reg clk, rst;
    wire red, yellow, green;

    traffic_light dut (
        .clk(clk),
        .rst(rst),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Clock generation (10ns)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #20 rst = 0;

        #300 $finish;
    end

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_tb);

        $monitor("Time=%0t | R=%b G=%b Y=%b",
                  $time, red, green, yellow);
    end

endmodule
