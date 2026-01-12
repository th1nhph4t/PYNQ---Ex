`timescale 1ns / 1ps
//////////////////////////////////////////


module muladdtree3x3 (
    input clk,
    input result_rdy, // Input to indicate readiness for convolution
    input pixel_end,
    input [7:0] kernel0,
    input [7:0] kernel1,
    input [7:0] kernel2,
    input [7:0] kernel3,
    input [7:0] kernel4,
    input [7:0] kernel5,
    input [7:0] kernel6,
    input [7:0] kernel7,
    input [7:0] kernel8,
     // 3x3 kernel = 9
    input [7:0] lb_ready0, 
    input [7:0] lb_ready1,
    input [7:0] lb_ready2,
    input [7:0] lb_ready3,
    input [7:0] lb_ready4,
    input [7:0] lb_ready5,
    input [7:0] lb_ready6,
    input [7:0] lb_ready7,
    input [7:0] lb_ready8,
    // 3x3 line buffer
    output reg [20:0] convolved_result, // Convolution result
    output reg [7:0] flipped_kernel0,
    output reg [7:0] flipped_kernel1,
    output reg [7:0] flipped_kernel2,
    output reg [7:0] flipped_kernel3,
    output reg [7:0] flipped_kernel4,
    output reg [7:0] flipped_kernel5,
    output reg [7:0] flipped_kernel6,
    output reg [7:0] flipped_kernel7,
    output reg [7:0] flipped_kernel8,
    output reg res_conv = 0 // Signal to indicate convolution completion
);


reg [20:0] accumulator;
//reg [7:0] flipped_kernel [8:0]; // Flipped kernel matrix

always @(negedge clk) begin
    if (result_rdy||(!res_conv)) begin
        // Flip the kernel matrix
                flipped_kernel0 = kernel8;
                flipped_kernel1 = kernel7;
                flipped_kernel2 = kernel6;
                flipped_kernel3 = kernel5;
                flipped_kernel4 = kernel4;
                flipped_kernel5 = kernel3;
                flipped_kernel6 = kernel2;
                flipped_kernel7 = kernel1;
                flipped_kernel8 = kernel0;
                

        // Initialize accumulator
        accumulator = 0;
        
        // Perform dot product between flipped kernel and line buffer
        
                accumulator =  (flipped_kernel0 * lb_ready0) + (flipped_kernel1 * lb_ready1) + (flipped_kernel2 * lb_ready2) + (flipped_kernel3 * lb_ready3) + (flipped_kernel4 * lb_ready4) + (flipped_kernel5 * lb_ready5) + (flipped_kernel6 * lb_ready6) + (flipped_kernel7 * lb_ready7) + (flipped_kernel8 * lb_ready8);
        

        // Set convolution result and indicate completion
        convolved_result <= accumulator;
        res_conv <= 1; // Convolution is done
    end else begin
        res_conv <= 0; // Wait for result_rdy
    end
end

endmodule
