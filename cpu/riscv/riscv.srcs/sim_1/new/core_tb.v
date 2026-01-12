`timescale 1ps / 1ps
module core_tb;
    reg rst;
    reg clk;
    wire [7:0] data_out;

    // Instantiate the core module
    core DUT (
        .rst(rst),
        .clk(clk),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        #150;
        repeat(49) begin
            clk = 1'b1;
            #50;
            clk = 1'b0;
            #50;
        end
        clk = 1'b1;
        #50;
    end

    // Reset generation
    initial begin
        rst = 1'b0;
        #100;
        rst = 1'b1;
        #5000;
    end

    // End simulation
    initial begin
        #5500 $finish;
    end 
endmodule
